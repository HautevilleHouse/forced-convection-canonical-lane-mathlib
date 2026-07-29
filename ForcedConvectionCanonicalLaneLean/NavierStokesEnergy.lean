import ForcedConvectionCanonicalLaneLean.AdmissibleClass

/-!
# Navier-Stokes and Energy Equation Package
-/

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure NavierStokesEnergyPackage where
  incompressibility : Prop
  momentumEquation : Prop
  thermalEnergyEquation : Prop
  boundedness : Prop

structure NavierStokesEnergyEvidence (P : NavierStokesEnergyPackage) where
  incompressibilityClosed : P.incompressibility
  momentumEquationClosed : P.momentumEquation
  thermalEnergyEquationClosed : P.thermalEnergyEquation
  boundednessClosed : P.boundedness

def NavierStokesEnergyClosed (P : NavierStokesEnergyPackage) : Prop :=
  P.incompressibility ∧ P.momentumEquation ∧ P.thermalEnergyEquation ∧ P.boundedness

theorem navier_stokes_energy_closed_from_evidence (P : NavierStokesEnergyPackage)
    (E : NavierStokesEnergyEvidence P) : NavierStokesEnergyClosed P := by
  exact And.intro E.incompressibilityClosed
    (And.intro E.momentumEquationClosed
      (And.intro E.thermalEnergyEquationClosed E.boundednessClosed))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
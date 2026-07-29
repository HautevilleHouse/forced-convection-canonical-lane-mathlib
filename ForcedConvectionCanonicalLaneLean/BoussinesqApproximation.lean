import ForcedConvectionCanonicalLaneLean.NavierStokesEnergy

/-!
# Boussinesq Approximation Package
-/

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure BoussinesqApproximationPackage {N : NavierStokesEnergyPackage} where
  densityVariationLinear : Prop
  buoyancyForce : Prop
  temperaturePerturbation : Prop
  couplingConsistent : Prop

structure BoussinesqApproximationEvidence {N : NavierStokesEnergyPackage}
    (B : BoussinesqApproximationPackage N) where
  densityVariationLinearClosed : B.densityVariationLinear
  buoyancyForceClosed : B.buoyancyForce
  temperaturePerturbationClosed : B.temperaturePerturbation
  couplingConsistentClosed : B.couplingConsistent

def BoussinesqApproximationClosed {N : NavierStokesEnergyPackage}
    (B : BoussinesqApproximationPackage N) : Prop :=
  B.densityVariationLinear ∧ B.buoyancyForce ∧ B.temperaturePerturbation ∧ B.couplingConsistent

theorem boussinesq_approximation_closed_from_evidence {N : NavierStokesEnergyPackage}
    (B : BoussinesqApproximationPackage N) (E : BoussinesqApproximationEvidence B) :
    BoussinesqApproximationClosed B := by
  exact And.intro E.densityVariationLinearClosed
    (And.intro E.buoyancyForceClosed
      (And.intro E.temperaturePerturbationClosed E.couplingConsistentClosed))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
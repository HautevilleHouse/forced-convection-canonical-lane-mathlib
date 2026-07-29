import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure BoussinesqSystem where
  fluidDensity : Type
  temperature : Type
  velocity : Type
  buoyancyForce : Prop
  incompressibility : Prop
  energyBalance : Prop
  boussinesqApproximation : Prop

structure BoussinesqEvidence (B : BoussinesqSystem) where
  buoyancyForceClosed : B.buoyancyForce
  incompressibilityClosed : B.incompressibility
  energyBalanceClosed : B.energyBalance
  boussinesqApproximationClosed : B.boussinesqApproximation

def BoussinesqClosed (B : BoussinesqSystem) : Prop :=
  B.buoyancyForce ∧ B.incompressibility ∧ B.energyBalance ∧ B.boussinesqApproximation

theorem boussinesq_closed_from_evidence (B : BoussinesqSystem) (E : BoussinesqEvidence B) :
    BoussinesqClosed B := by
  exact And.intro E.buoyancyForceClosed
    (And.intro E.incompressibilityClosed
      (And.intro E.energyBalanceClosed E.boussinesqApproximationClosed))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse

import ForcedConvectionCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

def ConstrainedForcedConvectionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_forced_convection_endgame (A : AdmissibleClass) :
    ConstrainedForcedConvectionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
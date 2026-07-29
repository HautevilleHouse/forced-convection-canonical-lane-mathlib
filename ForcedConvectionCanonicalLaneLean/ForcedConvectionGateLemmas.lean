import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

def gateClosed (A : ForcedConvectionAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : ForcedConvectionAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse

import ForcedConvectionCanonicalLaneLean.ForcedConvectionDomain

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure AdmissibleClass where
  object : ForcedConvectionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ForcedConvectionWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
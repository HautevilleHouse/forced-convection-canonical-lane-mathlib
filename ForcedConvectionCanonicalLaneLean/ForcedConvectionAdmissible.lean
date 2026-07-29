import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure ForcedConvectionObject where
  flowDomain : Type
  fluidProperties : Prop
  temperatureField : Prop
  velocityField : Prop
  coupledEquations : Prop
  boundaryConditions : Prop

structure ForcedConvectionAdmittedObject where
  object : ForcedConvectionObject
  problemWellPosed : Prop
  wellPosedProof : problemWellPosed

structure ForcedConvectionAdmissibleClass where
  object : ForcedConvectionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : ForcedConvectionAdmissibleClass) : Prop :=
  wellPosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse

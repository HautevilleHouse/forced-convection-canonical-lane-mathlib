import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure ForcedConvectionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ForcedConvectionAdmittedObject where
  space : ForcedConvectionSpace
  boundedDomain : Prop
  incompressibleFlow : Prop
  thermalCoupling : Prop
  conclusion : boundedDomain ∧ incompressibleFlow ∧ thermalCoupling

structure ForcedConvectionEndgameState where
  object : ForcedConvectionAdmittedObject

def ForcedConvectionWitnessClosed (O : ForcedConvectionAdmittedObject) : Prop :=
  O.boundedDomain ∧ O.incompressibleFlow ∧ O.thermalCoupling

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure ForcedConvectionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ForcedConvectionAdmittedObject where
  space : ForcedConvectionSpace
  fluidDomain : Prop
  temperatureDefined : Prop
  velocityDefined : Prop
  governingEquations : Prop
  conclusion : governingEquations

structure ForcedConvectionEndgameState where
  object : ForcedConvectionAdmittedObject

def wellPosed (O : ForcedConvectionAdmittedObject) : Prop :=
  O.governingEquations

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse

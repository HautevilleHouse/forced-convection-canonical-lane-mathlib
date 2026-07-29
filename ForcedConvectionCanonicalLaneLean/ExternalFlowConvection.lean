import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure ExternalFlowConvectionPackage where
  flatPlateLaminar : Prop
  flatPlateTurbulent : Prop
  cylinderCrossFlow : Prop
  sphereFlow : Prop
  tubeBankFlow : Prop
  dragCoefficient : Prop

structure ExternalFlowConvectionEvidence (P : ExternalFlowConvectionPackage) where
  flatPlateLaminarClosed : P.flatPlateLaminar
  flatPlateTurbulentClosed : P.flatPlateTurbulent
  cylinderCrossFlowClosed : P.cylinderCrossFlow
  sphereFlowClosed : P.sphereFlow
  tubeBankFlowClosed : P.tubeBankFlow
  dragCoefficientClosed : P.dragCoefficient

def ExternalFlowConvectionClosed (P : ExternalFlowConvectionPackage) : Prop :=
  P.flatPlateLaminar ∧ P.flatPlateTurbulent ∧ P.cylinderCrossFlow ∧
  P.sphereFlow ∧ P.tubeBankFlow ∧ P.dragCoefficient

theorem external_flow_convection_closed_from_evidence
    (P : ExternalFlowConvectionPackage) (E : ExternalFlowConvectionEvidence P) :
    ExternalFlowConvectionClosed P := by
  exact And.intro E.flatPlateLaminarClosed
    (And.intro E.flatPlateTurbulentClosed
      (And.intro E.cylinderCrossFlowClosed
        (And.intro E.sphereFlowClosed
          (And.intro E.tubeBankFlowClosed E.dragCoefficientClosed))))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure HeatTransferCoefficientPackage where
  nusseltNumber : Prop
  correlationType : String
  heatFlux : Prop
  temperatureDifference : Prop
  heatTransferClosed : Prop

structure HeatTransferEvidence (H : HeatTransferCoefficientPackage) where
  nusseltNumberClosed : H.nusseltNumber
  heatFluxClosed : H.heatFlux
  temperatureDifferenceClosed : H.temperatureDifference
  heatTransferClosedFromEvidence : H.heatTransferClosed

def HeatTransferClosed (H : HeatTransferCoefficientPackage) : Prop :=
  H.nusseltNumber ∧ H.heatFlux ∧ H.temperatureDifference ∧ H.heatTransferClosed

theorem heat_transfer_closed_from_evidence (H : HeatTransferCoefficientPackage) (E : HeatTransferEvidence H) :
    HeatTransferClosed H := by
  exact And.intro E.nusseltNumberClosed
    (And.intro E.heatFluxClosed
      (And.intro E.temperatureDifferenceClosed E.heatTransferClosedFromEvidence))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse

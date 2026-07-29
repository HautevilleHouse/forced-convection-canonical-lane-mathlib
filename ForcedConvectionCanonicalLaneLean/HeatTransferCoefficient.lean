import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure HeatTransferCoefficientPackage where
  localCoefficient : Prop
  averageCoefficient : Prop
  nusseltCorrelation : Prop
  thermalBoundaryLayer : Prop
  convectionResistance : Prop

structure HeatTransferCoefficientEvidence (P : HeatTransferCoefficientPackage) where
  localCoefficientClosed : P.localCoefficient
  averageCoefficientClosed : P.averageCoefficient
  nusseltCorrelationClosed : P.nusseltCorrelation
  thermalBoundaryLayerClosed : P.thermalBoundaryLayer
  convectionResistanceClosed : P.convectionResistance

def HeatTransferCoefficientClosed (P : HeatTransferCoefficientPackage) : Prop :=
  P.localCoefficient ∧ P.averageCoefficient ∧ P.nusseltCorrelation ∧
  P.thermalBoundaryLayer ∧ P.convectionResistance

theorem heat_transfer_coefficient_closed_from_evidence
    (P : HeatTransferCoefficientPackage) (E : HeatTransferCoefficientEvidence P) :
    HeatTransferCoefficientClosed P := by
  exact And.intro E.localCoefficientClosed
    (And.intro E.averageCoefficientClosed
      (And.intro E.nusseltCorrelationClosed
        (And.intro E.thermalBoundaryLayerClosed E.convectionResistanceClosed)))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
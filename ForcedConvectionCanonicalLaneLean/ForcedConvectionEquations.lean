import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure ForcedConvectionParameterPackage where
  reynoldsNumber : ℝ
  prandtlNumber : ℝ
  thermalBoundaryLayerThickness : ℝ
  nusseltNumberCorrelation : ℝ

structure HeatTransferCoefficientPackage (P : ForcedConvectionParameterPackage) where
  flowRegime : String
  localNusseltNumber : ℝ → ℝ
  averageNusseltNumber : ℝ
  heatTransferCoefficient : ℝ

structure HeatTransferCoefficientEvidence {P : ForcedConvectionParameterPackage}
    (H : HeatTransferCoefficientPackage P) where
  flowRegimeClosed : H.flowRegime = "laminar" ∨ H.flowRegime = "turbulent"
  localNusseltDerived : ∀ x : ℝ, H.localNusseltNumber x > 0
  averageNusseltClosed : H.averageNusselt > 0
  heatTransferCoefficientClosed : H.heatTransferCoefficient > 0

def HeatTransferCoefficientClosed {P : ForcedConvectionParameterPackage}
    (H : HeatTransferCoefficientPackage P) : Prop :=
  (H.flowRegime = "laminar" ∨ H.flowRegime = "turbulent") ∧
  (∀ x : ℝ, H.localNusseltNumber x > 0) ∧
  H.averageNusselt > 0 ∧
  H.heatTransferCoefficient > 0

theorem heat_transfer_coefficient_closed_from_evidence
    {P : ForcedConvectionParameterPackage} (H : HeatTransferCoefficientPackage P)
    (E : HeatTransferCoefficientEvidence H) : HeatTransferCoefficientClosed H := by
  exact And.intro E.flowRegimeClosed
    (And.intro E.localNusseltDerived
      (And.intro E.averageNusseltClosed E.heatTransferCoefficientClosed))

end HautevilleHouse.ForcedConvectionCanonicalLaneLean
end HautevilleHouse
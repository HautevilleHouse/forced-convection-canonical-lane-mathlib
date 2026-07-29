import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure ThermalBoundaryLayerPackage where
  velocityBoundaryLayerThickness : ℝ
  thermalBoundaryLayerThickness : ℝ
  prandtlNumber : ℝ
  similaritySolution : Prop

structure ThermalBoundaryLayerEvidence (T : ThermalBoundaryLayerPackage) where
  thicknessRelationClosed : T.thermalBoundaryLayerThickness = T.velocityBoundaryLayerThickness / (T.prandtlNumber^(1/3 : ℝ))
  similaritySolutionClosed : T.similaritySolution

def ThermalBoundaryLayerClosed (T : ThermalBoundaryLayerPackage) : Prop :=
  T.thermalBoundaryLayerThickness = T.velocityBoundaryLayerThickness / (T.prandtlNumber^(1/3 : ℝ)) ∧
  T.similaritySolution

theorem thermal_boundary_layer_closed_from_evidence
    (T : ThermalBoundaryLayerPackage) (E : ThermalBoundaryLayerEvidence T) :
    ThermalBoundaryLayerClosed T := by
  exact And.intro E.thicknessRelationClosed E.similaritySolutionClosed

end HautevilleHouse.ForcedConvectionCanonicalLaneLean
end HautevilleHouse
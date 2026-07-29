import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure InternalFlowForcedConvectionPackage {G : FluidDynamicsPackage} {F : ForcedConvectionPDEPackage G}
  {T : ThermalBoundaryLayerPackage F} {D : DimensionlessGroupsPackage}
  {C : ForcedConvectionCorrelationPackage T D} where
  fullyDevelopedFlow : Prop
  pipeFlowHeatTransfer : Prop
  channelFlowHeatTransfer : Prop
  entranceRegionEffect : Prop

def InternalFlowForcedConvectionClosed {G : FluidDynamicsPackage} {F : ForcedConvectionPDEPackage G}
  {T : ThermalBoundaryLayerPackage F} {D : DimensionlessGroupsPackage}
  {C : ForcedConvectionCorrelationPackage T D}
  (I : InternalFlowForcedConvectionPackage C) : Prop :=
  I.fullyDevelopedFlow ∧ I.pipeFlowHeatTransfer ∧ I.channelFlowHeatTransfer ∧ I.entranceRegionEffect

theorem internal_flow_forced_convection_closed {G : FluidDynamicsPackage}
  {F : ForcedConvectionPDEPackage G} {T : ThermalBoundaryLayerPackage F}
  {D : DimensionlessGroupsPackage} {C : ForcedConvectionCorrelationPackage T D}
  (I : InternalFlowForcedConvectionPackage C) : InternalFlowForcedConvectionClosed I := by
  exact And.intro I.fullyDevelopedFlow
    (And.intro I.pipeFlowHeatTransfer
      (And.intro I.channelFlowHeatTransfer I.entranceRegionEffect))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
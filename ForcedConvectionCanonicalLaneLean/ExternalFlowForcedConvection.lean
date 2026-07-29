import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure ExternalFlowForcedConvectionPackage {G : FluidDynamicsPackage} {F : ForcedConvectionPDEPackage G}
  {T : ThermalBoundaryLayerPackage F} {D : DimensionlessGroupsPackage}
  {C : ForcedConvectionCorrelationPackage T D} where
  flowOverPlate : Prop
  flowOverCylinder : Prop
  flowOverSphere : Prop
  tubeBanksHeatTransfer : Prop

def ExternalFlowForcedConvectionClosed {G : FluidDynamicsPackage} {F : ForcedConvectionPDEPackage G}
  {T : ThermalBoundaryLayerPackage F} {D : DimensionlessGroupsPackage}
  {C : ForcedConvectionCorrelationPackage T D}
  (E : ExternalFlowForcedConvectionPackage C) : Prop :=
  E.flowOverPlate ∧ E.flowOverCylinder ∧ E.flowOverSphere ∧ E.tubeBanksHeatTransfer

theorem external_flow_forced_convection_closed {G : FluidDynamicsPackage}
  {F : ForcedConvectionPDEPackage G} {T : ThermalBoundaryLayerPackage F}
  {D : DimensionlessGroupsPackage} {C : ForcedConvectionCorrelationPackage T D}
  (E : ExternalFlowForcedConvectionPackage C) : ExternalFlowForcedConvectionClosed E := by
  exact And.intro E.flowOverPlate
    (And.intro E.flowOverCylinder
      (And.intro E.flowOverSphere E.tubeBanksHeatTransfer))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
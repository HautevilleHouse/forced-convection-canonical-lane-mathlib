import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure ForcedConvectionCorrelationPackage {G : FluidDynamicsPackage} {F : ForcedConvectionPDEPackage G}
  {T : ThermalBoundaryLayerPackage F} {D : DimensionlessGroupsPackage} where
  dittusBoelterCorrelation : Prop
  gnielinskiCorrelation : Prop
  chiltonColburnAnalogy : Prop
  flatPlateCorrelation : Prop

def ForcedConvectionCorrelationClosed {G : FluidDynamicsPackage} {F : ForcedConvectionPDEPackage G}
  {T : ThermalBoundaryLayerPackage F} {D : DimensionlessGroupsPackage}
  (C : ForcedConvectionCorrelationPackage T D) : Prop :=
  C.dittusBoelterCorrelation ∧ C.gnielinskiCorrelation ∧ C.chiltonColburnAnalogy ∧ C.flatPlateCorrelation

theorem forced_convection_correlation_closed {G : FluidDynamicsPackage}
  {F : ForcedConvectionPDEPackage G} {T : ThermalBoundaryLayerPackage F}
  {D : DimensionlessGroupsPackage} (C : ForcedConvectionCorrelationPackage T D) :
  ForcedConvectionCorrelationClosed C := by
  exact And.intro C.dittusBoelterCorrelation
    (And.intro C.gnielinskiCorrelation
      (And.intro C.chiltonColburnAnalogy C.flatPlateCorrelation))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
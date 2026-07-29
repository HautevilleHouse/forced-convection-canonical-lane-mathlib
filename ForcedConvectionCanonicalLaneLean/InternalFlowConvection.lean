import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure InternalFlowConvectionPackage where
  fullyDevelopedFlow : Prop
  hydrodynamicEntrance : Prop
  thermalEntrance : Prop
  constantWallTemperature : Prop
  constantHeatFlux : Prop
  frictionFactor : Prop

structure InternalFlowConvectionEvidence (P : InternalFlowConvectionPackage) where
  fullyDevelopedFlowClosed : P.fullyDevelopedFlow
  hydrodynamicEntranceClosed : P.hydrodynamicEntrance
  thermalEntranceClosed : P.thermalEntrance
  constantWallTemperatureClosed : P.constantWallTemperature
  constantHeatFluxClosed : P.constantHeatFlux
  frictionFactorClosed : P.frictionFactor

def InternalFlowConvectionClosed (P : InternalFlowConvectionPackage) : Prop :=
  P.fullyDevelopedFlow ∧ P.hydrodynamicEntrance ∧ P.thermalEntrance ∧
  P.constantWallTemperature ∧ P.constantHeatFlux ∧ P.frictionFactor

theorem internal_flow_convection_closed_from_evidence
    (P : InternalFlowConvectionPackage) (E : InternalFlowConvectionEvidence P) :
    InternalFlowConvectionClosed P := by
  exact And.intro E.fullyDevelopedFlowClosed
    (And.intro E.hydrodynamicEntranceClosed
      (And.intro E.thermalEntranceClosed
        (And.intro E.constantWallTemperatureClosed
          (And.intro E.constantHeatFluxClosed E.frictionFactorClosed))))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
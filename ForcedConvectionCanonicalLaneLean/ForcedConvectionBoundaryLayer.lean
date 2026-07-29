import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure BoundaryLayer where
  thermalLayerThickness : Prop
  velocityLayerThickness : Prop
  boundaryLayerEquations : Prop
  couplingCondition : Prop

structure BoundaryLayerEvidence (B : BoundaryLayer) where
  thermalThicknessClosed : B.thermalLayerThickness
  velocityThicknessClosed : B.velocityLayerThickness
  equationsClosed : B.boundaryLayerEquations
  couplingClosed : B.couplingCondition

def BoundaryLayerClosed (B : BoundaryLayer) : Prop :=
  B.thermalLayerThickness ∧ B.velocityLayerThickness ∧
  B.boundaryLayerEquations ∧ B.couplingCondition

theorem boundary_layer_closed_from_evidence (B : BoundaryLayer)
    (E : BoundaryLayerEvidence B) : BoundaryLayerClosed B := by
  exact And.intro E.thermalThicknessClosed
    (And.intro E.velocityThicknessClosed
      (And.intro E.equationsClosed E.couplingClosed))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse

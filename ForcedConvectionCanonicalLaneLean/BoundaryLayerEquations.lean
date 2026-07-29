import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure BoundaryLayerEquationsPackage where
  continuityEquation : Prop
  momentumEquation : Prop
  energyEquation : Prop
  convectionTerm : Prop
  diffusionTerm : Prop
  boundaryConditions : Prop

structure BoundaryLayerEquationsEvidence (P : BoundaryLayerEquationsPackage) where
  continuityEquationClosed : P.continuityEquation
  momentumEquationClosed : P.momentumEquation
  energyEquationClosed : P.energyEquation
  convectionTermClosed : P.convectionTerm
  diffusionTermClosed : P.diffusionTerm
  boundaryConditionsClosed : P.boundaryConditions

def BoundaryLayerEquationsClosed (P : BoundaryLayerEquationsPackage) : Prop :=
  P.continuityEquation ∧ P.momentumEquation ∧ P.energyEquation ∧
  P.convectionTerm ∧ P.diffusionTerm ∧ P.boundaryConditions

theorem boundary_layer_equations_closed_from_evidence
    (P : BoundaryLayerEquationsPackage) (E : BoundaryLayerEquationsEvidence P) :
    BoundaryLayerEquationsClosed P := by
  exact And.intro E.continuityEquationClosed
    (And.intro E.momentumEquationClosed
      (And.intro E.energyEquationClosed
        (And.intro E.convectionTermClosed
          (And.intro E.diffusionTermClosed E.boundaryConditionsClosed))))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
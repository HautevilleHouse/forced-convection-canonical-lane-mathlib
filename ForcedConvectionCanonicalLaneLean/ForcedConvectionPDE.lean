import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure ForcedConvectionPDE where
  momentumEquation : Prop
  energyEquation : Prop
  couplingTerm : Prop
  initialConditions : Prop
  boundaryConditions : Prop

structure ForcedConvectionPDEEvidence (P : ForcedConvectionPDE) where
  momentumEquationClosed : P.momentumEquation
  energyEquationClosed : P.energyEquation
  couplingTermClosed : P.couplingTerm
  initialConditionsClosed : P.initialConditions
  boundaryConditionsClosed : P.boundaryConditions

def ForcedConvectionPDEClosed (P : ForcedConvectionPDE) : Prop :=
  P.momentumEquation ∧ P.energyEquation ∧ P.couplingTerm ∧
  P.initialConditions ∧ P.boundaryConditions

theorem forced_convection_pde_closed_from_evidence (P : ForcedConvectionPDE)
    (E : ForcedConvectionPDEEvidence P) : ForcedConvectionPDEClosed P := by
  exact And.intro E.momentumEquationClosed
    (And.intro E.energyEquationClosed
      (And.intro E.couplingTermClosed
        (And.intro E.initialConditionsClosed E.boundaryConditionsClosed)))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse

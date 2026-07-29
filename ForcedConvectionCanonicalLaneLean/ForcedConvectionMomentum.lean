import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure MomentumEquationPackage where
  navierStokesEquation : Prop
  convectionTerm : Prop
  diffusionTerm : Prop
  pressureGradient : Prop
  forcingTerm : Prop

structure MomentumEquationEvidence (M : MomentumEquationPackage) where
  navierStokesEquationClosed : M.navierStokesEquation
  convectionTermClosed : M.convectionTerm
  diffusionTermClosed : M.diffusionTerm
  pressureGradientClosed : M.pressureGradient
  forcingTermClosed : M.forcingTerm

def MomentumEquationClosed (M : MomentumEquationPackage) : Prop :=
  M.navierStokesEquation ∧ M.convectionTerm ∧ M.diffusionTerm ∧ M.pressureGradient ∧ M.forcingTerm

theorem momentum_equation_closed_from_evidence (M : MomentumEquationPackage) (E : MomentumEquationEvidence M) :
    MomentumEquationClosed M := by
  exact And.intro E.navierStokesEquationClosed
    (And.intro E.convectionTermClosed
      (And.intro E.diffusionTermClosed
        (And.intro E.pressureGradientClosed E.forcingTermClosed)))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse

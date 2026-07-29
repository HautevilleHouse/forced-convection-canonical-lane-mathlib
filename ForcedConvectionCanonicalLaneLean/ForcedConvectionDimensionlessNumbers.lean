import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure DimensionlessNumbers where
  reynoldsNumber : ℝ
  prandtlNumber : ℝ
  pecletNumber : ℝ
  physicsConsistent : Prop

structure DimensionlessNumbersEvidence (D : DimensionlessNumbers) where
  reynoldsPositive : D.reynoldsNumber > 0
  prandtlPositive : D.prandtlNumber > 0
  pecletPositive : D.pecletNumber > 0
  consistencyClosed : D.physicsConsistent

def DimensionlessNumbersClosed (D : DimensionlessNumbers) : Prop :=
  D.reynoldsNumber > 0 ∧ D.prandtlNumber > 0 ∧ D.pecletNumber > 0 ∧ D.physicsConsistent

theorem dimensionless_numbers_closed_from_evidence (D : DimensionlessNumbers)
    (E : DimensionlessNumbersEvidence D) : DimensionlessNumbersClosed D := by
  exact And.intro E.reynoldsPositive
    (And.intro E.prandtlPositive
      (And.intro E.pecletPositive E.consistencyClosed))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse

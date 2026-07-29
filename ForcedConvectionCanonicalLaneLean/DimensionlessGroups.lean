import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure DimensionlessGroupsPackage where
  reynoldsNumber : ℝ
  prandtlNumber : ℝ
  nusseltNumber : ℝ
  pecletNumber : ℝ
  grashofNumber : ℝ
  reynoldsDefined : Prop
  prandtlDefined : Prop
  nusseltDefined : Prop
  pecletDefined : Prop
  grashofDefined : Prop

structure DimensionlessGroupsEvidence (D : DimensionlessGroupsPackage) where
  reynoldsDefinedClosed : D.reynoldsDefined
  prandtlDefinedClosed : D.prandtlDefined
  nusseltDefinedClosed : D.nusseltDefined
  pecletDefinedClosed : D.pecletDefined
  grashofDefinedClosed : D.grashofDefined

def DimensionlessGroupsClosed (D : DimensionlessGroupsPackage) : Prop :=
  D.reynoldsDefined ∧ D.prandtlDefined ∧ D.nusseltDefined ∧ D.pecletDefined ∧ D.grashofDefined

theorem dimensionless_groups_closed_from_evidence
    (D : DimensionlessGroupsPackage) (E : DimensionlessGroupsEvidence D) :
    DimensionlessGroupsClosed D := by
  exact And.intro E.reynoldsDefinedClosed
    (And.intro E.prandtlDefinedClosed
      (And.intro E.nusseltDefinedClosed
        (And.intro E.pecletDefinedClosed E.grashofDefinedClosed)))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure DimensionlessNumbersPackage where
  reynoldsNumber : Prop
  prandtlNumber : Prop
  nusseltNumber : Prop
  pecletNumber : Prop
  grashofNumber : Prop
  rayleighNumber : Prop

structure DimensionlessNumbersEvidence (D : DimensionlessNumbersPackage) where
  reynoldsNumberClosed : D.reynoldsNumber
  prandtlNumberClosed : D.prandtlNumber
  nusseltNumberClosed : D.nusseltNumber
  pecletNumberClosed : D.pecletNumber
  grashofNumberClosed : D.grashofNumber
  rayleighNumberClosed : D.rayleighNumber

def DimensionlessNumbersClosed (D : DimensionlessNumbersPackage) : Prop :=
  D.reynoldsNumber ∧ D.prandtlNumber ∧ D.nusseltNumber ∧ D.pecletNumber ∧ D.grashofNumber ∧ D.rayleighNumber

theorem dimensionless_numbers_closed_from_evidence (D : DimensionlessNumbersPackage) (E : DimensionlessNumbersEvidence D) :
    DimensionlessNumbersClosed D := by
  exact And.intro E.reynoldsNumberClosed
    (And.intro E.prandtlNumberClosed
      (And.intro E.nusseltNumberClosed
        (And.intro E.pecletNumberClosed
          (And.intro E.grashofNumberClosed E.rayleighNumberClosed))))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse

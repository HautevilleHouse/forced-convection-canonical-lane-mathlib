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

structure DimensionlessNumbersEvidence (P : DimensionlessNumbersPackage) where
  reynoldsNumberClosed : P.reynoldsNumber
  prandtlNumberClosed : P.prandtlNumber
  nusseltNumberClosed : P.nusseltNumber
  pecletNumberClosed : P.pecletNumber
  grashofNumberClosed : P.grashofNumber
  rayleighNumberClosed : P.rayleighNumber

def DimensionlessNumbersClosed (P : DimensionlessNumbersPackage) : Prop :=
  P.reynoldsNumber ∧ P.prandtlNumber ∧ P.nusseltNumber ∧
  P.pecletNumber ∧ P.grashofNumber ∧ P.rayleighNumber

theorem dimensionless_numbers_closed_from_evidence
    (P : DimensionlessNumbersPackage) (E : DimensionlessNumbersEvidence P) :
    DimensionlessNumbersClosed P := by
  exact And.intro E.reynoldsNumberClosed
    (And.intro E.prandtlNumberClosed
      (And.intro E.nusseltNumberClosed
        (And.intro E.pecletNumberClosed
          (And.intro E.grashofNumberClosed E.rayleighNumberClosed))))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
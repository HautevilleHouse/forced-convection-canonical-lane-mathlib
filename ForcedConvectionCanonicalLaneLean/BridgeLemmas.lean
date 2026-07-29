import ForcedConvectionCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ForcedConvectionWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
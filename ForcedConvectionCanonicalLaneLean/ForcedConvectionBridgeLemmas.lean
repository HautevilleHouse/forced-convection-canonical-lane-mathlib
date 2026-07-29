import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

def bridgeClosed (A : ForcedConvectionAdmissibleClass) : Prop :=
  wellPosed A.object

theorem bridge_from_admissible_class (A : ForcedConvectionAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.wellPosedProof

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse

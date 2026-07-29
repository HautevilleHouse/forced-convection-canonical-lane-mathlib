import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure ConvectiveHeatFluxPackage where
  newtonCoolingLaw : Prop
  convectiveHeatFlux : Prop
  thermalResistance : Prop
  logMeanTemperatureDifference : Prop
  effectivenessNTU : Prop

structure ConvectiveHeatFluxEvidence (P : ConvectiveHeatFluxPackage) where
  newtonCoolingLawClosed : P.newtonCoolingLaw
  convectiveHeatFluxClosed : P.convectiveHeatFlux
  thermalResistanceClosed : P.thermalResistance
  logMeanTemperatureDifferenceClosed : P.logMeanTemperatureDifference
  effectivenessNTUClosed : P.effectivenessNTU

def ConvectiveHeatFluxClosed (P : ConvectiveHeatFluxPackage) : Prop :=
  P.newtonCoolingLaw ∧ P.convectiveHeatFlux ∧ P.thermalResistance ∧
  P.logMeanTemperatureDifference ∧ P.effectivenessNTU

theorem convective_heat_flux_closed_from_evidence
    (P : ConvectiveHeatFluxPackage) (E : ConvectiveHeatFluxEvidence P) :
    ConvectiveHeatFluxClosed P := by
  exact And.intro E.newtonCoolingLawClosed
    (And.intro E.convectiveHeatFluxClosed
      (And.intro E.thermalResistanceClosed
        (And.intro E.logMeanTemperatureDifferenceClosed E.effectivenessNTUClosed)))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse
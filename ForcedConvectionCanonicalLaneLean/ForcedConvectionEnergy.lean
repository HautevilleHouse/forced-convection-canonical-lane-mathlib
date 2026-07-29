import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedConvectionCanonicalLaneLean

structure EnergyEquationPackage where
  energyConservation : Prop
  convectionHeatTransfer : Prop
  conductionHeatTransfer : Prop
  viscousDissipation : Prop
  internalHeatGeneration : Prop

structure EnergyEquationEvidence (E : EnergyEquationPackage) where
  energyConservationClosed : E.energyConservation
  convectionHeatTransferClosed : E.convectionHeatTransfer
  conductionHeatTransferClosed : E.conductionHeatTransfer
  viscousDissipationClosed : E.viscousDissipation
  internalHeatGenerationClosed : E.internalHeatGeneration

def EnergyEquationClosed (E : EnergyEquationPackage) : Prop :=
  E.energyConservation ∧ E.convectionHeatTransfer ∧ E.conductionHeatTransfer ∧ E.viscousDissipation ∧ E.internalHeatGeneration

theorem energy_equation_closed_from_evidence (E : EnergyEquationPackage) (Ev : EnergyEquationEvidence E) :
    EnergyEquationClosed E := by
  exact And.intro Ev.energyConservationClosed
    (And.intro Ev.convectionHeatTransferClosed
      (And.intro Ev.conductionHeatTransferClosed
        (And.intro Ev.viscousDissipationClosed Ev.internalHeatGenerationClosed)))

end ForcedConvectionCanonicalLaneLean
end HautevilleHouse

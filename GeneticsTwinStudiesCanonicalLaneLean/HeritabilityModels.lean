import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsTwinStudiesCanonicalLaneLean

structure AdditiveGeneticComponent where
  varianceExplained : Prop
  proportionOfPhenotypicVariance : Prop
  narrowSenseHeritability : Prop
  dominanceComponent : Prop
  sharedEnvironmentComponent : Prop
  uniqueEnvironmentComponent : Prop

structure ACEHeritabilityModel where
  additiveComponent : Prop
  commonEnvironment : Prop
  uniqueEnvironment : Prop
  heritabilityEstimate : Prop
  modelIdentified : Prop

structure HeritabilityEvidence (M : ACEHeritabilityModel) where
  additiveComponentClosed : M.additiveComponent
  commonEnvironmentClosed : M.commonEnvironment
  uniqueEnvironmentClosed : M.uniqueEnvironment
  heritabilityEstimateClosed : M.heritabilityEstimate
  modelIdentifiedClosed : M.modelIdentified

def HeritabilityClosed (M : ACEHeritabilityModel) : Prop :=
  M.additiveComponent ∧ M.commonEnvironment ∧ M.uniqueEnvironment ∧
  M.heritabilityEstimate ∧ M.modelIdentified

theorem heritability_closed_from_evidence (M : ACEHeritabilityModel) (E : HeritabilityEvidence M) : HeritabilityClosed M := by
  exact And.intro E.additiveComponentClosed
    (And.intro E.commonEnvironmentClosed
      (And.intro E.uniqueEnvironmentClosed
        (And.intro E.heritabilityEstimateClosed E.modelIdentifiedClosed)))

end HautevilleHouse
end GeneticsTwinStudiesCanonicalLaneLean

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsTwinStudiesCanonicalLaneLean

/-!
# Twin Heritability Package

This module defines the formal structure for twin-based heritability estimation,
including ACE models, variance decomposition, and genetic/environmental covariance.
-/

structure TwinHeritabilityModel where
  additiveGenetics : Prop
  sharedEnvironment : Prop
  nonSharedEnvironment : Prop
  additiveCovariance : Prop
  expectedMZCorrelation : Prop
  expectedDZCorrelation : Prop
  heritabilityEstimate : Prop

structure TwinHeritabilityEvidence (M : TwinHeritabilityModel) where
  additiveGeneticsClosed : M.additiveGenetics
  sharedEnvironmentClosed : M.sharedEnvironment
  nonSharedEnvironmentClosed : M.nonSharedEnvironment
  additiveCovarianceClosed : M.additiveCovariance
  expectedMZCorrelationClosed : M.expectedMZCorrelation
  expectedDZCorrelationClosed : M.expectedDZCorrelation
  heritabilityEstimateClosed : M.heritabilityEstimate

def TwinHeritabilityClosed (M : TwinHeritabilityModel) : Prop :=
  M.additiveGenetics ∧ M.sharedEnvironment ∧ M.nonSharedEnvironment ∧
  M.additiveCovariance ∧ M.expectedMZCorrelation ∧ M.expectedDZCorrelation ∧
  M.heritabilityEstimate

theorem twin_heritability_closed_from_evidence (M : TwinHeritabilityModel)
    (E : TwinHeritabilityEvidence M) : TwinHeritabilityClosed M := by
  exact And.intro E.additiveGeneticsClosed
    (And.intro E.sharedEnvironmentClosed
      (And.intro E.nonSharedEnvironmentClosed
        (And.intro E.additiveCovarianceClosed
          (And.intro E.expectedMZCorrelationClosed
            (And.intro E.expectedDZCorrelationClosed E.heritabilityEstimateClosed)))))

end GeneticsTwinStudiesCanonicalLaneLean
end HautevilleHouse
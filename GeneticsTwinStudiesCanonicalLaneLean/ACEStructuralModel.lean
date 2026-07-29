import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GeneticsTwinStudiesCanonicalLaneLean.TwinRegistry

namespace HautevilleHouse
namespace GeneticsTwinStudiesCanonicalLaneLean

structure ACEStructuralModelPackage {R : TwinRegistryPackage} where
  additiveGeneticVariance : Prop
  commonEnvironmentalVariance : Prop
  uniqueEnvironmentalVariance : Prop
  covarianceStructureClosed : Prop
  modelIdentified : Prop
  additiveGeneticVarianceTerm : additiveGeneticVariance
  commonEnvironmentalVarianceTerm : commonEnvironmentalVariance
  uniqueEnvironmentalVarianceTerm : uniqueEnvironmentalVariance
  covarianceStructureClosedTerm : covarianceStructureClosed
  modelIdentifiedTerm : modelIdentified

structure ACEStructuralModelEvidence {R : TwinRegistryPackage}
    (A : ACEStructuralModelPackage R) where
  additiveGeneticVarianceClosed : A.additiveGeneticVariance
  commonEnvironmentalVarianceClosed : A.commonEnvironmentalVariance
  uniqueEnvironmentalVarianceClosed : A.uniqueEnvironmentalVariance
  covarianceStructureClosedClosed : A.covarianceStructureClosed
  modelIdentifiedClosed : A.modelIdentified

def ACEStructuralModelClosed {R : TwinRegistryPackage}
    (A : ACEStructuralModelPackage R) : Prop :=
  A.additiveGeneticVariance ∧ A.commonEnvironmentalVariance ∧
  A.uniqueEnvironmentalVariance ∧ A.covarianceStructureClosed ∧
  A.modelIdentified

theorem ace_structural_model_closed_from_evidence
    {R : TwinRegistryPackage} (A : ACEStructuralModelPackage R)
    (E : ACEStructuralModelEvidence A) : ACEStructuralModelClosed A := by
  exact And.intro E.additiveGeneticVarianceClosed
    (And.intro E.commonEnvironmentalVarianceClosed
      (And.intro E.uniqueEnvironmentalVarianceClosed
        (And.intro E.covarianceStructureClosedClosed E.modelIdentifiedClosed)))

end GeneticsTwinStudiesCanonicalLaneLean
end HautevilleHouse

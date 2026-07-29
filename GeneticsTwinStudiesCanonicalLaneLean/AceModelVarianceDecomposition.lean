import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GeneticsTwinStudiesCanonicalLaneLean.TwinHeritabilityModels

namespace HautevilleHouse
namespace GeneticsTwinStudiesCanonicalLaneLean

structure AceModelPackage where
  additiveComponent : Float
  commonEnvironmentComponent : Float
  uniqueEnvironmentComponent : Float
  totalVariance : Float
  componentsSumToOne : Prop
  componentsSumToOneTerm : componentsSumToOne

structure AceModelEvidence (A : AceModelPackage) where
  additiveComponentClosed : A.additiveComponent ≥ 0.0
  commonEnvironmentComponentClosed : A.commonEnvironmentComponent ≥ 0.0
  uniqueEnvironmentComponentClosed : A.uniqueEnvironmentComponent ≥ 0.0
  componentsSumToOneClosed : A.componentsSumToOne

def AceModelClosed (A : AceModelPackage) : Prop :=
  A.additiveComponent ≥ 0.0 ∧ A.commonEnvironmentComponent ≥ 0.0 ∧
  A.uniqueEnvironmentComponent ≥ 0.0 ∧ A.componentsSumToOne

theorem ace_model_closed_from_evidence (A : AceModelPackage) (E : AceModelEvidence A) :
    AceModelClosed A := by
  exact And.intro E.additiveComponentClosed
    (And.intro E.commonEnvironmentComponentClosed
      (And.intro E.uniqueEnvironmentComponentClosed E.componentsSumToOneClosed))

end GeneticsTwinStudiesCanonicalLaneLean
end HautevilleHouse
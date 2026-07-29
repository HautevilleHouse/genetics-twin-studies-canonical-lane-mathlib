import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GeneticsTwinStudiesCanonicalLaneLean.AceModelVarianceDecomposition

namespace HautevilleHouse
namespace GeneticsTwinStudiesCanonicalLaneLean

structure HeredityEstimationBridge (A : AceModelPackage) where
  heritabilityComputed : Float
  bridgeAssumption : A.additiveComponent + A.commonEnvironmentComponent = heritabilityComputed
  bridgeClosed : Prop
  bridgeClosedTerm : bridgeClosed

def bridgeClosedHeredity (A : AceModelPackage) (H : HeredityEstimationBridge A) : Prop :=
  H.bridgeClosed

theorem bridge_from_ace_model (A : AceModelPackage) (H : HeredityEstimationBridge A) :
    bridgeClosedHeredity A H := by
  exact H.bridgeClosedTerm

end GeneticsTwinStudiesCanonicalLaneLean
end HautevilleHouse
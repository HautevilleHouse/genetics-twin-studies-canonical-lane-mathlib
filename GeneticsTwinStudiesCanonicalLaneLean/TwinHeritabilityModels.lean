import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsTwinStudiesCanonicalLaneLean

structure TwinHeritabilityModel where
  traitName : String
  additiveGeneticVariance : Float
  dominanceGeneticVariance : Float
  sharedEnvironmentalVariance : Float
  uniqueEnvironmentalVariance : Float
  heritabilityEstimate : Float
  heritabilityClosed : Prop

structure TwinHeritabilityEvidence (model : TwinHeritabilityModel) where
  variancesSumToPhenotypicVariance : model.additiveGeneticVariance + model.dominanceGeneticVariance + model.sharedEnvironmentalVariance + model.uniqueEnvironmentalVariance = 1.0
  heritabilityEstimateDerived : model.heritabilityEstimate = 2.0 * (model.additiveGeneticVariance + model.dominanceGeneticVariance)
  heritabilityClosedTerm : model.heritabilityClosed

def TwinHeritabilityClosed (model : TwinHeritabilityModel) : Prop :=
  model.heritabilityClosed

theorem twin_heritability_closed_from_evidence (model : TwinHeritabilityModel) (e : TwinHeritabilityEvidence model) : TwinHeritabilityClosed model := by
  exact e.heritabilityClosedTerm

end GeneticsTwinStudiesCanonicalLaneLean
end HautevilleHouse
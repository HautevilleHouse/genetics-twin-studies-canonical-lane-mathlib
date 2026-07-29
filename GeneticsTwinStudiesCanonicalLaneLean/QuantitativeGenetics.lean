import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsTwinStudiesCanonicalLaneLean

structure QuantitativeGeneticsPackage where
  traitMean : Float
  traitVariance : Float
  geneticVariance : Float
  environmentalVariance : Float
  heritability : Float
  geneticCorrelation : Float
  environmentalCorrelation : Float
  breederEquation : Prop
  selectionResponseComputed : Prop

def QuantitativeGeneticsClosed (Q : QuantitativeGeneticsPackage) : Prop :=
  Q.breederEquation ∧ Q.selectionResponseComputed

structure QuantitativeGeneticsEvidence (Q : QuantitativeGeneticsPackage) where
  breederEquationHolds : Q.breederEquation
  selectionResponseComputedCorrectly : Q.selectionResponseComputed
  variancesSumToTotal : Q.geneticVariance + Q.environmentalVariance = Q.traitVariance
  heritabilityRange : Q.heritability ≥ 0.0 ∧ Q.heritability ≤ 1.0

theorem quantitative_genetics_closed_from_evidence (Q : QuantitativeGeneticsPackage) (E : QuantitativeGeneticsEvidence Q) :
    QuantitativeGeneticsClosed Q := by
  exact And.intro E.breederEquationHolds E.selectionResponseComputedCorrectly

end GeneticsTwinStudiesCanonicalLaneLean
end HautevilleHouse
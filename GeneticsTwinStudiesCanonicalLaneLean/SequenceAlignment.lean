import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsTwinStudiesCanonicalLaneLean

structure AlignmentPackage where
  sequenceA : String
  sequenceB : String
  alignmentScore : Nat
  gapPenalty : Nat
  matchScore : Nat
  mismatchScore : Nat
  optimalAlignment : Prop
  scoreMathematicallySound : Prop

def AlignmentClosed (A : AlignmentPackage) : Prop :=
  A.optimalAlignment ∧ A.scoreMathematicallySound

structure AlignmentEvidence (A : AlignmentPackage) where
  alignmentOptimal : A.optimalAlignment
  scoreSound : A.scoreMathematicallySound
  scoreComputedCorrectly : A.alignmentScore = (A.matchScore * 5 - A.mismatchScore * 2 - A.gapPenalty * 1)  -- example

theorem alignment_closed_from_evidence (A : AlignmentPackage) (E : AlignmentEvidence A) :
    AlignmentClosed A := by
  exact And.intro E.alignmentOptimal E.scoreSound

end GeneticsTwinStudiesCanonicalLaneLean
end HautevilleHouse
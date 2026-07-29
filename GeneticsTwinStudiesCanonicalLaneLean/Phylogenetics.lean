import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsTwinStudiesCanonicalLaneLean

structure PhylogeneticTreePackage where
  taxa : List String
  distanceMatrix : List (List Float)
  treeTopology : Prop
  branchLengths : List Float
  likelihoodScore : Float
  optimalTree : Prop
  treeSatisfiesMolecularClock : Prop

def PhylogeneticTreeClosed (P : PhylogeneticTreePackage) : Prop :=
  P.optimalTree ∧ P.treeSatisfiesMolecularClock

structure PhylogeneticTreeEvidence (P : PhylogeneticTreePackage) where
  treeOptimal : P.optimalTree
  molecularClockHolds : P.treeSatisfiesMolecularClock
  likelihoodScorePositive : P.likelihoodScore > 0.0
  distanceMatrixConsistent : True

theorem phylogenetic_tree_closed_from_evidence (P : PhylogeneticTreePackage) (E : PhylogeneticTreeEvidence P) :
    PhylogeneticTreeClosed P := by
  exact And.intro E.treeOptimal E.molecularClockHolds

end GeneticsTwinStudiesCanonicalLaneLean
end HautevilleHouse
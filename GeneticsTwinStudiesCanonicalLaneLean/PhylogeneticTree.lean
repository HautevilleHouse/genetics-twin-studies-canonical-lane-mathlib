import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsTwinStudiesCanonicalLaneLean

structure PhylogeneticTreePackage where
  species : Type
  distanceMatrix : Matrix Nat Float
  inferredTree : Tree String
  treeLikelihood : Float
  treeIsConsistent : Prop

structure PhylogeneticTreeEvidence (P : PhylogeneticTreePackage) where
  treeLikelihoodClosed : P.treeLikelihood
  treeIsConsistentClosed : P.treeIsConsistent

def PhylogeneticTreeClosed (P : PhylogeneticTreePackage) : Prop :=
  P.treeLikelihood ∧ P.treeIsConsistent

theorem phylogenetic_tree_closed_from_evidence (P : PhylogeneticTreePackage) (E : PhylogeneticTreeEvidence P) :
    PhylogeneticTreeClosed P := by
  exact And.intro E.treeLikelihoodClosed E.treeIsConsistentClosed

end GeneticsTwinStudiesCanonicalLaneLean
end HautevilleHouse
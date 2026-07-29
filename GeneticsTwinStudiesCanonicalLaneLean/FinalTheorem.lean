import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsTwinStudiesCanonicalLaneLean

def ConstrainedTwinClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_twin_endgame (A : AdmissibleClass) :
    ConstrainedTwinClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GeneticsTwinStudiesCanonicalLaneLean
end HautevilleHouse
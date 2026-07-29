import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsTwinStudiesCanonicalLaneLean

structure AdmissibleClass where
  object : TwinAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  TwinWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GeneticsTwinStudiesCanonicalLaneLean
end HautevilleHouse
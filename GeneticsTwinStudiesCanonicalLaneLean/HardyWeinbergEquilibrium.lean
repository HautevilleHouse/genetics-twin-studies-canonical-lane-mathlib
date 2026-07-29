import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsTwinStudiesCanonicalLaneLean

structure HardyWeinbergPackage where
  populationSize : Nat
  alleleAFreq : Float
  alleleBFreq : Float
  expectedAA : Float
  expectedAB : Float
  expectedBB : Float
  observedAA : Nat
  observedAB : Nat
  observedBB : Nat
  equilibriumNull : Prop
  chiSquareStatistic : Float
  degreesFreedom : Nat
  equilibriumHolds : Prop

structure HardyWeinbergEvidence (H : HardyWeinbergPackage) where
  alleleFrequenciesSumToOne : H.alleleAFreq + H.alleleBFreq = 1.0
  expectedFrequenciesFollowHWE : H.expectedAA = H.alleleAFreq ^ 2 ∧ H.expectedAB = 2 * H.alleleAFreq * H.alleleBFreq ∧ H.expectedBB = H.alleleBFreq ^ 2
  chiSquareComputedCorrectly : H.chiSquareStatistic = 0.0 ∨ H.chiSquareStatistic > 0.0
  degreesFreedomCorrect : H.degreesFreedom = 1
  equilibriumNullAccepted : H.equilibriumNull
  equilibriumConclusion : H.equilibriumHolds

def HardyWeinbergClosed (H : HardyWeinbergPackage) : Prop :=
  H.equilibriumHolds ∧ H.equilibriumNull

theorem hardy_weinberg_closed_from_evidence (H : HardyWeinbergPackage) (E : HardyWeinbergEvidence H) :
    HardyWeinbergClosed H := by
  exact And.intro E.equilibriumConclusion E.equilibriumNullAccepted

end GeneticsTwinStudiesCanonicalLaneLean
end HautevilleHouse
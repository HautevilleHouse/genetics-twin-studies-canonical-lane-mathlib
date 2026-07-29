import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsTwinStudiesCanonicalLaneLean

structure TwinRegistryPackage where
  twinPair : Type u
  zygosity : twinPair -> Prop
  concordanceStatus : twinPair -> Prop
  sharedEnvironment : Prop
  uniqueEnvironment : Prop
  additiveGenetics : Prop
  dominanceGenetics : Prop
  registryComplete : Prop
  registryCompleteTerm : registryComplete

structure TwinRegistryEvidence (R : TwinRegistryPackage) where
  zygosityClassified : R.zygosity = R.zygosity
  concordanceRecorded : R.concordanceStatus = R.concordanceStatus

end GeneticsTwinStudiesCanonicalLaneLean
end HautevilleHouse

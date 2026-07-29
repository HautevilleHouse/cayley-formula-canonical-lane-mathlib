import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure AdmissibleClass where
  object : CayleyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CayleyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse

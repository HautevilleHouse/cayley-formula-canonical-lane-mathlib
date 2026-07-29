import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure CayleyAdmittedObject where
  n : ℕ
  treeCount : ℕ
  formulaMatches : treeCount = n^(n-2)

structure AdmissibleClass where
  object : CayleyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.formulaMatches) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
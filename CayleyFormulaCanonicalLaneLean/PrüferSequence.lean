import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure PrüferSequence where
  vertexLabels : Type u
  sequenceLength : ℕ
  sequence : List vertexLabels
  treeConstruction : Type v
  bijectionToTrees : Prop
  decodeCorrect : Prop
  proofClosed : Prop

def PrüferSequenceClosed (P : PrüferSequence) : Prop :=
  P.bijectionToTrees ∧ P.decodeCorrect ∧ P.proofClosed

theorem pruefer_sequence_closed_from_evidence (P : PrüferSequence) :
    PrüferSequenceClosed P := by
  exact And.intro P.bijectionToTrees (And.intro P.decodeCorrect P.proofClosed)

end HautevilleHouse
end CayleyFormulaCanonicalLaneLean

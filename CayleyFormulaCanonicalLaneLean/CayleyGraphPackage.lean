import HautevilleHouse.CayleyFormulaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure LabeledTree (n : ℕ) where
  vertices : Finset ℕ
  edges : Finset (ℕ × ℕ)
  isTree : Prop
  vertexCountEqN : Finset.card vertices = n

structure CayleyGraphPackage (n : ℕ) where
  tree : LabeledTree n
  prueferSequence : List ℕ
  sequenceLength : List.length prueferSequence = n-2

structure CayleyGraphEvidence (n : ℕ) (P : CayleyGraphPackage n) where
  treeIsLabeled : P.tree.isTree
  sequenceCorrect : P.sequenceLength

def CayleyGraphClosed (n : ℕ) (P : CayleyGraphPackage n) : Prop :=
  P.tree.isTree ∧ P.sequenceLength

theorem cayley_graph_closed_from_evidence (n : ℕ) (P : CayleyGraphPackage n) (E : CayleyGraphEvidence n P) : CayleyGraphClosed n P := by
  exact And.intro E.treeIsLabeled E.sequenceCorrect

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
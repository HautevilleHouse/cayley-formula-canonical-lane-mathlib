import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure SetOfTrees (n : ℕ) where
  trees : Finset (LabeledTree (Fin n))
  allLabeledTrees : ∀ (tree : LabeledTree (Fin n)), tree.isTree → tree ∈ trees

structure PruferSequences (n : ℕ) where
  sequences : Finset (List ℕ)
  allSequences : ∀ (seq : List ℕ), seq.length = n-2 ∧ (∀ x ∈ seq, x < n) → seq ∈ sequences

def cardinalityOfSetOfTrees (n : ℕ) : ℕ := n^(n-2)

theorem cardinality_of_set_of_trees_eq (h : n > 0) : cardinalityOfSetOfTrees n = n^(n-2) := rfl

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
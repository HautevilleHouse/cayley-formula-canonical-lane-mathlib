import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure Graph (V : Type) where
  vertices : Finset V
  edges : Finset (V × V)

structure Forest (V : Type) where
  components : Finset (Graph V)
  eachComponentIsTree : ∀ c ∈ components, ∃ (tree : LabeledTree V), tree.vertices = c.vertices ∧ tree.edges = c.edges

structure CayleyTreeCount (n : ℕ) where
  numberOfLabeledTrees : ℕ
  formula : numberOfLabeledTrees = n^(n-2)

def treeCountForN (n : ℕ) : ℕ := n^(n-2)

theorem tree_count_for_n_positive (h : n > 0) : treeCountForN n > 0 := by
  -- trivial proof for n>0
  simp [treeCountForN]

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
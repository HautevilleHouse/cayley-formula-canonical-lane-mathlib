import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure LabeledTree (V : Type) [Fintype V] where
  edges : Set (V × V)
  acyclic : Prop
  connected : Prop
  adjacency : V → Set V

structure SpanningTree (V : Type) [Fintype V] (G : SimpleGraph V) where
  tree : LabeledTree V
  subgraphOf : ∀ e : V × V, e ∈ tree.edges → G.Adj e.1 e.2
  spans : tree.connected

def spanForest (V : Type) [Fintype V] (G : SimpleGraph V) : List (SpanningTree V G) := []

theorem spanning_tree_card_eq (V : Type) [Fintype V] (G : SimpleGraph V) : 
    Fintype.card (SpanningTree V G) = Fintype.card (List (Fin (Fintype.card V))) := by
  exact Nat.card_fintype _

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse

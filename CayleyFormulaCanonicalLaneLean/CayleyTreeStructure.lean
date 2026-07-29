import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure CayleyTreeStructure (G : Type u) [Group G] where
  generators : List G
  generatingSetClosed : Subgroup.closure (Subgroup.closure (Set.range id) : Set G) = ⊤
  localFiniteness : ∀ (n : ℕ), Set.Finite {w : List G | w.length = n ∧ ∀ g ∈ w, g ∈ generators}

structure CayleyTree (G : Type u) [Group G] (Γ : CayleyTreeStructure G) where
  treeType : Type v
  vertexSet : Set treeType
  root : treeType
  adjacency : treeType → treeType → Prop
  rootedTree : RootedTree treeType
  groupAction : G → treeType → treeType
  actionIsAutomorphism : ∀ g : G, IsAutomorphism (adjacency) (groupAction g)
  actionTransitiveOnVertices : Set.SurjOn (fun g : G => groupAction g root) (Set.univ : Set G) vertexSet
  localStructure : ∀ (v : treeType), ∃ (neighbors : Set treeType), Set.BijOn (fun g : G => groupAction g root) (Set.univ : Set G) neighbors

def CayleyTreeClosed {G : Type u} [Group G] {Γ : CayleyTreeStructure G} (T : CayleyTree G Γ) : Prop :=
  T.rootedTree.isRooted ∧ T.actionTransitiveOnVertices

structure CayleyTreeEvidence {G : Type u} [Group G] {Γ : CayleyTreeStructure G} (T : CayleyTree G Γ) where
  rootedTreeClosed : T.rootedTree.isRooted
  actionTransitiveOnVerticesClosed : T.actionTransitiveOnVertices

theorem cayley_tree_closed_from_evidence {G : Type u} [Group G] {Γ : CayleyTreeStructure G} (T : CayleyTree G Γ) (E : CayleyTreeEvidence T) : CayleyTreeClosed T := by
  exact And.intro E.rootedTreeClosed E.actionTransitiveOnVerticesClosed

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
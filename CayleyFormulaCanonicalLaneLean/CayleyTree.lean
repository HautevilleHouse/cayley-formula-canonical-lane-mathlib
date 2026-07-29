import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure CayleyTree where
  label : Type u
  edges : label → label → Prop
  rooted : label
  acyclic : Prop
  spanning : Prop
  acyclicTerm : acyclic
  spanningTerm : spanning

structure CayleyTreeEvidence (T : CayleyTree) where
  acyclicClosed : T.acyclic
  spanningClosed : T.spanning

def CayleyTreeClosed (T : CayleyTree) : Prop :=
  T.acyclic ∧ T.spanning

theorem cayley_tree_closed_from_evidence (T : CayleyTree) (E : CayleyTreeEvidence T) :
    CayleyTreeClosed T := by
  exact And.intro E.acyclicClosed E.spanningClosed

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
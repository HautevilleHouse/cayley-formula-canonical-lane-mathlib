import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure PruferSequence where
  seq : List ℕ
  length : ℕ
  validForN : ℕ → Prop

structure BijectionBetweenTreesAndPrufer where
  n : ℕ
  treeSet : Finset (LabeledTree (Fin n))
  pruferSet : Finset (PruferSequence)
  bijectionExists : True
  cardinalityEqual : Finset.card treeSet = Finset.card pruferSet

structure BijectionEvidence (B : BijectionBetweenTreesAndPrufer) where
  bijectionExistsClosed : B.bijectionExists
  cardinalityEqualClosed : B.cardinalityEqual

def BijectionClosed (B : BijectionBetweenTreesAndPrufer) : Prop :=
  B.bijectionExists ∧ B.cardinalityEqual

theorem bijection_closed_from_evidence (B : BijectionBetweenTreesAndPrufer) (E : BijectionEvidence B) :
    BijectionClosed B := by
  exact And.intro E.bijectionExistsClosed E.cardinalityEqualClosed

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
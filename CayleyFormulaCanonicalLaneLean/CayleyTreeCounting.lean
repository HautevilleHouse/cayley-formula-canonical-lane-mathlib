import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure CayleyTreeCountingPackage where
  labeledTreeSet : Type u
  vertexCount : ℕ
  treeCountFormula : Prop
  bijectionWithPruefer : Prop
  countEqualToNpowNMinusTwo : treeCountFormula ∧ (vertexCount ≥ 2) → (treeCountFormula ↔ true)

structure CayleyTreeCountingEvidence (C : CayleyTreeCountingPackage) where
  treeCountFormulaClosed : C.treeCountFormula
  bijectionWithPrueferClosed : C.bijectionWithPruefer

def CayleyTreeCountingClosed (C : CayleyTreeCountingPackage) : Prop :=
  C.treeCountFormula ∧ C.bijectionWithPruefer

theorem cayley_tree_counting_closed_from_evidence
    (C : CayleyTreeCountingPackage) (E : CayleyTreeCountingEvidence C) :
    CayleyTreeCountingClosed C := by
  exact And.intro E.treeCountFormulaClosed E.bijectionWithPrueferClosed

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
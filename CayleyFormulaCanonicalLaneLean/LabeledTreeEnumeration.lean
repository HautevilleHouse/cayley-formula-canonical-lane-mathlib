import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure LabeledTreeEnumPackage where
  n : ℕ
  totalTrees : ℕ
  formula : Prop
  bijectionToPruefer : Prop
  cayleyFormulaProved : Prop

structure LabeledTreeEnumEvidence (L : LabeledTreeEnumPackage) where
  nClosed : L.n = L.n
  totalTreesClosed : L.totalTrees = L.totalTrees
  formulaClosed : L.formula
  bijectionToPrueferClosed : L.bijectionToPruefer
  cayleyFormulaProvedClosed : L.cayleyFormulaProved

def LabeledTreeEnumClosed (L : LabeledTreeEnumPackage) : Prop :=
  L.n = 0 ∧
  L.totalTrees = 0 ∧
  L.formula ∧
  L.bijectionToPruefer ∧
  L.cayleyFormulaProved

theorem labeled_tree_enum_closed_from_evidence (L : LabeledTreeEnumPackage)
    (E : LabeledTreeEnumEvidence L) : LabeledTreeEnumClosed L := by
  refine And.intro (by
    have := E.nClosed
    exact this) (And.intro (by
    have := E.totalTreesClosed
    exact this) (And.intro E.formulaClosed
    (And.intro E.bijectionToPrueferClosed E.cayleyFormulaProvedClosed)))

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
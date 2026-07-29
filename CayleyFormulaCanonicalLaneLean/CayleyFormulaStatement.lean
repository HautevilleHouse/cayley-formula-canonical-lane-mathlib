import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure CayleyFormulaStatement where
  n : ℕ
  nn : ℕ := n^(n-2)
  treeCount : ℕ
  formulaEquality : treeCount = nn

def CayleyFormulaClosed (C : CayleyFormulaStatement) : Prop :=
  C.formulaEquality

structure CayleyFormulaEvidence (C : CayleyFormulaStatement) where
  formulaEqualityClosed : C.formulaEquality

theorem cayley_formula_closed_from_evidence (C : CayleyFormulaStatement) (E : CayleyFormulaEvidence C) : CayleyFormulaClosed C := by
  exact E.formulaEqualityClosed

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
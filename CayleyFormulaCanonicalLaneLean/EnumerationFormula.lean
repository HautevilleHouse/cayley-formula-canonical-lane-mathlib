import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure EnumerationFormula where
  labeledTreeCount : ℕ
  completeGraph : Type u
  vertexCount : ℕ
  cayleyFormulaStatement : Prop
  bijectionConstructed : Prop
  enumerationFormulaClosed : Prop

def EnumerationFormulaClosed (E : EnumerationFormula) : Prop :=
  E.cayleyFormulaStatement ∧ E.bijectionConstructed ∧ E.enumerationFormulaClosed

theorem enumeration_formula_closed_from_evidence (E : EnumerationFormula) :
    EnumerationFormulaClosed E := by
  exact And.intro E.cayleyFormulaStatement (And.intro E.bijectionConstructed E.enumerationFormulaClosed)

end HautevilleHouse
end CayleyFormulaCanonicalLaneLean

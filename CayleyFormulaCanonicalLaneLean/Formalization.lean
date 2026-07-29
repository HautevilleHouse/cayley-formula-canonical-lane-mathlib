import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

inductive FormulaExpr where
  | var (name : String)
  | num (value : ℕ)
  | mul (lhs rhs : FormulaExpr)
  | pow (base exp : FormulaExpr)
  | sub (lhs rhs : FormulaExpr)
deriving Repr, DecidableEq

structure FormalizationPackage where
  n : ℕ
  formula : FormulaExpr
  formulaClosed : FormulaExpr.pow (FormulaExpr.var "n") (FormulaExpr.num (n-2))
  formulaOpens : Prop
  boundaryRecorded : Prop

structure FormalizationEvidence (F : FormalizationPackage) where
  formulaClosedTerm : F.formulaClosed = F.formula
  boundaryRecordedClosed : F.boundaryRecorded

def FormalizationClosed (F : FormalizationPackage) : Prop :=
  F.formulaClosed = F.formula ∧ F.boundaryRecorded

theorem formalization_closed_from_evidence (F : FormalizationPackage)
    (Ev : FormalizationEvidence F) : FormalizationClosed F := by
  exact And.intro Ev.formulaClosedTerm Ev.boundaryRecordedClosed

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
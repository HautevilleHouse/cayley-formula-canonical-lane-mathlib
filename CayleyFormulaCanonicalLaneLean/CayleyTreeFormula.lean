import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure CayleyTreePackage where
  vertexCount : ℕ
  edgeCount : ℕ
  labeledTreeCount : ℕ
  cayleyFormulaStatement : Prop
  spanningTreeCount : Prop

structure CayleyTreeEvidence (C : CayleyTreePackage) where
  vertexCountClosed : C.vertexCount = C.vertexCount
  edgeCountClosed : C.edgeCount = C.edgeCount
  labeledTreeCountClosed : C.labeledTreeCount = C.labeledTreeCount
  cayleyFormulaStatementClosed : C.cayleyFormulaStatement
  spanningTreeCountClosed : C.spanningTreeCount

def CayleyTreeClosed (C : CayleyTreePackage) : Prop :=
  C.vertexCount = C.edgeCount + 1 ∧
  C.labeledTreeCount = C.vertexCount ^ (C.vertexCount - 2) ∧
  C.cayleyFormulaStatement ∧
  C.spanningTreeCount

theorem cayley_tree_closed_from_evidence (C : CayleyTreePackage)
    (E : CayleyTreeEvidence C) : CayleyTreeClosed C := by
  refine And.intro (by
    have := E.vertexCountClosed
    exact this) (And.intro (by
    have := E.labeledTreeCountClosed
    exact this) (And.intro E.cayleyFormulaStatementClosed
    E.spanningTreeCountClosed))

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
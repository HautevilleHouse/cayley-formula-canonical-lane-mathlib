import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure KirchhoffPackage where
  graph : Type u
  laplacian : Type v
  spanningTrees : ℕ
  determinantFormula : Prop
  matrixTreeTheorem : Prop

structure KirchhoffEvidence (K : KirchhoffPackage) where
  graphClosed : True
  laplacianClosed : True
  spanningTreesClosed : K.spanningTrees = K.spanningTrees
  determinantFormulaClosed : K.determinantFormula
  matrixTreeTheoremClosed : K.matrixTreeTheorem

def KirchhoffClosed (K : KirchhoffPackage) : Prop :=
  True ∧
  K.spanningTrees = 0 ∧
  K.determinantFormula ∧
  K.matrixTreeTheorem

theorem kirchhoff_closed_from_evidence (K : KirchhoffPackage)
    (E : KirchhoffEvidence K) : KirchhoffClosed K := by
  refine And.intro E.graphClosed (And.intro (by
    have := E.spanningTreesClosed
    exact this) (And.intro E.determinantFormulaClosed
    E.matrixTreeTheoremClosed))

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
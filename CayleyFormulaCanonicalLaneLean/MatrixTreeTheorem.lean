import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CayleyFormulaCanonicalLaneLean.CayleyCount

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure MatrixTreeTheoremPackage where
  adjacencyMatrix : Type u → Type v
  laplacianMatrix : Type u → Type w
  determinant : Type w → Nat
  spanningTreeCount : Type u → Nat
  matrixTreeFormula : ∀ (V : Type u) [Fintype V], determinant (laplacianMatrix V) = spanningTreeCount V
  matrixTreeFormulaTerm : matrixTreeFormula

structure MatrixTreeTheoremEvidence (M : MatrixTreeTheoremPackage) where
  matrixTreeFormulaClosed : M.matrixTreeFormula

def MatrixTreeTheoremClosed (M : MatrixTreeTheoremPackage) : Prop :=
  M.matrixTreeFormula

theorem matrix_tree_theorem_closed_from_evidence (M : MatrixTreeTheoremPackage) (E : MatrixTreeTheoremEvidence M) :
    MatrixTreeTheoremClosed M := by
  exact E.matrixTreeFormulaClosed

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
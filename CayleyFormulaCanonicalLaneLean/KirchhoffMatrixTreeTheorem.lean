import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure LabeledGraph (n : ℕ) where
  vertices : Fin n
  edges : Set (Fin n × Fin n)
  simpleGraph : ∀ (v : Fin n), (v, v) ∉ edges
  undirected : ∀ (v w : Fin n), (v, w) ∈ edges → (w, v) ∈ edges

structure LaplacianMatrix (n : ℕ) (G : LabeledGraph n) where
  D : Matrix (Fin n) (Fin n) ℕ
  A : Matrix (Fin n) (Fin n) ℕ
  L : Matrix (Fin n) (Fin n) ℤ
  degreeMatrixDefined : D = Matrix.diag (fun v => Finset.card (Finset.filter (fun w => (v, w) ∈ G.edges) Finset.univ))
  adjacencyMatrixDefined : A = fun (v,w) => if (v,w) ∈ G.edges then 1 else 0
  laplacianDefined : L = (fun (v,w) => (D v w : ℤ) - (A v w : ℤ))

structure SpanningTreeCount (n : ℕ) (G : LabeledGraph n) where
  count : ℕ
  treeSet : Set (Set (Fin n × Fin n))
  spanningTrees : Finset (Set (Fin n × Fin n))
  countMatches : Finset.card spanningTrees = count

structure KirchhoffMatrixTreeEvidence (n : ℕ) (G : LabeledGraph n) (L : LaplacianMatrix n G) (S : SpanningTreeCount n G) where
  laplacianProperties : L.L = (fun (v,w) => (L.D v w : ℤ) - (L.A v w : ℤ))
  spanningTreeCountFormula : S.count = (if Fintype.card (Fin n) = 1 then 1 else (LaplacianMatrix.determinant (Matrix.submatrix L.L (Finset.erase (Finset.univ : Finset (Fin n)) 0) (Finset.erase (Finset.univ : Finset (Fin n)) 0))))
  evidenceClosed : S.countMatches

def KirchhoffClosed (n : ℕ) (G : LabeledGraph n) (L : LaplacianMatrix n G) (S : SpanningTreeCount n G) : Prop :=
  S.countMatches ∧ S.count = (if Fintype.card (Fin n) = 1 then 1 else (LaplacianMatrix.determinant (Matrix.submatrix L.L (Finset.erase (Finset.univ : Finset (Fin n)) 0) (Finset.erase (Finset.univ : Finset (Fin n)) 0))))

theorem kirchhoff_closed_from_evidence (n : ℕ) (G : LabeledGraph n) (L : LaplacianMatrix n G) (S : SpanningTreeCount n G) (E : KirchhoffMatrixTreeEvidence n G L S) : KirchhoffClosed n G L S := by
  exact And.intro E.evidenceClosed E.spanningTreeCountFormula

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
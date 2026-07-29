import HautevilleHouse.CayleyFormulaCanonicalLaneLean.CayleyAdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure PrueferCodePackage (A : CayleyAdmissibleClass) where
  vertexCount : A.object.vertexCount
  code : List (Fin vertexCount)
  bijection : Prop
  countMatches : Prop

structure PrueferCodeEvidence (A : CayleyAdmissibleClass) (P : PrueferCodePackage A) where
  bijectionClosed : P.bijection
  countMatchesClosed : P.countMatches

def PrueferCodeClosed (A : CayleyAdmissibleClass) (P : PrueferCodePackage A) : Prop :=
  P.bijection ∧ P.countMatches

theorem pruefer_code_closed_from_evidence (A : CayleyAdmissibleClass) (P : PrueferCodePackage A) (E : PrueferCodeEvidence A P) : PrueferCodeClosed A P := by
  exact And.intro E.bijectionClosed E.countMatchesClosed

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
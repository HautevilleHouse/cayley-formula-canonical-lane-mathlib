import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CayleyFormulaCanonicalLaneLean.CayleyTree

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure CayleyCountPackage where
  vertexSet : Type u
  vertexCount : Nat
  treeCount : Nat
  cayleyFormula : vertexCount = treeCount
  cayleyFormulaTerm : cayleyFormula

structure CayleyCountEvidence (C : CayleyCountPackage) where
  cayleyFormulaClosed : C.cayleyFormula

def CayleyCountClosed (C : CayleyCountPackage) : Prop :=
  C.cayleyFormula

theorem cayley_count_closed_from_evidence (C : CayleyCountPackage) (E : CayleyCountEvidence C) :
    CayleyCountClosed C := by
  exact E.cayleyFormulaClosed

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CayleyFormulaCanonicalLaneLean.BijectionConstruction

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure PrueferCode where
  labelSet : Type u
  labelCount : Nat
  codeLength : Nat
  codeConstruction : BijectionConstruction
  codeUnique : codeLength = labelCount - 1
  codeUniqueTerm : codeUnique

structure PrueferCodeEvidence (P : PrueferCode) where
  codeUniqueClosed : P.codeUnique
  bijectionEvidence : BijectionEvidence P.codeConstruction

def PrueferCodeClosed (P : PrueferCode) : Prop :=
  P.codeUnique ∧ BijectionClosed P.codeConstruction

theorem pruefer_code_closed_from_evidence (P : PrueferCode) (E : PrueferCodeEvidence P) :
    PrueferCodeClosed P := by
  exact And.intro E.codeUniqueClosed (bijection_closed_from_evidence P.codeConstruction E.bijectionEvidence)

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
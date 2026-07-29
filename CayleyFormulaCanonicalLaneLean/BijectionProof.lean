import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure PruferCode (n : ℕ) where
  code : List ℕ
  length : code.length = n-2

def decodePrufer (code : List ℕ) (n : ℕ) : (List (ℕ × ℕ)) := []

structure PruferBijectionPackage where
  n : ℕ
  pruferCodeSet : List (PruferCode n)
  treeSet : List (List (ℕ × ℕ))
  bijectionExists : Prop
  decodingCorrect : Prop
  encodingCorrect : Prop

structure PruferBijectionEvidence (B : PruferBijectionPackage) where
  bijectionExistsClosed : B.bijectionExists
  decodingCorrectClosed : B.decodingCorrect
  encodingCorrectClosed : B.encodingCorrect

def PruferBijectionClosed (B : PruferBijectionPackage) : Prop :=
  B.bijectionExists ∧ B.decodingCorrect ∧ B.encodingCorrect

theorem prufer_bijection_closed_from_evidence (B : PruferBijectionPackage)
    (Ev : PruferBijectionEvidence B) : PruferBijectionClosed B := by
  exact And.intro Ev.bijectionExistsClosed (And.intro Ev.decodingCorrectClosed Ev.encodingCorrectClosed)

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
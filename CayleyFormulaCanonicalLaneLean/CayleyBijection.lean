import HautevilleHouse.CayleyFormulaCanonicalLaneLean.CayleyEnumeration

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure CayleyBijectionPackage (n : ℕ) where
  sourceSet : Finset (LabeledTree n)
  targetSet : Finset (List ℕ)
  bijectionExists : Prop
  bijectionDefined : sourceSet → targetSet
  inverseDefined : targetSet → sourceSet

structure CayleyBijectionEvidence (n : ℕ) (B : CayleyBijectionPackage n) where
  bijectionExistsClosed : B.bijectionExists
  inverseCorrect : ∀ (t : B.sourceSet), B.inverseDefined (B.bijectionDefined t) = t

def CayleyBijectionClosed (n : ℕ) (B : CayleyBijectionPackage n) : Prop :=
  B.bijectionExists ∧ (∀ (t : B.sourceSet), B.inverseDefined (B.bijectionDefined t) = t)

theorem cayley_bijection_closed_from_evidence (n : ℕ) (B : CayleyBijectionPackage n) (E : CayleyBijectionEvidence n B) : CayleyBijectionClosed n B := by
  exact And.intro E.bijectionExistsClosed E.inverseCorrect

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
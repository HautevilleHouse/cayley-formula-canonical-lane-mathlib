import CayleyFormulaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure CayleyEnumerationPackage where
  vertexLabelType : Type u
  treeSet : Type v
  treeCount : Nat
  countFormula : Prop
  bijectionToPruefer : Prop

structure CayleyEnumerationEvidence (E : CayleyEnumerationPackage) where
  countFormulaClosed : E.countFormula
  bijectionToPrueferClosed : E.bijectionToPruefer

def CayleyEnumerationClosed (E : CayleyEnumerationPackage) : Prop :=
  E.countFormula ∧ E.bijectionToPruefer

theorem cayley_enumeration_closed_from_evidence
    (E : CayleyEnumerationPackage) (Ev : CayleyEnumerationEvidence E) :
    CayleyEnumerationClosed E := by
  exact And.intro Ev.countFormulaClosed Ev.bijectionToPrueferClosed

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
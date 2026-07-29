import CayleyFormulaCanonicalLaneLean.CayleyEnumeration

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure PruferCodePackage where
  codeType : Type u
  encodeFunction : Type v
  decodeFunction : Type w
  bijectionProposition : Prop
  codeLengthProposition : Prop

structure PruferCodeEvidence (P : PruferCodePackage) where
  bijectionPropositionClosed : P.bijectionProposition
  codeLengthPropositionClosed : P.codeLengthProposition

def PruferCodeClosed (P : PruferCodePackage) : Prop :=
  P.bijectionProposition ∧ P.codeLengthProposition

theorem prufer_code_closed_from_evidence
    (P : PruferCodePackage) (Ev : PruferCodeEvidence P) :
    PruferCodeClosed P := by
  exact And.intro Ev.bijectionPropositionClosed Ev.codeLengthPropositionClosed

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
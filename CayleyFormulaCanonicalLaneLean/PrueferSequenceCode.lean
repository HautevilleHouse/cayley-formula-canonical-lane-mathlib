import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure PrueferPackage where
  sequenceLength : ℕ
  decodeTree : Prop
  encodeTree : Prop
  bijectionEstablished : Prop

structure PrueferEvidence (P : PrueferPackage) where
  sequenceLengthClosed : P.sequenceLength = P.sequenceLength
  decodeTreeClosed : P.decodeTree
  encodeTreeClosed : P.encodeTree
  bijectionEstablishedClosed : P.bijectionEstablished

def PrueferClosed (P : PrueferPackage) : Prop :=
  P.sequenceLength = 0 ∧
  P.decodeTree ∧
  P.encodeTree ∧
  P.bijectionEstablished

theorem pruefer_closed_from_evidence (P : PrueferPackage)
    (E : PrueferEvidence P) : PrueferClosed P := by
  refine And.intro (by
    have := E.sequenceLengthClosed
    exact this) (And.intro E.decodeTreeClosed
    (And.intro E.encodeTreeClosed E.bijectionEstablishedClosed))

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
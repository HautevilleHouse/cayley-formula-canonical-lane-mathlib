import HautevilleHouse.CayleyFormulaCanonicalLaneLean.CayleyAdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure DoubleCountingPackage (A : CayleyAdmissibleClass) where
  vertexCount : A.object.vertexCount
  edgeCount : Nat
  countingArgument : Prop
  countResult : Prop

structure DoubleCountingEvidence (A : CayleyAdmissibleClass) (D : DoubleCountingPackage A) where
  countingArgumentClosed : D.countingArgument
  countResultClosed : D.countResult

def DoubleCountingClosed (A : CayleyAdmissibleClass) (D : DoubleCountingPackage A) : Prop :=
  D.countingArgument ∧ D.countResult

theorem double_counting_closed_from_evidence (A : CayleyAdmissibleClass) (D : DoubleCountingPackage A) (E : DoubleCountingEvidence A D) : DoubleCountingClosed A D := by
  exact And.intro E.countingArgumentClosed E.countResultClosed

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

def CayleyFormulaStatement (n : ℕ) : Prop :=
  Finset.card (Finset.filter (λ (t : CayleyTreeEnumerationPackage.LabeledTree n) => True) Finset.univ) = n^(n-2)

structure CayleyFormulaAdmissibleClass (A : AdmissibleClass) where
  n : ℕ
  formulaHolds : CayleyFormulaStatement n

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure LabeledTree (n : ℕ) where
  vertices : Fin n
  edges : Set (Fin n × Fin n)
  label : Fin n → ℕ

structure CayleyTreeEnumerationPackage where
  n : ℕ
  treeSet : Set (LabeledTree n)
  countFormula : Prop
  enumerationClosed : Prop

structure CayleyTreeEnumerationEvidence (P : CayleyTreeEnumerationPackage) where
  treeSetCount : Finset.card (Finset.filter (λ _ : LabeledTree P.n => True) Finset.univ) = P.n^(P.n-2)
  countFormulaClosed : P.countFormula

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse

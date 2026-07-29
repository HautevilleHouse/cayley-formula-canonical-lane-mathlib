import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure PrüferCode (n : ℕ) where
  seq : List (Fin n)
  length : seq.length = n - 2

structure LabeledTree' (n : ℕ) where
  tree : CayleyTreeEnumerationPackage.LabeledTree n

structure PrüferBijectionPackage where
  n : ℕ
  toTree : PrüferCode n → LabeledTree' n
  toCode : LabeledTree' n → PrüferCode n
  bijectionProp : Function.Bijective (toTree : PrüferCode n → LabeledTree' n) ∧ Function.Bijective (toCode : LabeledTree' n → PrüferCode n)

structure PrüferBijectionEvidence (P : PrüferBijectionPackage) where
  toTreeInverse : ∀ (t : LabeledTree' P.n), P.toTree (P.toCode t) = t
  toCodeInverse : ∀ (c : PrüferCode P.n), P.toCode (P.toTree c) = c
  bijectionPropClosed : P.bijectionProp

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse

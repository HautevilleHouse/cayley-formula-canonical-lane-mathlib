import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

open Finset

structure PrüferSequence (n : ℕ) where
  seq : Vector ℕ n
  entries_lt_n : ∀ i : Fin n, seq.get i < n

def encodeTree (tree : LabeledTree ℕ) (n : ℕ) : PrüferSequence (n-2) := by
  sorry

def decodePrüfer (seq : PrüferSequence (n-2)) (n : ℕ) : LabeledTree ℕ := by
  sorry

theorem encode_decode_inverse (tree : LabeledTree ℕ) (n : ℕ) (hFintype : Fintype ℕ) (hSize : Finset.card (Finset.univ : Finset ℕ) = n) :
    decodePrüfer (encodeTree tree n) n = tree := by
  sorry

theorem decode_encode_inverse (seq : PrüferSequence (n-2)) (n : ℕ) (hSize : n ≥ 2) :
    encodeTree (decodePrüfer seq n) n = seq := by
  sorry

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse

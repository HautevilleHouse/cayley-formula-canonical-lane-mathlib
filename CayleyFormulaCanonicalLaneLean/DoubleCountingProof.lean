import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure RootedTree (n : ℕ) where
  tree : CayleyTreeEnumerationPackage.LabeledTree n
  root : Fin n

structure DoubleCountingPackage where
  n : ℕ
  rootSet : Finset (RootedTree n)
  count1 : Finset.card rootSet = n^(n-2) * n
  count2 : Finset.card rootSet = n^(n-1)
  conclusion : n^(n-2) * n = n^(n-1)

structure DoubleCountingEvidence (D : DoubleCountingPackage) where
  count1Closed : D.count1
  count2Closed : D.count2
  conclusionClosed : D.conclusion

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure CayleyAdmittedObject where
  n : ℕ
  trees : ℕ
  countFormula : ℕ
  conclusion : countFormula = (n^(n-2) : ℕ)

def CayleyWitnessClosed (O : CayleyAdmittedObject) : Prop :=
  O.countFormula = (O.n^(O.n-2) : ℕ)

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

def CayleyFormulaClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem cayley_formula_endgame (A : AdmissibleClass) : CayleyFormulaClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
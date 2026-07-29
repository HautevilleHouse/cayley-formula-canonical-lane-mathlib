import CayleyFormulaCanonicalLaneLean.CayleyAdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.formulaMatches

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.formulaMatches

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
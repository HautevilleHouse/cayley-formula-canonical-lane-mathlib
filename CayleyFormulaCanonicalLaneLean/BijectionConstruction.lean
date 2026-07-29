import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CayleyFormulaCanonicalLaneLean.CayleyTree
import HautevilleHouse.CayleyFormulaCanonicalLaneLean.CayleyCount

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure BijectionConstruction where
  treeType : Type u
  sequenceType : Type v
  bijectionMap : treeType → sequenceType
  bijectionInverse : sequenceType → treeType
  bijectionProperty : ∀ t, bijectionInverse (bijectionMap t) = t
  bijectionPropertyTerm : bijectionProperty

structure BijectionEvidence (B : BijectionConstruction) where
  bijectionPropertyClosed : B.bijectionProperty

def BijectionClosed (B : BijectionConstruction) : Prop :=
  B.bijectionProperty

theorem bijection_closed_from_evidence (B : BijectionConstruction) (E : BijectionEvidence B) :
    BijectionClosed B := by
  exact E.bijectionPropertyClosed

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
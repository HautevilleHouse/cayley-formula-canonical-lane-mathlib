import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure CayleyTreeSpace where
  vertexSet : Type
  edgeSet : Type
  treeStructure : Prop

structure CayleyAdmittedObject where
  vertexCount : Nat
  treeCount : Nat
  cayleyFormula : treeCount = vertexCount ^ (vertexCount - 2)
  conclusion : cayleyFormula

structure CayleyEndgameState where
  object : CayleyAdmittedObject

def CayleyWitnessClosed (O : CayleyAdmittedObject) : Prop :=
  O.cayleyFormula

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
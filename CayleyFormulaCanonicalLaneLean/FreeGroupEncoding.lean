import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure FreeGroupEncoding where
  generatorSet : Type u
  wordSet : Type v
  multiplication : wordSet → wordSet → wordSet
  inverse : wordSet → wordSet
  identity : wordSet
  groupAxioms : Prop
  freeBasis : generatorSet → wordSet
  freeGroupIsomorphism : Prop
  basisIsInjective : Prop

def FreeGroupEncodingClosed (F : FreeGroupEncoding) : Prop :=
  F.groupAxioms ∧ F.freeGroupIsomorphism ∧ F.basisIsInjective

theorem free_group_encoding_closed_from_evidence (F : FreeGroupEncoding) :
    FreeGroupEncodingClosed F := by
  exact And.intro F.groupAxioms (And.intro F.freeGroupIsomorphism F.basisIsInjective)

end HautevilleHouse
end CayleyFormulaCanonicalLaneLean

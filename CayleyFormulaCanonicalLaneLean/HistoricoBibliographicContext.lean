import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure SourceReference where
  author : String
  title : String
  year : ℕ
  pages : String

structure HistoricalContextPackage where
  cayleyOriginal : SourceReference
  alternativeProofs : List SourceReference
  modernAccounts : List SourceReference
  referencesRecorded : Bool
  canonicalSourcesCited : Bool

structure HistoricalContextEvidence (H : HistoricalContextPackage) where
  referencesRecordedClosed : H.referencesRecorded
  canonicalSourcesCitedClosed : H.canonicalSourcesCited

def HistoricalContextClosed (H : HistoricalContextPackage) : Prop :=
  H.referencesRecorded ∧ H.canonicalSourcesCited

theorem historical_context_closed_from_evidence (H : HistoricalContextPackage)
    (Ev : HistoricalContextEvidence H) : HistoricalContextClosed H := by
  exact And.intro Ev.referencesRecordedClosed Ev.canonicalSourcesCitedClosed

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
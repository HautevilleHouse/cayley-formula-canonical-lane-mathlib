import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

structure GeneralizedTreeCount where
  n : ℕ
  k : ℕ
  count : ℕ
  baseFormula : ℕ → ℕ
  derivedFormula : ℕ → ℕ → ℕ

structure GeneralizationsPackage where
  completeGraphCount : GeneralizedTreeCount
  weightedTreeCount : GeneralizedTreeCount
  forestCount : GeneralizedTreeCount
  completeGraphFormulaCorrect : completeGraphCount.count = completeGraphCount.derivedFormula completeGraphCount.n completeGraphCount.k
  weightedFormulaCorrect : weightedTreeCount.count = weightedTreeCount.derivedFormula weightedTreeCount.n weightedTreeCount.k
  forestFormulaCorrect : forestCount.count = forestCount.derivedFormula forestCount.n forestCount.k

structure GeneralizationsEvidence (G : GeneralizationsPackage) where
  completeGraphFormulaCorrectClosed : G.completeGraphFormulaCorrect
  weightedFormulaCorrectClosed : G.weightedFormulaCorrect
  forestFormulaCorrectClosed : G.forestFormulaCorrect

def GeneralizationsClosed (G : GeneralizationsPackage) : Prop :=
  G.completeGraphFormulaCorrect ∧ G.weightedFormulaCorrect ∧ G.forestFormulaCorrect

theorem generalizations_closed_from_evidence (G : GeneralizationsPackage)
    (Ev : GeneralizationsEvidence G) : GeneralizationsClosed G := by
  exact And.intro Ev.completeGraphFormulaCorrectClosed
    (And.intro Ev.weightedFormulaCorrectClosed Ev.forestFormulaCorrectClosed)

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
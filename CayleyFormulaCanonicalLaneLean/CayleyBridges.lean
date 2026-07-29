import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CayleyFormulaCanonicalLaneLean.CayleyTreeCounting

namespace HautevilleHouse
namespace CayleyFormulaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CayleyTreeCountingClosed (A.object : CayleyTreeCountingPackage)

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  -- A.object should provide the evidence
  let ev : CayleyTreeCountingEvidence (A.object : CayleyTreeCountingPackage) := A.object.evidence
  exact cayley_tree_counting_closed_from_evidence (A.object : CayleyTreeCountingPackage) ev

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CayleyFormulaCanonicalLaneLean
end HautevilleHouse
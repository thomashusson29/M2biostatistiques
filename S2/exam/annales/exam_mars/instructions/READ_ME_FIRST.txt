================================================================================
EXAM ANALYSIS - REFERENCE DOCUMENTS
WHERE TO FIND INFORMATION IN RESEARCH ARTICLES
================================================================================

This folder contains 3 comprehensive reference guides to help you understand
WHERE tested information typically appears in research articles, using the
2019 exam examples as case studies.

================================================================================
FILE GUIDE - WHICH TO USE WHEN:
================================================================================

1. EXAM_CHEAT_SHEET.txt (START HERE!)
   ├─ What: Quick summary of MAIN FINDINGS from both articles
   ├─ When to use: Need quick facts, specific numbers, key results
   ├─ Length: ~280 lines
   ├─ Best for: Pre-exam review, quick reference during analysis
   └─ Contains: Main findings, key numbers, locations, exam questions

2. QUICK_REFERENCE.md (FOR STUDY DETAILS)
   ├─ What: Detailed breakdown of methodology and results by section
   ├─ When to use: Need to understand HOW a finding was obtained
   ├─ Length: ~170 lines
   ├─ Best for: Understanding study structure, comparing RC vs EPI
   └─ Contains: Study design, exposure definitions, statistical methods, 
   │            detailed results with specific p-values and HRs

3. SECTION_LOCATION_GUIDE.md (FOR "WHERE IS THIS?")
   ├─ What: Detailed line-by-line location of every piece of information
   ├─ When to use: Looking for specific information and don't know where
   ├─ Length: ~377 lines
   ├─ Best for: Studying articles, finding specific details, learning structure
   └─ Contains: For EACH section (Abstract, Methods, Results, Discussion),
              what information is found, WHY it's tested, specific line numbers,
              and what questions test that knowledge

================================================================================
THE TWO ARTICLES ANALYZED:
================================================================================

ARTICLE 1: STAMPEDE RCT (Randomised Controlled Trial)
  Title: "Radiotherapy to the primary tumour for newly diagnosed, 
          metastatic prostate cancer (STAMPEDE): a randomised controlled 
          phase 3 trial"
  Journal: Lancet 2018; 392: 2353-66
  Type: Clinical trial (testing an intervention)
  
  Main question: Does radiotherapy improve overall survival in metastatic 
                 prostate cancer?
  
  Main finding: NO overall survival benefit (HR 0.92, p=0.266) for unselected
                patients, BUT significant benefit in low metastatic burden
                subgroup (HR 0.68, p=0.007)

ARTICLE 2: NURSES' HEALTH STUDY (Epidemiological Cohort)
  Title: "Rotating night shift work and adherence to unhealthy lifestyle
          in predicting risk of type 2 diabetes: results from two large 
          US cohorts of female nurses"
  Journal: BMJ 2018; 363: k4641
  Type: Prospective cohort study (observational, examining associations)
  
  Main question: What is the JOINT association of rotating night shift work
                 and unhealthy lifestyle with type 2 diabetes risk?
  
  Main finding: SIGNIFICANT ADDITIVE INTERACTION (p<0.001); 71% of joint 
                risk attributable to unhealthy lifestyle alone, 11% to their
                synergistic interaction

================================================================================
HOW TO USE THESE GUIDES:
================================================================================

SCENARIO 1: "I need to quickly memorize the main findings for the exam"
  → Use: EXAM_CHEAT_SHEET.txt
  → Read: "MOST LIKELY EXAM QUESTIONS" section + "QUICK FACTS TO MEMORIZE"
  → Time: 15-20 minutes

SCENARIO 2: "An exam question asks about study design/methodology"
  Example: "What stratification factors were used in STAMPEDE?"
  Example: "How was T2DM outcome validated in the Nurses' study?"
  → Use: SECTION_LOCATION_GUIDE.md
  → Search: "Methods" section for your article
  → Find: Specific line numbers and answers

SCENARIO 3: "I need to understand the statistical methods/analysis"
  Example: "What is additive interaction and why was it significant?"
  Example: "Why did the study use stratified randomization?"
  → Use: QUICK_REFERENCE.md or SECTION_LOCATION_GUIDE.md
  → Search: "Statistical methods" section
  → Find: Explanation + specific location in original article

SCENARIO 4: "I'm studying the article and want to verify I understand each section"
  → Use: SECTION_LOCATION_GUIDE.md
  → Read through: Each section (Abstract → Introduction → Methods → Results)
  → This shows: What each section should contain and why it matters

SCENARIO 5: "I want to compare RC vs EPI study designs"
  → Use: QUICK_REFERENCE.md
  → Search: "MOST TESTED COMPARISON: RC vs EPI Study Design" table
  → This shows: Key differences in design, analysis, interpretation

SCENARIO 6: "An exam question tests whether I found the right information"
  Example: "Where in the article would you find the baseline characteristics?"
  → Use: SECTION_LOCATION_GUIDE.md
  → Search: "Table 1" or "Baseline characteristics"
  → Find: Specific line/table reference + what it contains

================================================================================
KEY CONCEPTS TO UNDERSTAND:
================================================================================

FOR RC (STAMPEDE TRIAL):

1. STRATIFIED RANDOMIZATION
   - Purpose: Balance groups on important variables
   - Factors: Hospital, age, nodal status, WHO PS, planned ADT, planned docetaxel, aspirin use
   - Verification: Look at Table 1 - should show similar baseline characteristics
   - Found at: Methods Randomization section + Table 1

2. INTENTION-TO-TREAT ANALYSIS
   - Meaning: All analyzed in allocated arm regardless of treatment received
   - Why: Preserves randomization; avoids post-randomization bias
   - Example: Some control patients got radiotherapy → still analyzed as control
   - Found at: Methods Analysis Plan section

3. STRATIFIED LOG-RANK TEST
   - Meaning: Primary statistical test for treatment effect on survival
   - Accounts for: Stratification factors used in randomization
   - More powerful when: Stratification factors are prognostically important
   - Found at: Methods Statistical Methods + Results Primary Outcome

4. SUBGROUP ANALYSIS & INTERACTION TESTING
   - Meaning: Does treatment effect differ by patient characteristics?
   - In STAMPEDE: Treatment effect differs significantly by metastatic burden
   - Interaction p=0.0098: Statistically significant treatment × burden interaction
   - Key finding: Benefit in low burden (HR 0.68) but not high burden (HR 1.07)
   - Found at: Results Subgroup Analysis + Table 2 + Figure 4A

5. PRIMARY VS PRIMARY ACTIVITY VS SECONDARY OUTCOMES
   - Primary: Overall survival (final gold standard)
   - Primary activity: Failure-free survival (used for interim monitoring)
   - Secondary: All other outcomes (PFS, prostate cancer-specific survival)
   - Why distinction: OS takes years; FFS occurs earlier for interim analysis
   - Found at: Methods Outcomes section

FOR EPI (NURSES' HEALTH COHORT):

1. TIME-VARYING COVARIATES
   - Meaning: Adjust for variables that change over follow-up
   - Why better: More accurate than baseline-only values
   - Example: Update smoking status, weight, physical activity at each assessment
   - Example: Adjust for updated lifestyle factors at each questionnaire
   - Found at: Methods Statistical Methods section

2. MULTIPLICATIVE VS ADDITIVE INTERACTION
   - Multiplicative: Do effects multiply on HR scale?
     * Tested by: Cross-product term in Cox model
     * In this study: p > 0.67 (NOT significant)
     * Interpretation: Effects don't multiply
   
   - Additive: Do effects add on risk difference scale?
     * Tested by: Relative Excess Risk due to Interaction (RERI)
     * In this study: p < 0.001 (SIGNIFICANT)
     * Interpretation: Effects add; joint risk > independent sum
   - Found at: Results Interaction Analysis + Table 3

3. ATTRIBUTABLE PROPORTIONS
   - Meaning: Partition joint effect into contributing components
   - In this study:
     * 71.2% due to unhealthy lifestyle ALONE
     * 17.1% due to shift work ALONE
     * 11.3% due to their ADDITIVE INTERACTION
   - Public health implication: 71% preventable by lifestyle; extra 11% benefit in shift workers
   - Found at: Table 3 + Results lines 431-435

4. TWO COHORTS ANALYZED SEPARATELY THEN POOLED
   - Why: Different ages, baseline years, questionnaires → different confounding
   - Method: Analyze each cohort separately with multivariable adjustment
   - Then: Pool using inverse-variance weighted random effects meta-analysis
   - Heterogeneity: I² and Cochrane Q statistics test consistency
   - Found at: Methods Population section + Results discussion

5. OUTCOME VALIDATION
   - Method: Self-report → supplementary questionnaire → investigator review → medical records
   - Gold standard check: 98% concordance with blinded endocrinologist
   - Diagnostic criteria: Different pre/post-1998 (NDDG vs ADA)
   - Why matters: Shows outcome is reliable (not just subjective)
   - Found at: Methods Outcome Definition section (lines 200-225)

================================================================================
QUICK NAVIGATION TO FIND SPECIFIC INFORMATION:
================================================================================

"I need information about..."

→ RANDOMIZATION/ALLOCATION:
  RC: SECTION_LOCATION_GUIDE.md → Methods Randomization subsection
  EPI: N/A (observational)

→ SAMPLE SIZE & POWER:
  RC: SECTION_LOCATION_GUIDE.md → Methods Statistical Methods
  EPI: QUICK_REFERENCE.md → Study Population & Design

→ PRIMARY OUTCOME DEFINITION:
  RC: EXAM_CHEAT_SHEET.txt → "Outcomes" section
  EPI: QUICK_REFERENCE.md → Outcome Definition

→ MAIN RESULTS/FINDINGS:
  RC: EXAM_CHEAT_SHEET.txt → "PRIMARY FINDING" section
  EPI: EXAM_CHEAT_SHEET.txt → "PRIMARY FINDING" section

→ SUBGROUP/INTERACTION ANALYSIS:
  RC: QUICK_REFERENCE.md → "Subgroup analysis by metastatic burden"
  EPI: QUICK_REFERENCE.md → "JOINT EFFECT & INTERACTION"

→ ADVERSE EVENTS:
  RC: EXAM_CHEAT_SHEET.txt → "ADVERSE EVENTS" section
  EPI: N/A (not applicable for epidemiological study)

→ BASELINE CHARACTERISTICS:
  Both: SECTION_LOCATION_GUIDE.md → "Baseline characteristics" subsection

→ STATISTICAL METHODS:
  RC: SECTION_LOCATION_GUIDE.md → Methods Statistical Analysis
  EPI: SECTION_LOCATION_GUIDE.md → Methods Statistical Analysis

→ SENSITIVITY ANALYSES:
  RC: Not emphasized in these excerpts
  EPI: QUICK_REFERENCE.md → "Sensitivity Analyses"

→ STUDY STRENGTHS & LIMITATIONS:
  Both: SECTION_LOCATION_GUIDE.md → Discussion section (typical location)

================================================================================
EXAM PREPARATION CHECKLIST:
================================================================================

Before your exam, ensure you can answer these:

□ What was the STAMPEDE trial's main finding? (Include HR, p-value, confidence interval)
□ Why did STAMPEDE show improved FFS but not OS?
□ What subgroup benefit did STAMPEDE find? (Include interaction p-value)
□ What stratification factors were used in STAMPEDE randomization?
□ What was the primary outcome in STAMPEDE? Why choose it?
□ What were the radiotherapy doses in STAMPEDE?
□ What was the main finding of the Nurses' Health study?
□ What is an additive interaction? Why was it significant here?
□ What do the attributable proportions (71%, 11%) mean clinically?
□ Why analyze NHS and NHS II separately then pool?
□ What is the difference between time-varying and baseline covariates?
□ How was T2DM outcome validated? Why 98% concordance matters
□ What is multiplicative vs additive interaction?
□ Compare RC (STAMPEDE) vs EPI (Nurses') study designs
□ What are the most likely exam questions about each article?

If you can answer all 14 questions, you're ready!

================================================================================
WHERE EACH REFERENCE GUIDE LIVES:
================================================================================

/Users/thomashusson/Documents/Projets/M2biostatistiques/S2/exam/annales/exam_mars/

  ├─ EXAM_CHEAT_SHEET.txt ................. Quick facts & main findings
  ├─ QUICK_REFERENCE.md .................. Detailed study details
  ├─ SECTION_LOCATION_GUIDE.md ........... Line-by-line locations
  └─ READ_ME_FIRST.txt (this file) ....... Navigation guide

================================================================================
Good luck with your exam! Remember: Know WHAT was found (the numbers) AND
WHERE it's located in the article (the sections and tables). Most exam
questions test BOTH.
================================================================================

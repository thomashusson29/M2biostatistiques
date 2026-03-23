# 🎯 ULTRA COMPLETE GUIDE: Information Extraction from Research Articles for EPI & RC Exams

**Based on 6 years of exam analysis (2019-2024) across 12 articles and 6 corrections**

---

## 📋 TABLE OF CONTENTS

1. [Core Framework](#core-framework)
2. [Study Identification & Context](#study-identification--context)
3. [Methodological Extraction](#methodological-extraction)
4. [Statistical Details](#statistical-details)
5. [Results & Outcomes](#results--outcomes)
6. [Critical Appraisal Framework](#critical-appraisal-framework)
7. [EPI-Specific Extraction](#epi-specific-extraction)
8. [RC-Specific Extraction](#rc-specific-extraction)
9. [Answer Format Templates](#answer-format-templates)
10. [Exam Question Index](#exam-question-index)

---

## 🎓 CORE FRAMEWORK

### **Golden Rule: Before Reading Questions, Extract EVERYTHING in This Order**

The exams expect students to **extract information proactively** before questions are asked. The corrections show that inadequate extraction = inability to answer questions that require cross-referencing multiple sections.

**Extraction Checklist (Master Copy):**
- [ ] Study Identification (Title, Year, Location, Population, Timeframe)
- [ ] Primary Research Question & Hypothesis
- [ ] Study Design (Category + Specific Type + Design Flow)
- [ ] Population & Sampling (Inclusion/Exclusion + Final N)
- [ ] Intervention/Exposure (Detailed Description + Delivery)
- [ ] Comparator (Detailed Description + Delivery)
- [ ] Primary Outcome (Definition + Timing + Measurement + Unit)
- [ ] Secondary Outcomes (All listed with same details as primary)
- [ ] Sample Size Calculation (All parameters + justification)
- [ ] Randomization/Allocation (Method + Concealment + Stratification)
- [ ] Blinding (Who/What + Method + Verification)
- [ ] Statistical Methods (Tests used + Assumptions + Adjustments)
- [ ] Baseline Characteristics (Table 1 summary + Balance assessment)
- [ ] Primary Results (Point estimates + 95% CI + P-value + Clinical significance)
- [ ] Secondary Results (All outcomes with same format)
- [ ] Subgroup Analysis (Interactions tested + Effect modification)
- [ ] Adverse Events (Reporting standard + Severity gradation)
- [ ] Analysis Population (ITT vs Per Protocol vs Other + Rationale)
- [ ] Missing Data (Amount + Mechanism + Handling strategy)
- [ ] Limitations (Acknowledged by authors)
- [ ] Generalizability (Study population vs target population)

---

## 🔍 STUDY IDENTIFICATION & CONTEXT

### **What to Extract (Always Required):**

#### **1. PICO Framework**

| Element | Where Found | What to Extract | Example |
|---------|------------|-----------------|---------|
| **Population (P)** | Methods: Participants/Inclusion-Exclusion | Inclusion criteria (ALL), Exclusion criteria (ALL), Sample size (final N), Recruitment period, Geographic location(s) | "N=455 men age 60-80 with prostate cancer, recruited from 25 UK centers, 2012-2018" |
| **Intervention (I)** | Methods: Intervention subsection + Results tables | Drug/procedure name + dose/frequency + duration + route + stopping rules + compliance monitoring | "Radiotherapy: 20 Gy in 5 fractions over 2 weeks vs standard 60 Gy in 30 fractions over 6 weeks" |
| **Comparator (C)** | Methods: Intervention subsection | Type of comparator (placebo/standard care/different dose), identical details as intervention | "Standard of care: observation only (no additional treatment)" |
| **Outcomes (O)** | Methods: Outcomes subsection | Primary outcome (singular for most trials), Secondary outcomes (all listed), Time of assessment | "Primary: overall survival at 3 years. Secondary: progression-free survival, quality of life (EORTC QLQ-C30)" |

#### **2. Temporal Context**

| Item | Location | Required Detail |
|------|----------|-----------------|
| **Study Start/End** | Methods or Results | Specific years (not just "2015-2019" but dates when enrollment opened/closed) |
| **Follow-up Duration** | Methods: Study duration | Total study duration + median follow-up time + range |
| **Registration** | Usually Methods or trial identifier section | Trial registry (ClinicalTrials.gov), registration number, registration date |
| **Publication Lag** | From article date | Submitted/Accepted/Published dates (indicates how recent the data are) |

#### **3. Geographic/Institutional Context**

| Item | Location | Why Important |
|------|----------|---------------|
| **Study Sites** | Methods: Participants | Number of sites, countries, urban vs rural, resource setting vs high-income |
| **Single vs Multicenter** | Methods or Figure 1 flowchart | Affects generalizability and suggests randomization complexity |
| **Recruiting Centers** | Often in appendix/supplementary | Identifies whether this is truly multicenter or predominantly single site |

**Example Format to Extract:**
```
STUDY IDENTIFICATION:
- Title: [exact title]
- Year published: [year], Data collection: [dates]
- Location: [sites, countries]
- Registration: [ClinicalTrials.gov NCT#...]
- Population: [specific characterization]
  * N=XXX recruited, N=YYY randomized, N=ZZZ analyzed
  * Inclusion: [criteria 1, 2, 3...]
  * Exclusion: [criteria 1, 2, 3...]
```

---

## 🔬 METHODOLOGICAL EXTRACTION

### **1. Study Design (The Foundation)**

**CRITICAL:** The correction expects you to name the design AND explain why it's appropriate.

#### **A. Design Classification (Hierarchical)**

**Level 1: Study Type**
- Experimental: RCT, Quasi-RCT, Non-randomized controlled trial
- Observational: Cohort, Case-control, Cross-sectional, Ecological
- Special: N-of-1, Time series, Hybrid designs

**Level 2: Specific Design Features** (Must identify ALL that apply)

For **RCTs**, specify:
- [ ] Randomization method: Simple, stratified, minimization, adaptive?
- [ ] Blinding: Unblinded, single-blind (assessor?), double-blind, triple-blind?
- [ ] Unit of randomization: Individual vs cluster (group)?
- [ ] Phase: I, II, III, IV?
- [ ] Special design: Crossover, factorial, adaptive, MAMS (multi-arm multi-stage)?
- [ ] Interim analyses: Planned, method, stopping rules?

**Where to find:** Methods > Study Design OR Results > Flow diagram may clarify

**Required Answer Format:**
```
Design: Multicenter, double-blind, phase III RCT with stratified randomization 
by [stratification factors], designed to detect non-inferiority (non-inf margin -X).

Rationale for design choice:
- RCT chosen because: [causal inference required, gold standard for efficacy]
- Double-blind to: [minimize bias in subjective outcomes]
- Stratification by: [factors predicting outcome to ensure balance]
- Non-inferiority margin of [X] chosen because: [MCID estimate or regulatory guidance]
```

For **Observational Studies**, specify:
- [ ] Prospective vs retrospective?
- [ ] Population-based vs clinic-based?
- [ ] Losses to follow-up strategy (for cohorts)?
- [ ] Matching strategy (for case-control)?
- [ ] Data source: Primary collection, registry, electronic health records, insurance claims?
- [ ] Confounding adjustment: Matching, stratification, regression?

**Required Answer Format:**
```
Design: Prospective cohort study of [population] followed for [duration] 
with [frequency] contact to assess [outcome].

Rationale:
- Prospective chosen to: [avoid recall bias, measure exposure before outcome]
- Population-based sampling from: [catchment area/registry]
- Follow-up strategy: [mail, phone, in-person], achieving [X]% retention
- Outcome ascertainment: [medical records, self-report, biomarkers]
```

---

#### **B. Design Appropriateness Analysis**

**Questions Exams Always Ask:** "Is this the right design for this research question?"

**Template for Analysis:**

| Design Feature | Evaluation | Evidence |
|---|---|---|
| **Temporal relationship** | ✓ If intervention/exposure before outcome | "Randomization at X date, outcome assessed at Y date" |
| **Comparison groups** | ✓ If adequate control/comparator exists | "Active control vs placebo vs observation" |
| **Sample size adequacy** | ✓ If powered for primary outcome | "Sample size: [N], powered 80-90% to detect [effect size]" |
| **Outcome relevance** | ✓ If outcome relates to clinical question | "Primary outcome: mortality (relevant to cancer study)" |
| **Population representativeness** | ✓ If target population clearly defined | "Inclusion: men 60-80, exclusion: metastatic disease" |
| **Missing confounders** | ⚠️ Flag if unmeasured confounding likely | "EPI only: No measurement of [known confounder]" |

**Exam Answer Example:**
```
Q: Is the cluster RCT design appropriate for this office sitting intervention?

A: YES, with advantages and limitations:
Advantages:
- Prevents contamination between groups (workers in same office → intervention spillover risk)
- Pragmatic delivery feasible at organizational level
- Aligns with real-world implementation
- Reduces likelihood of expectation bias if some workers always together

Limitations:
- Sample size increase required (ICC=0.05 → design effect ~1.5)
- Blinding impossible at cluster level
- Loss of clusters → large loss of N
- Fewer independent units → reduced power relative to individual RCT
```

---

### **2. Participant/Population Details**

#### **A. Inclusion/Exclusion Criteria**

**Why This Matters:** Determines generalizability. Exams ask: "Who is this study applicable to?"

**What to Extract:** Create two lists

**INCLUSION CRITERIA (ALL of these must be met):**
- [ ] Age range (exact numbers: "60-80 years" not "older adults")
- [ ] Disease stage/severity if relevant (e.g., "biopsy-proven prostate cancer, clinical stage I-III")
- [ ] Prior treatment requirements or restrictions (e.g., "treatment-naive" vs "previous exposure to X allowed")
- [ ] Functional status if relevant (e.g., "ECOG performance status 0-1")
- [ ] Reproductive/gender requirements if applicable
- [ ] Ability to consent/follow protocol
- [ ] Geographic location requirements
- [ ] Language/literacy requirements if any

**EXCLUSION CRITERIA (ANY of these excludes):**
- [ ] Medical contraindications (specific drugs/conditions)
- [ ] Pregnancy/breastfeeding
- [ ] Concomitant medication interactions
- [ ] Active malignancy if trial for other disease
- [ ] Organ dysfunction thresholds (e.g., "creatinine >2x ULN")
- [ ] Inability to comply (planned absence, unreliable)
- [ ] Recent participation in other trials (washout periods)
- [ ] Baseline lab abnormalities (specific thresholds)

**Format to Extract:**
```
POPULATION DEFINITION:
Included: 
  1. Men age 60-80 years
  2. Histologically confirmed prostate cancer, clinical stage [X-Y]
  3. ECOG performance status 0-2
  4. No prior radiotherapy to pelvis
  5. Life expectancy ≥10 years (investigator assessed)

Excluded:
  1. Metastatic disease (distant organs)
  2. Creatinine >2 mg/dL
  3. Prior prostate cancer treatment <6 months ago
  4. Participation in other trial within past month
  
Study Population:
  - Enrolled: N = 455
  - Randomized: N = 455 
  - Completed: N = 418 (91.9%)
  - Analysis population: N = 450 (ITT)
  
Baseline characteristics: [See Table 1]
- Mean age: X years (SD Y)
- Ethnicity: [%s by group]
- [Other key variables as shown in Table 1]
```

#### **B. Sample Size Calculation**

**This appears on 5/6 exam years - MASTERY REQUIRED**

**What Exams Expect:**
1. Explicit parameters (not vague "we calculated sample size")
2. Formula or method (power.t.test in R, or formula written out)
3. Justification for each parameter choice
4. Actual calculated N and how it was adjusted
5. Comparison to actually enrolled sample

**WHERE TO FIND:**
- Usually in Methods > Statistical Analysis or Methods > Study Design
- Sometimes in supplementary appendix
- Check if it references a published protocol

**REQUIRED EXTRACTION FORMAT:**

```
SAMPLE SIZE CALCULATION:

Primary Endpoint: [name], Type: [binary/continuous/time-to-event]

Parameters Used:
- Alpha (2-tailed): 0.05
- Beta: 0.10 (90% power) OR 0.20 (80% power)
- Effect size to detect: [CLINICALLY MEANINGFUL DIFFERENCE]
  * For continuous outcomes: X units (SD Y)
  * For binary outcomes: [X]% in intervention vs [Y]% in control
  * For time-to-event: HR = Z
  * Justification: [Pilot data/published literature/MCID estimate] → cite source

- Assumptions:
  * Baseline [outcome] rate: [X]%
  * Drop-out rate: [X]% (adjustment factor: [Y])
  * [For clusters]: ICC = [X] (Design effect = [Y])
  * [For multiple endpoints]: Correlation between primary outcomes = [X]

Sample Size Formula/Method:
[Write out formula OR name the R function]

Example for simple comparison:
n = 2 × (Z_α/2 + Z_β)² × σ² / δ²
n = 2 × (1.96 + 0.84)² × (5)² / (2)²
n = 2 × 7.8416 × 25 / 4
n = 98 per group → 196 total

Calculated N: [X] per group
Total required: [X] individuals
Accounting for [Y]% dropout: [Z] participants to enroll
Published sample size: [A] actually enrolled
Ratio: [Check if adequate]

Justification for effect size choice:
"A difference of X units was chosen as clinically important based on:
[Pilot study by Doe et al showing MCID=X / Published guidelines / Expert consensus]"

IF NSN is too low:
"Authors powered for secondary endpoint instead: [explain which and why]"
OR
"Study is underpowered for primary endpoint (80% vs planned 90%)"
```

**COMMON EXAM QUESTION:**
"Calculate the required sample size if this were an individual RCT instead of cluster RCT"

**Answer Format:**
```
For INDIVIDUAL RCT (instead of current cluster RCT with ICC=0.05):
Design effect = 1 + (m-1)×ICC = 1 + (35-1)×0.05 = 2.7
Current N adjusted for clustering: 100 per arm × 2.7 = 270 per arm total

For individual RCT: 100 per arm would suffice (no clustering penalty)
Reduction: 270 → 100 per arm (62.9% smaller sample needed)

Reason: Clustering creates correlation within clusters, reducing independent observations
```

---

### **3. Randomization/Allocation (For RCTs)**

**What Exams ALWAYS Ask:**
- "What is [X type of] randomization?"
- "How does randomization preserve allocation concealment?"
- "Could selection bias have occurred?"

#### **A. Randomization Methods**

| Method | How It Works | When Used | Advantages | Disadvantages | How to Verify |
|--------|------------|----------|-----------|---------------|-------------|
| **Simple Randomization** | Coin flip, random number table | Equal allocation desired, small trials | Simple, transparent | Baseline imbalance possible, predictable | Check if stated as "random sequence" |
| **Stratified (Block Stratification)** | Randomize within strata separately | Ensure balance on prognostic factors | Ensures balance on key variables | More complex, potential for unblinding | Check Table 1 for balance, Methods for strata list |
| **Minimization** | Allocate to group with fewer similar patients | Optimize balance, unequal allocation ok | Best balance possible, handles multiple factors | Complex, not truly random (deterministic), less allocation concealment | Check Methods for description, Table 1 balance |
| **Adaptive Randomization** | Response-adaptive or covariate-adaptive | Incorporate emerging data or baseline covariates | Ethical (more patients to better treatment), tailored | Complex implementation, not truly random | Look for "adaptive" in Methods |
| **Cluster Randomization** | Randomize groups/clusters, not individuals | Systemic interventions, organizational level | Prevents contamination | Larger sample needed, fewer units | Check if unit is school/clinic/ward not individual |

**WHERE TO FIND:** Methods > Randomization section, often with Figure 1 flow diagram, check Table 1 for balance evidence

**REQUIRED EXTRACTION:**

```
RANDOMIZATION METHOD:

Type: Stratified block randomization

Details:
- Stratification factors: [List all]
  * Factor 1: [levels, e.g., ECOG 0 vs 1-2]
  * Factor 2: [levels, e.g., Age <70 vs ≥70]
  * Factor 3: [levels, etc.]
  
- Block size: [fixed vs variable], specified as [X]
  
- Allocation ratio: [1:1 or other], [equal/unequal]

- Concealment method: [central randomization server / sealed envelopes / other]
  Verification: [impossible to predict assignment / able to determine]

- Implementation: [who generated sequence, who assigned, separation of roles]

- Evidence of successful randomization:
  * Table 1: No significant differences at baseline except by chance
  * Chi-square/t-tests for baseline variables: all p > 0.05 (except 1-2 by chance)
  * Balance achieved on all stratification factors
```

#### **B. Allocation Concealment Assessment**

**Exam Question:** "Could selection bias have occurred?"

**Answer Format:**
```
Selection Bias Risk: [LOW / HIGH / UNCLEAR]

Evidence:
- Allocation concealment: [central sequence/database/sealed opaque envelopes/other]
  * Secure: prevents bias-driven enrollment
  * Insecure: [describe how selection bias could occur]
  
- Blinding of randomizers: [Yes/No - were they blinded to treatment assignment?]

- Predictability: [Minimization/adaptive randomization = deterministic = possible for investigator to predict]

Conclusion:
"Selection bias risk is LOW because:
- Central telephone randomization prevents investigator from knowing allocation before enrollment
- No prior knowledge of stratification factors enables selection gaming
- Stratification conducted simultaneously as enrollment"
```

---

### **4. Blinding/Masking**

**Why This Matters:** Potential source of bias; exams ask "Why is lack of blinding not a problem?" or "How is blinding maintained?"

#### **A. Blinding Completeness Matrix**

| Who/What | Blinded? | How Achieved | Verification | Impact if Unblinded |
|----------|----------|-------------|-------------|-------------------|
| **Participant** | Yes/No/Partial | Identical-appearing placebo / sham / not feasible | Ask participants / biomarkers / checks | High bias for subjective outcomes |
| **Care Provider** | Yes/No/Partial | [if not evident, write "not described"] | Verify provider didn't know treatment | Affects behavior with pt, dosing adjustments |
| **Outcome Assessor** | Yes/No/Partial | Central assessment / blinded raters / independent assessor | Verify not present during treatment | HIGH bias if assessing subjective outcomes |
| **Data Analyst** | Yes/No/Partial | Coded group letters / independent analysis | Verify analyst not aware of allocation | Selective reporting risk |
| **Study Sponsors** | Yes/No/Partial | [describe method] | Check for unblinding interim analyses | Affects trial stopping decisions |

**WHERE TO FIND:** Methods > Blinding section, sometimes mentioned with each outcome type

**REQUIRED EXTRACTION:**

```
BLINDING STRUCTURE:

Design: [Double-blind RCT / Open-label / Single-blind assessor / Unblinded]

Details:
- Participants: [Blinded/Not blinded/Partially] via [mechanism]
  * Method: [Identical appearing tablets / sham procedure / obviously different appearance]
  * Verification: [Post-randomization questionnaire / video observation / none mentioned]
  
- Care providers: [Blinded/Not blinded] via [mechanism]
  * Possible to achieve? [Yes = feasible for oral drugs / No = infeasible for surgery]
  
- Outcome assessors: [Blinded/Not blinded] for outcomes:
  * Objective (mortality, lab values): [blinding unnecessary]
  * Subjective (pain, function): [Blinded or at HIGH BIAS RISK]
  
- Data analysts: [Blinded/Not blinded]

Blinding verification:
- Success confirmed by: [Post-trial questionnaire / blinding index / not assessed]
- Results if available: [% of participants who correctly guessed / % of assessors unaware]

Assessment of bias risk from unblinding:
IF BLINDED: LOW BIAS RISK
IF UNBLINDED:
- For objective outcomes (mortality): BIAS RISK: LOW
  Reason: No subjective judgment involved
- For subjective outcomes (pain): BIAS RISK: HIGH
  Reason: Expectations affect participant report and assessor rating
```

---

### **5. Study Procedures & Intervention Delivery**

#### **A. Intervention Details**

**Exam Question Frequency:** Every year (How is treatment delivered?)

**REQUIRED EXTRACTION (Be Specific - Exact Numbers/Names):**

```
INTERVENTION ARM:

Drug/Treatment Name: [Generic and brand name if applicable]

Formulation:
- Route: [oral, IV, intramuscular, subcutaneous, topical, etc.]
- Form: [tablet, capsule, solution, suspension, etc.]
- Strength: [specific dose per unit, e.g., 2.5 mg/tablet]

Dosing:
- Initiation: [Starting dose, any titration schedule]
  * Week 1: X mg daily
  * Week 2-4: X mg daily after titration
  * Maintenance: Y mg daily
  
- Frequency: [X times per day, every Y hours, weekly, etc.]

- Duration of Treatment: [X weeks/months/years total]

- Stopping Rules: [Were there pre-specified reasons to stop?]
  * Toxicity grade ≥ 3 (if available)
  * Inadequate response at [time point]
  * Participant request
  * Safety signals

- Concomitant Treatments:
  * Allowed: [list permitted medications]
  * Prohibited: [list contraindicated medications]
  * Adjustments needed: [e.g., "hold on days of radiotherapy"]

- Compliance/Adherence Monitoring:
  * Method: [pill counts / pharmacy refills / diaries / blood levels / none stated]
  * Result: [mean compliance %, range, difference between groups]

Delivery Setting:
- Location: [clinic, home, hospital]
- Frequency of contact: [weekly visit, monthly telephone]
- Provider type: [nurse, physician, self-administered]
```

#### **B. Control/Comparator Arm**

**CRITICAL:** Exams expect equal detail on what the control group received, not just "standard care"

```
CONTROL ARM:

Type: [Placebo / Active comparator / Standard care / Observation only]

Specification:
- If Placebo: [Identical in appearance/taste/delivery to intervention? YES/NO]
  * Matched on all sensory characteristics
  * Same delivery frequency and setting
  
- If Active Comparator: [Exactly what treatment?]
  * [Full details same as intervention above]
  
- If Standard Care: [What does standard care include?]
  * Routine follow-up visit frequency
  * Permitted treatments
  * Permitted medications
  * Optional treatments offered

- Blinding Success: [Was placebo credible? Any indication placebo worked differently?]
```

---

## 📊 STATISTICAL DETAILS

### **1. Outcomes (Primary & Secondary)**

**This is CRITICAL - Exams test outcome definition knowledge**

**WHERE TO FIND:** Methods > Outcomes section

#### **A. Primary Outcome Definition**

**EXACT EXTRACTION REQUIRED (These are tested every year):**

```
PRIMARY OUTCOME:

Name: [Exact name as stated in Methods]
Abbreviation: [e.g., OS, PFS, HbA1c]

Definition: [Complete operational definition]
  Example: "Overall survival = time from randomization to death from any cause"
  NOT: "How long did patients live?" (too vague)

Type: [Binary / Continuous / Time-to-event / Composite]
- Binary example: death yes/no
- Continuous example: change in HbA1c (units: mg/dL or %)
- Time-to-event example: months until event or censoring
- Composite example: composite of death, MI, or stroke (must list ALL components)

Timing of Assessment: [When was it measured?]
- Primary timepoint: [3 months / 1 year / 5 years post-randomization]
- When counting started: [From randomization date / From treatment start]
- How long follow-up: [Minimal / up to X years]

Measurement Method:
- Who measured: [clinician assessment / self-report / laboratory / electronic records]
- Tool used: [validated scale name if applicable, reference citations]
- How often measured: [continuous monitoring / weekly / monthly / at end-of-study]
- Units of measurement: [mg/dL, points on scale 0-100, yes/no, etc.]

Blinding of Assessor: [Yes / No / Unclear]
- For objective outcomes (lab values): blinding not needed
- For subjective outcomes (pain): blinding critical to reduce bias

Primary Analysis Strategy:
- Analytic approach: [e.g., "Cox proportional hazards model for time-to-event"]
- Covariates adjusted for: [list if any]
- Subgroup analyses planned: [Yes, list prespecified subgroups / No]
```

**EXAMPLE (from exam articles):**
```
PRIMARY OUTCOME (STAMPEDE):
Name: Failure-free survival (FFS)

Definition: Time from randomization to either:
  1) Clinical or radiological progression of prostate cancer (any site), OR
  2) Death from any cause (whichever earlier)

Type: Time-to-event (composite of two components)

Timing: 
- Follow-up duration: Minimum 3 years
- Median follow-up: 4.6 years (range 0.3-7.2)
- Primary analysis at: 3-year timepoint

Measurement Method:
- Monitored via: clinic visits at [frequency], imaging per protocol
- Assessment: PSA levels, imaging (CT/bone scan), clinical examination

Primary Analysis:
- Cox proportional hazards regression, stratified by randomization factors
- Hazard ratio (95% CI) reported vs control
```

#### **B. Secondary Outcomes** (List ALL)

```
SECONDARY OUTCOMES:

[For EACH secondary outcome, provide same level of detail as primary]

Outcome 1: [Name]
- Definition: [operational]
- Type: [binary/continuous/time-to-event/composite]
- Timing: [assessment timepoint]
- Measurement: [how assessed, by whom, tool if applicable]

Outcome 2: [Name]
- [repeat for all]

Hierarchical Testing:
- Were secondary outcomes tested in hierarchical fashion? [Yes/No]
- Order of significance testing: [Outcome 1, then 2, then 3... STOP if p>0.05 for outcome 2]
- OR: Were all tested without multiplicity correction? [describes alpha inflation risk]
```

#### **C. Exploratory/Safety Outcomes**

```
EXPLORATORY OUTCOMES:
[Any outcomes not powered for, but examined]

SAFETY OUTCOMES:
- Adverse events: [grading system used: CTCAE / NCI / other]
  * Any grade ≥ 3 reported? [Yes/No]
  * Serious adverse events separately tabulated? [Yes/No]
  * Deaths (even if on control) reported? [Yes/No]

- Pharmacokinetic outcomes: [if applicable, e.g., blood levels]

- Laboratory monitoring: [LFTs, CBC, renal function - how often?]

- Withdrawals due to adverse events: [reported for each arm]
```

---

### **2. Statistical Analysis Methods**

**CRITICAL EXAM QUESTION:** "What statistical test was used and why? What are the assumptions?"

#### **A. Choosing & Justifying the Test**

| Outcome Type | Test Used | Assumptions | R Command | When Applied |
|---|---|---|---|---|
| **Binary outcome (yes/no)** | Chi-square or Fisher's exact | Independence, expected cell freq >5 | chisq.test() | Comparing proportions between 2 groups |
| **Binary - many groups** | Chi-square or Mantel-Haenszel | Same assumptions | mantelhaen.test() | 3+ groups, controlled for stratum |
| **Binary - adjusted** | Logistic regression | Linearity on logit scale, independence | glm(...family=binomial) | Adjusting for covariates |
| **Continuous (normal)** | t-test or ANOVA | Normality, homogeneity of variance | t.test() or aov() | Continuous outcome, normally distributed |
| **Continuous - adjusted** | ANCOVA or multiple regression | Normality, linearity, homogeneity of variance | lm(y ~ group + covariate) | Adjusted for baseline |
| **Continuous (non-normal)** | Mann-Whitney or Kruskal-Wallis | Assumes ordinal/rank data | wilcox.test() | Non-normal distributions, small N |
| **Time-to-event (survival)** | Kaplan-Meier + Cox | Proportional hazards assumption | survfit(), coxph() | Comparing time to event between groups |
| **Time-to-event - stratified** | Stratified log-rank test | Proportional hazards | survfit(...strata=) | Stratified RCT |
| **Repeated measures** | Generalized Estimating Equations (GEE) or mixed models | Working correlation structure | gee() or lme() | Multiple measurements per person |
| **Clustered data** | Mixed models with random intercepts/slopes | ICC structure specified | glmer() | Data from clusters (schools, clinics) |
| **Count data (Poisson)** | Poisson regression or negative binomial | Mean=variance or overdispersion | glm(...family=poisson) | Count outcomes |
| **Multiple endpoints** | Multiple testing correction: Bonferroni, Benjamini-Hochberg, closed testing | Controls family-wise error rate | p.adjust() | >1 primary or co-primary outcome |
| **Interaction (multiplicative vs additive)** | Regression with product term vs on risk scale | Interpretation differs | glm with term X*Z | Testing effect modification |
| **Interaction (additive)** | Regression relative excess risk due to interaction (RERI) | Additive scale interpretation | RERI = RR11 - RR10 - RR01 + 1 | Epidemiology: public health impact |

**REQUIRED EXTRACTION TEMPLATE:**

```
STATISTICAL ANALYSIS METHODS:

PRIMARY OUTCOME ANALYSIS:
Test Used: [Name of test]
Justification: [Why this test?]
  - Outcome type: [binary/continuous/time-to-event]
  - Distribution: [normal / skewed / binomial / other]
  - Number of groups: [2 / 3+ ]
  - Adjustment: [stratification / regression covariates]

Assumptions Checked:
  [ ] Normality: [tested via QQ plot / Shapiro-Wilk, result: normal/non-normal]
  [ ] Homogeneity of variance: [Levene's test, result: p=X]
  [ ] Proportional hazards (if time-to-event): [tested via Schoenfeld residuals, result: p=X]
  [ ] Independence of observations: [confirmed by design]

Covariates/Adjustments:
  - Stratification variables used in analysis: [list]
  - Regression-adjusted covariates: [list with justification for inclusion]
  - Why these covariates? [predisposed to imbalance, known confounders, etc.]

Analysis Population:
  - Intent-to-treat (ITT): [All randomized, analyzed as allocated]
  - Per-protocol (PP): [Only those who completed treatment as planned]
  - Modified-ITT (mITT): [ITT with patients having baseline + ≥1 post-baseline assessment]
  - Which used for primary analysis? [typically ITT]

Multiple Comparisons:
  - Number of primary outcomes: [1 / >1]
  - Number of secondary outcomes: [X]
  - Multiplicity adjustment: [Bonferroni / Benjamini-Hochberg / hierarchical / none]
  - Adjusted alpha: [0.05 / 0.025 / other]
  
Interim Analyses:
  - Planned? [Yes with stopping rules / No]
  - If yes, how many? [scheduled at X% information / fixed time points]
  - Stopping rules: [futility / efficacy / safety thresholds]
  - Alpha spending: [method to preserve type I error]

SECONDARY/EXPLORATORY OUTCOMES:
[Repeat similar detail for each]
```

**COMMON EXAM QUESTION:** "What are the assumptions of [test X]? Are they violated?"

**Answer Template:**
```
Assumptions of Cox proportional hazards:
1. Proportional hazards: Hazard ratio constant over time
   - Tested by: Schoenfeld residuals regression
   - Result: p = [X]
   - Violated? [No, p > 0.05 / Yes, consider stratification]

2. Independence of observations: Each participant's event time not influenced by others
   - Confirmed by: RCT design, no clustering
   - Violated? [No]

3. Linearity of continuous covariates: Linear relationship on log-hazard scale
   - Checked by: [None reported / tested via spline smooth / violated, use transformed variable]

4. No ties (beyond small number): Continuous event times
   - Addressed by: [Method specified for ties, e.g., Breslow method]

Conclusion: Assumptions [satisfied / partially violated for X / not checked], 
Analysis [is robust / may be biased / alternative method recommended]
```

---

### **3. Multiple Comparisons & Alpha Correction**

**WHY IMPORTANT:** Exams test understanding of alpha inflation with multiple testing

**EXTRACTION MATRIX:**

```
MULTIPLE COMPARISONS CONTEXT:

Number of Outcomes Being Tested:
- Primary outcomes: [1 / >1]
- Secondary outcomes: [X total]
- Subgroup analyses: [Y total - for each subgroup tested]
- Total number of statistical tests: [Sum for all]

Alpha Level & Correction:
- Declared significance level: p < 0.05 (2-tailed)
- Multiplicity adjustment applied? [Yes / No / Unclear]
- If Yes, method: [Bonferroni / Benjamini-Hochberg / hierarchical closed testing / other]
- Adjusted alpha: [0.05 / 0.025 / 0.0167 / other]

Hierarchy (if applicable):
  1st: Primary outcome tested at p < [X]
  2nd: Secondary outcome 1 tested IF primary p < [Y] ... (stopping rule)
  3rd: [etc.]

Results:
- Primary outcome: p = [X]
- Secondary outcome 1: p = [Y]
- Secondary outcome 2: p = [Z]

Risk of False Positive:
- Family-wise error rate: [controlled / not controlled]
- If not controlled: "With X tests at p<0.05, probability ≥1 false positive = [1-(0.95^X)]"
- Report: [Describe which results significant at adjusted alpha vs unadjusted]
```

**EXAM QUESTION EXAMPLE:**
"The article presents results for 8 secondary outcomes, none with p-value correction. Are these results reliable?"

**Answer:**
```
High risk of Type I error (false positives).

Calculation:
- 8 independent tests at p < 0.05
- Expected false positives: 0.05 × 8 = 0.4 per set of 8 tests
- Probability ≥1 false positive: 1 - (0.95)^8 = 34% chance

Bonferroni-corrected alpha would be: p < 0.05/8 = 0.0063

Results at Bonferroni-corrected significance: [only X remains significant]

Conclusion: Only outcomes with p < 0.0063 should be considered significant; 
others treated as exploratory due to multiplicity
```

---

## 📈 RESULTS & OUTCOMES

### **1. Primary Outcome Results**

**CRITICAL FORMAT (Every answer about results must include):**

```
PRIMARY OUTCOME RESULTS:

Outcome: [Name]

Intervention Group:
  - N analyzed: [X]
  - Events/Mean: [X / mean=Y (SD=Z)]
  - If time-to-event: median = [X] months (95% CI: [Y-Z] months)
  - Follow-up: [median = X, range Y-Z months]

Control Group:
  - N analyzed: [X]
  - Events/Mean: [X / mean=Y (SD=Z)]
  - If time-to-event: median not reached [or = X months]

Effect Size:
  - Difference (Intervention - Control): [X]
  - 95% Confidence Interval: [Y to Z]
  - P-value: [X]
  - Statistical significance: [p < 0.05 = YES / p ≥ 0.05 = NO]

Clinical Significance:
  - MCID (minimal clinically important difference): [X units] [cite source]
  - Observed difference of [Y] vs MCID [X]: [exceeds / meets / below] clinical threshold
  - Interpretation: [clinically meaningful / modest / minimal clinical benefit]

Number Needed to Treat (NNT) or Harm (NNH) [if applicable for binary outcomes]:
  - NNT: [number patients must treat to prevent 1 event vs control]
  - Calculation: NNT = 1 / (Risk_intervention - Risk_control)

Absolute Risk Reduction (ARR) [if binary outcome]:
  - ARR: [X]% - [Y]% = [Z]%
  - Interpretation: Intervention reduces risk by Z percentage points

Relative Risk (RR) or Relative Risk Reduction (RRR) [if binary]:
  - RR: [X] (95% CI: [Y-Z])
  - RRR: [100 × (1-RR)]%

Hazard Ratio (HR) [if time-to-event]:
  - HR: [X] (95% CI: [Y-Z])
  - Interpretation: [X]% [lower/higher] hazard in intervention vs control
  - Proportional hazards assumption: [checked/violated]

COMPARISON TO NON-INFERIORITY OR SUPERIORITY MARGIN:
  [If applicable, was primary hypothesis superiority or non-inferiority?]
  
  For Superiority trials:
  - Margin: [typically 0 for superiority]
  - Result: [hypothesis met: CI does not cross 0 / hypothesis not met: CI crosses 0]
  
  For Non-inferiority trials:
  - Non-inferiority margin: [e.g., -0.5 on pain scale, -20% for binary]
  - Justification: [Regulatory guidance / MCID / prior studies]
  - Result: [Lower CI bound > margin = non-inferiority proven / 
            Lower CI bound ≤ margin = non-inferiority not shown]
```

**EXAMPLE FROM EXAM FILES:**

```
PRIMARY OUTCOME: Overall Survival (OS)

Intervention (Radiotherapy):
  - N analyzed: 225
  - Deaths: 87
  - 3-year OS: 64% (95% CI: 57-70%)
  - Median OS: not reached (95% CI: 7.3-NR years)

Control (Observation):
  - N analyzed: 226
  - Deaths: 100
  - 3-year OS: 61% (95% CI: 54-67%)
  - Median OS: 7.0 years (95% CI: 5.8-8.2 years)

Effect Size:
  - Hazard Ratio: 0.92 (95% CI: 0.70-1.21)
  - P-value: 0.266
  - Statistical significance: NO (p > 0.05)
  - Interpretation: Radiotherapy does NOT significantly improve overall survival

Clinical Significance:
  - MCID not pre-specified in this trial
  - Observed HR 0.92 = 8% lower hazard vs observation alone
  - At population level: modest benefit only

Conclusion: Primary objective NOT met. Radiotherapy alone did not extend overall survival 
compared to observation in men with localized prostate cancer.
```

### **2. Secondary Outcome Results**

**For EACH secondary outcome, provide:**

```
SECONDARY OUTCOME [#]: [Name]

Intervention: [specific value/rate]
Control: [specific value/rate]
Effect estimate: [difference / RR / HR]
95% CI: [X-Y]
P-value: [X]
Status: [significant / not significant at p<0.05 / significant only after Bonferroni correction]

Clinical interpretation: [brief]

Note: [was this outcome powered? was there multiplicity correction?]
```

---

### **3. Subgroup Analysis Results**

**CRITICAL FOR EXAMS:** "Do results hold across subgroups? Is there effect modification?"

```
SUBGROUP ANALYSES:

Subgroups Analyzed [Should be PRE-SPECIFIED]:
  - Subgroup 1: [variable and levels, e.g., age <65 vs ≥65]
  - Subgroup 2: [variable and levels, e.g., ECOG 0 vs 1-2]
  - [etc. list all prespecified subgroups]

For EACH Subgroup:

SUBGROUP 1: Age <65
  - N in intervention: X, Control: Y
  - Effect in this subgroup: HR = 0.85 (95% CI: 0.65-1.10), p = 0.22
  - Pattern: [benefit / no benefit / opposite direction]

SUBGROUP 2: Age ≥65
  - N in intervention: X, Control: Y
  - Effect in this subgroup: HR = 1.02 (95% CI: 0.75-1.39), p = 0.92
  - Pattern: [benefit / no benefit / opposite direction]

INTERACTION TEST (Do effects differ significantly across subgroups?):
  - Statistical test: [e.g., product term in Cox model]
  - Interaction p-value: [0.008]
  - Significant interaction? [YES if p<0.05 / NO if p≥0.05]
  - Interpretation: [Effect DOES / DOES NOT differ significantly by age]

Pre-specified vs Post-hoc:
  - Were these subgroups PRE-SPECIFIED in statistical analysis plan? [Yes / No]
  - If post-hoc: [High risk of false positive if multiple comparisons]

Conclusion on Subgroup Findings:
  [Provide overall judgment on whether subgroup differences are real or likely due to chance]
```

**EXAM QUESTION EXAMPLE:**
"The authors show subgroup interaction p=0.0098 between disease burden and radiotherapy benefit. Are these results reliable?"

**Answer:**
```
POSSIBLY UNRELIABLE. Several concerns:

1. Multiple subgroup testing:
   - If testing 10 subgroups at p<0.05, expect 1 false positive
   - Single p-value of 0.0098 appears significant but may be by chance

2. Small subgroup sample sizes:
   - Low burden: N=[X] total (may be underpowered)
   - High burden: N=[Y] total (may be underpowered)
   - Underpowered subgroups produce unstable effect estimates

3. Pre-specified vs post-hoc:
   - Were these subgroups declared a priori? [Not clearly stated]
   - If not, results are exploratory and require replication

4. Biological plausibility:
   - Does the interaction make physiologic sense?
   - [Yes/No - provide rationale]

Recommendation:
- Treat as exploratory finding pending confirmation in next trial
- Should be pre-specified in future studies if hypothesized
```

---

### **4. Adverse Events Reporting**

**WHERE TO FIND:** Results section, usually in table, often grouped by severity

```
ADVERSE EVENTS:

Severity Grading System Used: [CTCAE v5.0 / Common Terminology Criteria / other]
  - Grade 1: [mild]
  - Grade 2: [moderate]
  - Grade 3: [severe]
  - Grade 4: [life-threatening]
  - Grade 5: [fatal]

Serious Adverse Events (SAE):
  - Definition in trial: [provided or assumed = Grade ≥3 or required hospitalization]
  - Total SAEs - Intervention: [N/total (%)]
  - Total SAEs - Control: [N/total (%)]
  - Difference: [X%] - [Y%] = [Z]%

Any Grade Adverse Events:
  - Intervention group: [N/total (%)]
  - Control group: [N/total (%)]

Grade ≥3 Adverse Events:
  - Intervention group: [N/total (%)]
  - Control group: [N/total (%)]

Most Common Adverse Events [List for each arm]:
  Intervention arm:
    - Event 1: [X%]
    - Event 2: [Y%]
    - Event 3: [Z%]
    [etc.]

Deaths [If applicable]:
  - Total deaths - Intervention: [N/total (%)]
  - Total deaths - Control: [N/total (%)]
  - Deaths attributed to study drug: [N - specify which]
  - Deaths from other causes: [N]

Withdrawals Due to Adverse Events:
  - Intervention: [N/total (%)]
  - Control: [N/total (%)]

Safety Monitoring:
  - Data Safety Monitoring Board (DSMB): [Yes/No]
  - Interim safety analyses: [Yes/No - how often?]
  - Any trial modifications for safety: [Yes/No - describe]

Interpretation:
  - Safety profile of intervention vs control: [acceptable / concerning / similar]
  - Organ toxicities of concern: [list]
  - Reversible vs permanent toxicities: [describe]
```

---

## 🔬 CRITICAL APPRAISAL FRAMEWORK

### **1. Internal Validity (Bias Assessment)**

**What Exams Test:** "What could be wrong with this study? What biases might affect results?"

#### **A. Selection Bias**

```
SELECTION BIAS RISK ASSESSMENT:

Source: Differences between groups at baseline related to prognosis

Potential Sources:
  1. Allocation bias - systematic assignment to favored group
     - RCTs: Concealment method: [adequate/inadequate/unclear]
     - Observational: Affected by unmeasured confounding
  
  2. Attrition bias - differential losses between groups
     - Intervention: N lost = [X], % = [Y%]
     - Control: N lost = [A], % = [B%]
     - Difference: [C%] - significantly different? [Yes/No]
     - Reasons for loss similar? [describe]

Risk Assessment: [LOW / MODERATE / HIGH]
Evidence:
- [for LOW]: Randomization with allocation concealment, ITT analysis, minimal attrition
- [for HIGH]: Non-random assignment, differential loss >10%, complete case analysis

Conclusion: Selection bias [unlikely to affect results / likely causing bias toward intervention]
```

#### **B. Information Bias (Measurement Bias)**

```
INFORMATION BIAS RISK ASSESSMENT:

Source: Misclassification or mismeasurement of outcome/exposure

Types:

1. Differential information bias - differs between groups
   - Outcome assessor blinded? [Yes/No]
   - Measurement tool same for both groups? [Yes/No]
   - Expectancy effects possible? [Yes/No - for subjective outcomes]
   - Example: Unblinded assessors may report intervention benefits more favorably

2. Non-differential information bias - same in both groups
   - All participants measured same way regardless of group
   - Typically biases toward null (reduces observed effect)

Measurement Methods:
  - Primary outcome measured by: [subjective/objective]
  - Validity of measurement tool: [validated scale with evidence / new unvalidated tool]
  - Reliability: [tested inter-rater reliability? Yes/No]

Risk Assessment: [LOW / MODERATE / HIGH]
Evidence:
- [for LOW]: Objective outcomes (mortality) or validated, blinded assessment
- [for HIGH]: Subjective outcomes, unblinded assessors, unvalidated measures

Conclusion: Information bias [unlikely / likely biasing results toward [direction]]
```

#### **C. Confounding (Especially Important for EPI)**

```
CONFOUNDING RISK ASSESSMENT:

Source: Alternate explanation for observed association

Confounder Criteria (must meet ALL):
  1. Associated with exposure/intervention
  2. Associated with outcome
  3. Not on causal pathway (not a mediator)
  4. Not controlled for

Known Confounders:
  [Based on literature, identify confounders relevant to this research question]
  
Measured & Controlled:
  - Confounder 1: [measured / not measured]
    * If measured: adjusted via [matching / stratification / regression]
    * If not measured: potential for residual confounding

Unmeasured Potential Confounders:
  [List variables known from literature but not reported in article]
  - Confounder A: [describe potential direction of bias]
  - Confounder B: [describe potential direction of bias]

Direction of Bias:
  - If confounder associated with [favoring intervention + increasing outcome risk]:
    Bias direction: TOWARD NULL (observed effect smaller than true effect)
  - If confounder associated with [favoring intervention + decreasing outcome risk]:
    Bias direction: AWAY FROM NULL (observed effect larger than true effect)

Risk Assessment: [LOW / MODERATE / HIGH]
Evidence:
- [for LOW]: RCT design (randomization eliminates confounding), good adjustment in observational
- [for HIGH]: Observational study with inadequate adjustment, unmeasured confounding likely

Conclusion: Confounding [unlikely to explain results / likely explains [X%] of observed effect]
```

---

### **2. External Validity (Generalizability)**

**What Exams Test:** "Can these results apply to my patient?" or "To whom do results generalize?"

```
EXTERNAL VALIDITY ASSESSMENT:

Study Population:
  - Inclusion criteria specificity: [very restrictive / moderate / inclusive]
  - Examples of exclusions that limit population:
    * [Criterion 1]: excludes [X%] of target population
    * [Criterion 2]: excludes [Y%] of target population
  - Age range: [X-Y] - [does/doesn't match typical patient age]
  - Comorbidities: [enrolled healthy only / includes comorbidities / etc.]
  - Disease stage: [early only / advanced only / mixed]
  - Geographic: [single country / multisite international / limits relevance to...]

Intervention Delivery:
  - Setting: [academic center / community practice / both]
  - Provider expertise: [research specialists / routine practitioners]
  - Resource requirements: [intensive monitoring / routine / feasible in practice]
  - Intensity: [doses used / frequency / duration - realistic for clinical practice?]

Comparison Group:
  - Representative of standard care? [Yes/No - describe differences]
  - Outcome measurement: [research protocol / routine clinic practice]
  - Duration of follow-up: [typical for practice / unusually long/short]

Primary Outcome Relevance:
  - Outcome: [patient-relevant: mortality/disability / proxy: lab value/surrogate]
  - Timeframe: [clinically relevant window / too short/long]

Applicability to Target Population:
  - "My patient" meets inclusion/exclusion? [Yes/No - describe]
  - Expected effect size in clinical practice: [likely same / likely smaller / uncertain]
  - Reasons observed trial effect might not generalize:
    * [Higher intensity in research setting]
    * [More adherent population selected]
    * [More intensive monitoring]

Risk Assessment: [HIGHLY GENERALIZABLE / MODERATE / LIMITED GENERALIZABILITY]

Conclusion: Results [directly applicable / require adaptation / not applicable] to [target population]
```

---

### **3. Statistical Power & Precision**

```
POWER ASSESSMENT:

Primary Outcome:
  - Planned power: [80% / 90% / other] at alpha [0.05 / other]
  - Effect size to be detected: [X]
  - Actual N achieved: [N vs planned N]
  - Adequately powered? [Yes / No - underpowered by X%]

Secondary Outcomes:
  - Were secondary outcomes powered? [Yes / No]
  - If powered: [specify effect sizes]
  - If not powered: [typically exploratory only]

Results:
  - Primary outcome: p = [X]
  - 95% CI: [narrow/wide - includes/excludes clinically meaningful difference?]
  - If non-significant: [CI excludes clinical difference = true null / 
                        CI wide = insufficient information]

Confidence Interval Interpretation:
  - Width: [narrow = precise / wide = imprecise]
  - Bounds: [both clinically meaningful / one or both trivial]
  
  Example:
  - HR 0.92 (95% CI: 0.70-1.21)
  - CI includes 1.0 (no effect), lower bound 0.70 (30% reduction possible), 
    upper bound 1.21 (21% increase possible)
  - Precision: inadequate to determine whether true effect exists

Conclusion: Study [adequately / inadequately] powered; results [definitive / inconclusive]
```

---

### **4. Design Appropriateness & Limitations**

```
DESIGN APPROPRIATENESS:

Study Design: [Type]

Question to Answer: [What was the research question?]

Is design appropriate? [Yes / No / Yes with limitations]

Justification:
  ✓ Allows temporal sequence (exposure before outcome): [RCT/cohort = yes; case-control/cross-sectional = no]
  ✓ Controls for confounding: [RCT = best; matched case-control = moderate; regression = partial]
  ✓ Can establish causation: [RCT = yes if unbiased; observational = no, but can test associations]
  ✓ Efficient for outcome: [RCT = yes for common outcomes; cohort = maybe for rare]
  ✓ Ethical: [intervention justifiable?]

Alternatives Considered:
  - Why not RCT? [infeasibility / unethical / unnecessary cost]
  - Why not cohort? [design choice rationale]
  - Why not case-control? [design choice rationale]

Conclusion: Design [ideal / appropriate / questionable / inappropriate] for research question
```

---

## 📌 EPI-SPECIFIC EXTRACTION

**Additional Information Required for Epidemiology Articles:**

### **1. Confounding & Effect Modification**

```
CONFOUNDING ANALYSIS:

Measured Confounders:
  [Create a table]
  
  Confounder | Associated w/ Exposure? | Associated w/ Outcome? | Adjusted? | Residual Confounding?
  ---|---|---|---|---
  Confounder A | Yes/No | Yes/No | Yes/No | Yes/No
  
Unmeasured Confounding:
  - Potential unmeasured confounders: [list with justification]
  - Direction of bias: [toward/away from null]
  - Sensitivity analysis or E-value? [performed / not performed]

Adjustment Strategies Used:
  - Matching: [on what variables? success of matching?]
  - Stratification: [by what variables?]
  - Regression: [what variables, method: logistic/Cox/Poisson?]
  - Dose-response: [evidence of linear trend suggesting causation?]

Distinguishing Confounder from Mediator:
  [COMMON EXAM QUESTION]
  - Confounder: on causal pathway from exposure to outcome? [NO]
  - Mediator: on causal pathway? [YES - adjust = underestimate effect]
  
  Example: 
  - Smoking → Hypertension → Stroke
  - If interested in smoking effect on stroke:
    * Adjust for hypertension? [NO if mediator, YES if confounder]
    * Article adjusted for hypertension: [analyze whether mediator or confounder]
```

### **2. Interaction Analysis (EPI Focus)**

```
INTERACTION ANALYSIS:

Effect Modification Tested:
  - Variables tested for interaction: [list all tested]
  - Interaction significant? [Yes/No - provide p-value]

Multiplicative Interaction:
  - Definition: Product term in log scale
  - Test: [logistic/Cox/Poisson regression with product term]
  - Result: p = [X]
  - Interpretation: [effect of X on outcome differs by level of Y?]

Additive Interaction:
  - Definition: Deviation from additive effect on absolute risk scale
  - Test: [calculate RERI = RR11 - RR10 - RR01 + 1]
  - Result: RERI = [X] (95% CI: [Y-Z])
  - Interpretation: [additional risk beyond additive?]
  
  - AP (Attributable Proportion): [X]% - % of disease in exposed with both factors
    attributable to interaction

Comparison:
  - Multiplicative interaction: p = [A]
  - Additive interaction: p = [B]
  - Which more significant? [one vs other]
  - Implication: [effect modifies differently on relative vs absolute scale]
```

### **3. Bias Assessment (EPI Specific)**

```
BIAS TYPES ASSESSMENT:

SELECTION BIAS:
  - Differential participation? [Describe if exposed/unexposed had different participation]
  - Participation rate: [Exposed X%, Unexposed Y% - significantly different?]
  - Loss to follow-up: [in cohorts - differential?]

INFORMATION BIAS:
  - Exposure measurement: [objective / self-reported / medical records]
  - Validity of measurement: [high / moderate / low]
  - Outcome measurement: [objective / self-reported]
  - Blinding of assessor: [outcome assessor blinded to exposure? Yes/No]
  - Differential misclassification? [Does error differ by exposure status?]

ECOLOGICAL BIAS:
  - Study design: [ecological/aggregate / individual-level]
  - Risk: [group-level associations ≠ individual-level associations]
  - Addressed? [Yes/No - how?]

DETECTION BIAS:
  - Differential surveillance between exposed/unexposed? [Yes/No]
  - Example: [if exposed more frequently tested]
  - Impact: [increases observed association]
```

### **4. Cohort-Specific Details**

```
COHORT STUDY SPECIFICS:

Cohort Definition:
  - Open vs closed cohort? [define]
  - Entry criteria: [how defined exposed/unexposed at baseline]
  - Baseline date: [when cohort assembled]

Follow-up:
  - Median follow-up: [X] years (range: [Y-Z])
  - Follow-up method: [in-person / telephone / mailed questionnaire / medical records]
  - Frequency: [every X months / years]
  - Completion rate: [X%]

Losses to Follow-up:
  - N enrolled: [X]
  - N followed: [Y]
  - Loss rate: [(X-Y)/X × 100]%
  - Reasons for loss: [if provided]
  - Different by exposure? [Yes/No]
  - Bias direction: [impact on observed association?]

Outcome Ascertainment:
  - Passive vs active surveillance? [passive = medical records reviewed / active = contacted for events]
  - Validation: [self-reported outcomes validated? Yes/No]
  - Completeness: [% of outcomes ascertained]
```

---

## 🏥 RC-SPECIFIC EXTRACTION

**Additional Information Required for Clinical Trial Articles:**

### **1. Non-Inferiority/Superiority Design**

```
TRIAL OBJECTIVE:

Hypothesis Type:
  - Superiority: Intervention better than control (margin = 0)
  - Non-inferiority: Intervention not worse than control by margin [X]
  - Equivalence: Intervention similar to control within margin [X]

Non-Inferiority Margin [If applicable]:
  - Margin value: [e.g., -0.5 points on pain scale, -20% relative risk]
  - Justification: [regulatory guidance / MCID / prior trials / expert opinion]
  - One-sided vs two-sided test: [2-sided typical for non-inferiority]

Analysis:
  - Analysis population: [ITT / per protocol / both?]
  - Test statistic: [e.g., 95% CI for difference]
  - Result: [Lower CI limit vs non-inf margin]
    * Non-inferiority proven if: [lower CI > margin]
    * Superiority proven if: [CI does not include 0]

Interpretation:
  - Non-inferiority demonstrated? [Yes / No]
  - Superiority demonstrated? [Yes / No]
  - Clinical implications: [intervention acceptable less effective / similar safety better tolerated]
```

### **2. Trial Endpoint Appropriateness**

```
EFFICACY ENDPOINT ASSESSMENT:

Primary Efficacy Endpoint:
  - Type: [surrogate / clinical / biomarker / composite]
  - Surrogate status: [validated surrogate / unclear surrogate / clinical endpoint]
  - Is surrogate appropriate? [Yes/No - cite validation evidence]

Primary vs Surrogate Endpoint Discussion:
  - Clinical endpoint: [e.g., mortality, hospitalization, major adverse event]
  - Surrogate endpoint: [e.g., lab value, imaging finding, symptom score]
  - If surrogate used: [justified because clinical endpoint impractical/too rare/requires long follow-up]
  - Validation: [does surrogate predict clinical benefit? Cite evidence]

Example Assessment:
```
Endpoint: HbA1c reduction ≥1.5%
Classification: Biomarker surrogate for clinical endpoints
Is this appropriate? PARTIALLY
  - HbA1c changes associated with microvascular complications (established)
  - HbA1c changes may not predict macrovascular benefit (debate)
  - Recommend future trial with clinical endpoints: MI, stroke, CVD death
```

### **3. Interim Analyses & Alpha Spending**

```
INTERIM ANALYSIS PLAN:

Planned Interim Analyses:
  - Number scheduled: [1 / 2 / 3+ ]
  - Timing: [e.g., at 33%, 67%, 100% of planned events]
  - Decision-makers: [Data Safety Monitoring Board / Sponsor / blinded]

Stopping Rules:
  - Efficacy boundary: [e.g., p < 0.001 to stop early for efficacy]
  - Futility boundary: [e.g., HR CI includes 1 + upper limit suggests no benefit]
  - Safety stopping rule: [specific thresholds for stopping due to harm]

Alpha Spending:
  - Method: [Pocock / O'Brien-Fleming / Lan-DeMets / other]
  - Final alpha allocated to final analysis: [e.g., 0.025 of original 0.05]
  - Justification: [controls type I error across all interim looks]

Results:
  - Interim analysis results: [provide dates and findings]
  - Trial continued or stopped? [describe decision]
  - Final sample size: [as planned / modified / increased]
```

### **4. Blinding Maintenance in Trials**

```
BLINDING IN TRIAL CONTEXT:

Participant Blinding:
  - Feasibility: [possible / impossible for intervention type]
  - Method: [identical placebo / sham procedure / active control]
  - How maintained: [pill appearance match / sham procedure protocol / etc.]
  - Verification: [post-randomization questionnaire to assess success?]
  - Success rate: [% correctly guessing assignment]

Care Provider Blinding:
  - Feasibility: [possible / impossible]
  - If possible: [Method used]
  - Practical challenges: [describe why maintained/lost]
  - If unblinded: [potential bias from behavior modification]

Outcome Assessor Blinding:
  - For objective outcomes (lab, mortality): [not needed]
  - For subjective outcomes (pain, function): [critical to prevent bias]
  - Assessment method: [central, independent raters / site investigators]
  - Success verification: [provided / not provided]

Data Analyst Blinding:
  - Was analyst blinded to treatment assignment? [Yes / No]
  - When unblinding occurred: [after database lock / during analysis]

Unblinding:
  - Any emergency unblinding? [Yes/No - describe circumstances]
  - Rate: [X patients unblinded out of N]
  - Reason: [safety / administrative error]

Impact of Blinding Loss:
  - Bias risk: [minimal for objective outcomes / high for subjective]
  - Handled in analysis: [ITT analysis minimizes bias from unblinding]
```

---

## 📝 ANSWER FORMAT TEMPLATES

### **Template 1: Design Question Answer**

**Question:** "What is [design type] and why was it used here?"

**Answer Structure:**
```
Definition: [Design type] is [concise definition]

Key Features:
1. [Feature 1]: [explanation]
2. [Feature 2]: [explanation]
3. [Feature 3]: [explanation]

Why Used in This Trial:
- Research question required: [causal inference / prevalence estimation / etc.]
- [Design type] appropriate because: [efficiency / feasibility / strength for this question]
- Alternatives considered: [why not other designs?]

Advantages:
1. [Advantage 1]: [how is it beneficial?]
2. [Advantage 2]: [how is it beneficial?]

Disadvantages/Limitations:
1. [Limitation 1]: [how could it affect results?]
2. [Limitation 2]: [how could it affect results?]

Applicability to This Article:
- [Design type] used because intervention is [nature of intervention]
- [Design type] prevents [type of bias that would occur with alternative]
- Results: [design strength/weakness addressed by authors?]
```

---

### **Template 2: Statistical Test Question Answer**

**Question:** "Justify the statistical test used for [outcome]"

**Answer Structure:**
```
Outcome Characteristics:
- Type: [binary / continuous / time-to-event]
- Distribution: [normal / skewed / binomial]
- Sample size: [large / small]
- Number of groups: [2 / 3+]

Test Selected: [Name of test]

Justification:
1. Outcome type matches test assumptions: [because...]
2. Distribution fits test requirements: [because...]
3. Sample size adequate for this test: [because...]
4. Compared to alternatives:
   - Test A would be inappropriate because: [...]
   - Test B would be less powerful because: [...]

Assumptions:
1. Assumption 1: [checked / assumption reasonable? Result]
2. Assumption 2: [checked / assumption reasonable? Result]
3. Assumption 3: [checked / assumption reasonable? Result]

Alternative Approaches if Assumptions Violated:
- If [assumption] violated: use [alternative test]

Conclusion: [Test] is appropriate for this data and analysis question
```

---

### **Template 3: Bias/Confounding Question Answer**

**Question:** "Assess the risk of [bias type] in this study"

**Answer Structure:**
```
Definition of [Bias Type]:
[Clear, concise definition relevant to this study design]

Potential Sources in This Study:
1. [Source 1]: [specific mechanism in this study]
2. [Source 2]: [specific mechanism in this study]

Risk Level: [LOW / MODERATE / HIGH]

Evidence:
For LOW risk:
- Study design controlled for this bias by: [mechanism]
- [Specific aspect of study]: [demonstrates bias minimized]

For HIGH risk:
- Potential source not addressed: [mechanism]
- Differential between groups: [evidence of risk]

Direction of Bias (if present):
- Bias would push results: [toward null / away from null / unpredictable direction]
- Magnitude: [small / moderate / substantial effect on conclusion]

Conclusion:
This bias [is / is not] likely to substantially alter conclusions because [reasoning]
```

---

### **Template 4: Sample Size Calculation Question Answer**

**Question:** "Calculate the required sample size if..."

**Answer Structure:**
```
Current Study Context:
- Reported power: [X]%
- Reported alpha: [X]
- Reported effect size: [X]
- Reported N: [Y]

New Scenario:
- Requested change: [e.g., cluster RCT instead of individual RCT]

Calculation Steps:

Step 1: Start with formula
[Write the formula clearly]

Step 2: Identify parameters
- Alpha: [value, source in article or justify if using standard 0.05]
- Beta: [value to achieve XX% power]
- Effect size: [numerical value with units, justification]
- Standard deviation (if needed): [value from article or pilot]
- Special adjustments:
  * For clustering: ICC = [value], m = [cluster size]
    Design effect = 1 + (m-1) × ICC = [calculated]
  * For correlation: [if multiple endpoints]

Step 3: Calculate
[Show arithmetic or R code]
n = [calculated value]

Step 4: Adjust for dropout
If attrition expected: [X]%
Adjusted n = [value] / (1 - attrition rate)

Final Sample Size: [n] per group / [2n] total / [adjusted n to account for dropout]

Comparison to Original:
- Original: [X per group]
- New calculation: [Y per group]
- Ratio: [Z% increase/decrease in sample size needed]
- Reason for difference: [explain why scenario changed requirements]

Note: [Any assumptions or limitations of calculation]
```

---

### **Template 5: Interpretation of Effect Size Question**

**Question:** "Interpret the effect size for [outcome]"

**Answer Structure:**
```
Effect Size Reported:
- Point estimate: [specific number]
- Type: [RR / OR / HR / difference / other]
- 95% CI: [X to Y]
- P-value: [X]

Statistical Significance:
- Threshold: p < 0.05
- Result: [significant / not significant]
- Confidence interval crosses [null value 1 or 0]? [Yes / No]

Clinical Significance:
- Minimal Clinically Important Difference (MCID): [value if available]
  [Source: article specified / estimated from effect size / derived from literature]

- Observed effect: [X units / X% / X-fold]
- Comparison to MCID: [exceeds / meets / below MCID]
- Interpretation: [clinically meaningful / modest / minimal benefit]

Absolute vs Relative:
- Relative effect: [XX% reduction / HR 0.92 = 8% lower hazard]
- Absolute effect: [XX percentage point reduction / NNT = X]
- Which matters more for clinical practice? [typically absolute for decision-making]

Magnitude Classification:
- Small effect: [definition and example]
- Medium effect: [definition and example]
- Large effect: [definition and example]
- This study's effect: [classification]

Conclusion:
The intervention results in [clinically meaningful / modest / limited] benefit 
with [high / moderate / low] precision because [confidence interval width / sample size]
```

---

### **Template 6: Confounding/Interaction Question (EPI)**

**Question:** "Explain the distinction between [confounder A] and [confounder B] in relation to the effect of [exposure] on [outcome]"

**Answer Structure:**
```
Step 1: Identify the causal pathways

Exposure → Outcome [Direct effect we want to measure]

Confounder A:
  [Confounder A] → Exposure
  [Confounder A] → Outcome
  [Is confounder on causal pathway? NO - true confounder]

Confounder B:
  Exposure → [Confounder B] → Outcome
  [Is confounder on causal pathway? YES - this is a mediator]

Step 2: Statistical implications

If we ADJUST for Confounder A:
  - Result: [unbiased estimate of direct effect + indirect through mediator]
  - Effect estimate: [likely unchanged if randomized / reduced residual confounding if observational]

If we ADJUST for Confounder B (mediator):
  - Result: [only direct effect, mediated effect hidden]
  - Effect estimate: [artificially reduced / shows only direct pathway]

Step 3: Answer to research question

Should we adjust for each?
- Confounder A: [YES - prevents confounding]
- Confounder B: [DEPENDS - YES if want direct effect only / NO if want total effect]

Evidence in Article:
- Article adjusted for: [list]
- Likely intention: [estimate total effect / direct effect]
- Validity of approach: [appropriate / problematic because...]

Conclusion:
Confounder A should be adjusted (prevents bias)
Confounder B adjustment [reveals direct effect / masks important associations]
```

---

## 🎯 EXAM QUESTION INDEX

### **QUESTIONS APPEARING 3+ TIMES (Must Master)**

1. **Sample Size Calculation** (5 years: 2020RC, 2021RC, 2022b, 2023a, 2024b)
   - Answer format: [See Template 4]
   - Exam context: Calculate NSN with various adjustments
   - Recurring specifics: Multiple endpoints, clustering, non-inferiority

2. **Study Design Appropriateness** (6 years: 2020EPI, 2021RC, 2022a, 2023a, 2023b, 2024a)
   - Answer format: [See Template 1]
   - Exam context: Justify why this design for this question
   - Recurring specifics: Cluster RCT, observational designs, ecological studies

3. **Endpoint Selection & Justification** (4 years: 2020RC, 2021RC, 2022b, 2024b)
   - Answer format: [See Template 5 variant]
   - Exam context: Primary, co-primary, composite, surrogate
   - Recurring specifics: Is the chosen endpoint appropriate? Strengths/weaknesses?

4. **Confounding/Mediation Distinction** (4 years: 2019EPI, 2020EPI, 2021EPI, 2023b)
   - Answer format: [See Template 6]
   - Exam context: Adjustment strategies, mediator vs confounder
   - Recurring specifics: Causal diagram thinking, collider bias

5. **Statistical Model Justification** (5 years: 2020EPI, 2021RC, 2023a, 2023b, 2024a)
   - Answer format: [See Template 2]
   - Exam context: Why this test? What are assumptions?
   - Recurring specifics: Time-to-event, mixed models, cluster adjustments

6. **Effect Size Interpretation** (3 years: 2019EPI, 2020RC, 2021RC)
   - Answer format: [See Template 5]
   - Exam context: Statistical vs clinical significance
   - Recurring specifics: Absolute vs relative, NNT, MCID

7. **Multiple Comparisons & Alpha** (3 years: 2020RC, 2022b, 2023a)
   - Answer format: [See section on Multiple Comparisons]
   - Exam context: Risk of Type I error with multiple testing
   - Recurring specifics: Bonferroni correction, hierarchy, p-value interpretation

8. **Bias Identification & Impact** (4 years: 2020EPI, 2022a, 2023b, 2024a)
   - Answer format: [See Template 3]
   - Exam context: Selection, information, ecological, confounding
   - Recurring specifics: Direction, magnitude, mitigation

---

### **UNIQUE QUESTIONS (1-2 TIMES ONLY)**

| Year | Question | Type | Answer Strategy |
|------|----------|------|-----------------|
| 2019RC | What is minimization randomization? | Definition + mechanism | Explain adaptive process ensuring balance |
| 2019RC | Why lack of blinding not major problem? | Objective outcomes | Argue subjectivity not involved |
| 2019RC | MAMS design rationale? | Trial design special case | Explain multi-arm multi-stage benefits |
| 2019RC | Failure-free survival as efficacy criterion? | Endpoint appropriateness | Define FFS, compare to standard endpoints |
| 2019EPI | Losses to follow-up management in cohorts? | Attrition strategy | Describe mechanisms for tracking/retention |
| 2019EPI | Multiplicative vs additive interaction? | Interaction scales | Show both types of testing with interpretation |
| 2020EPI | Qualitative study protocol design? | Protocol question | Design study to explore quantitative finding |
| 2020RC | Co-primary endpoint approach? | Multiple endpoint design | Explain advantages/disadvantages vs single endpoint |
| 2020RC | Sample size with correlation structure? | NSN calculation | Include correlation between endpoints |
| 2021RC | Qualitative component methodology? | Mixed methods | Describe sampling, analysis, integration |
| 2022a | SARIMA time series models? | Advanced statistical | Explain autoregressive + seasonal components |
| 2022a | Causality in observational research? | Causal inference limits | Discuss Bradford Hill criteria, limitations |
| 2024a | Staggered difference-in-differences? | Causal design | Explain timing of exposure rollout variation |

---

## 💡 SUMMARY: WHAT MAKES AN "ULTRA COMPLETE" EXAM ANSWER

**Key Principles:**

1. **Specificity Over Vagueness**
   - NOT: "The study used randomization"
   - YES: "Stratified block randomization with block size 4, stratification by age (<65 vs ≥65) and ECOG status (0 vs 1-2), allocation ratio 1:1, central telephone randomization for concealment"

2. **Cross-Reference the Article**
   - NOT: "The effect size was good"
   - YES: "HR 0.92 (95% CI: 0.70-1.21), which fails to exclude the null and falls below the clinically important difference of [MCID], suggesting minimal clinical benefit"

3. **Justify Every Answer**
   - NOT: "Selection bias risk: LOW"
   - YES: "Selection bias risk: LOW because randomization was conducted centrally via telephone, preventing allocation prediction by enrolling investigators, and ITT analysis preserves randomization integrity despite 8.1% loss to follow-up"

4. **Know Your Numbers**
   - Memorize or quickly extract:
     * Sample size (N randomized vs N analyzed)
     * Primary outcome effect (HR/RR/OR/difference with 95% CI and p-value)
     * Primary outcome rate in each group
     * Any significant subgroup interactions
     * Follow-up duration
     * Attrition rate

5. **Map Answers to Article Sections**
   - Practice saying: "In Methods page X, the authors state..."
   - Practice saying: "Table Y shows..."
   - This ensures your answer shows you read and understood the source material

---

**END OF ULTRA COMPLETE GUIDE**


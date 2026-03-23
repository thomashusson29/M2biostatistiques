# ARTICLE SECTION LOCATION GUIDE: WHERE TO FIND TESTED INFORMATION

## STRUCTURE OF RESEARCH ARTICLES & WHAT EACH SECTION CONTAINS

### 1. ABSTRACT (Tested for: General study design, primary findings, key numbers)
**STAMPEDE RCT:**
- Lines 15-59
- Contains: Study type (phase 3 RCT), primary outcome (OS), key result (HR 0.92, p=0.266), secondary (FFS HR 0.76), subgroup hint
- **Tested questions:** "What was the main finding?" "Did radiotherapy improve OS?" "What secondary outcomes showed benefit?"

**Nurses' Health EPI:**
- Lines 15-81
- Contains: Study type (prospective cohort), sample size (143,410), exposures (shift work + 4 lifestyle factors), primary result (joint HR 2.83), interaction p<0.001, attributable proportions (71%, 11%)
- **Tested questions:** "What exposures were studied?" "What was the interaction result?" "What proportions were attributable?"

### 2. INTRODUCTION (Tested for: Why study was done, prior evidence, hypotheses)
**STAMPEDE RCT:**
- Lines 69-118
- Contains: Clinical context (metastatic cancer typically gets systemic therapy only), biological rationale (primary tumor "primes niche"), prior trial evidence (HORRAD: no OS benefit overall but hypothesis for low burden)
- **Tested questions:** "What biological mechanism was hypothesized?" "What did HORRAD trial show?" "Why test this in STAMPEDE?"

**Nurses' Health EPI:**
- Lines 48-117
- Contains: Prevalence of shift work (1/5 workers), health effects (disrupts rhythms), prior evidence on shift work associations, prior evidence on lifestyle associations, knowledge gap (no joint association studies), study objective (test joint associations & interactions)
- **Tested questions:** "What knowledge gap did this study address?" "What was already known about shift work + diabetes?" "Why examine both together?"

### 3. METHODS (Most heavily tested section - Tests for: Design, population, measurements, analysis plan)

**STAMPEDE RCT Methods:**

A. **Study Design & Population (Lines 21-30, 118-162)**
- Type: Phase 3 randomized controlled trial
- Setting: 117 hospitals, Switzerland & UK
- Inclusion: Newly diagnosed metastatic prostate cancer, metastatic disease confirmed
- Exclusion: Contra-indications to RT, significant CVD
- Tested questions: "What were inclusion/exclusion criteria?" "How many sites?" "Who could participate?"

B. **Randomization (Lines 25-29, 150-158)**
- Method: Centralized computerized
- Ratio: 1:1 (open-label)
- **Stratification factors:** Hospital, age, nodal involvement, WHO PS, planned ADT, planned docetaxel, aspirin/NSAID
- Table 1 confirms: Groups balanced on all baseline characteristics
- Tested questions: "How was randomization done?" "What stratification factors?" "Why these factors?" "Were groups balanced?"

C. **Interventions (Lines 31-32, 200-204)**
- Control: ADT (lifelong) + docetaxel permitted from Dec 2015
- Radiotherapy: Daily 55Gy/20fr/4wks OR weekly 36Gy/6fr/6wks (nominated pre-randomization)
- Planning: Prostate-only, 8mm posterior margin, 10mm elsewhere
- Tested questions: "What was the radiotherapy dose?" "Why two schedules?" "What was control treatment?"

D. **Outcomes - Primary & Secondary (Lines 33-40, 345-350)**
- **Primary:** Overall survival (time from randomization to death, any cause)
- **Primary activity outcome:** Failure-free survival (for interim analyses; ≥50% PSA drop + ≥4 ng/mL)
- **Secondary:** PFS, metastatic PFS, PC-specific survival, symptomatic local event-free survival
- **Adverse events:** RTOG grade 3-4 during/after; CTCAE grade 3+ overall
- Tested questions: "What was the primary outcome?" "Why measure failure-free survival?" "What were secondary outcomes?"

E. **Statistical Analysis (Lines 402-493)**
- **Sample size:** ~300 events per schedule for 90% power, HR 0.75, one-sided α=2.5%
- **Analysis methods:**
  - Stratified log-rank test (primary test, stratified by factors except hospital & planned ADT)
  - Cox proportional hazards regression (adjusted for stratification factors)
  - Flexible parametric models (5,5 degrees of freedom)
  - Proportional hazards assumption tested; RMST if violated
  - Competing risks analysis (Fine & Gray method) for cancer-specific survival
- **Subgroup analyses:** Prespecified by metastatic burden (low vs high) and radiotherapy schedule (daily vs weekly)
- **Intention-to-treat:** All analyzed in allocated arm regardless of adherence
- Tested questions: "What was the sample size?" "What statistical test?" "How were subgroups analyzed?" "Why ITT?"

---

**Nurses' Health EPI Methods:**

A. **Study Population (Lines 121-149)**
- **Two cohorts:**
  - NHS: Started 1976, 121,701 nurses initially; baseline 1988; n=55,324 after exclusions
  - NHS II: Started 1989, 116,677 nurses initially; baseline 1991; n=88,086 after exclusions
- **Total:** 143,410 women
- **Exclusion:** Prior diabetes, CHD, stroke, cancer, missing key data
- **Rationale for 2 cohorts:** Different baseline ages; examine age effects; long follow-up already in place
- Tested questions: "Why two cohorts?" "How many participants?" "What exclusions?" "Why exclude these conditions?"

B. **Exposure 1 - Rotating Night Shift Work (Lines 101-116)**
- **Definition:** ≥3 night shifts/month IN ADDITION TO day/evening shifts same month
- **Duration categories:** Never, 1-5, 5-9, ≥10 years
- **Measurement:**
  - NHS: Lifetime history assessed at 1988 baseline (cross-sectional)
  - NHS II: Cumulative through 2009; asked about periods 1993-95, 1995-97, 1997-99, 1999-2001, 2001-03, 2003-05
  - Midpoint values calculated and summed
- **Limitations:** Self-reported; lacks night-working hours, work stress
- Tested questions: "How was shift work defined?" "What does ≥3 shifts/month mean?" "How was duration measured?"

C. **Exposure 2 - Unhealthy Lifestyle (4 factors, Lines 119-166)**
- **Factor 1 - Smoking:** Biennial questionnaire; current smoker = unhealthy
- **Factor 2 - Physical Activity:** Validated questionnaire (updated biennially); <30 min/day moderate-vigorous intensity = unhealthy
  - Measured in MET-hours; includes brisk walking
- **Factor 3 - Diet Quality:** FFQ every 4 years; Alternate Healthy Eating Index (AHEI)
  - 10 components: high (vegetables, fruit, nuts, whole grains, PUFA, LC omega-3); low (red/processed meat, sugar drinks, trans fat, sodium)
  - Scored 0-10; bottom 3/5 = unhealthy
- **Factor 4 - BMI:** Self-reported weight/height; ≥25 kg/m² = unhealthy
- **Scoring:** Binary for each (0/1 if present); summed 0-4 scale
- **Updates:** Time-varying; reassessed at each biennial questionnaire
- Tested questions: "How were lifestyle factors defined?" "Why 4 factors?" "How was each measured?" "What makes a factor 'unhealthy'?"

D. **Outcome - T2DM Ascertainment (Lines 200-225)**
- **Reporting:** Self-reported on biennial questionnaire
- **Validation Step 1:** Supplementary questionnaire sent to those reporting diabetes
- **Validation Step 2:** Investigator review of supplementary questionnaire using diagnostic criteria
- **Validation Step 3:** Subsample (n=62 from NHS) had medical records reviewed by blinded endocrinologist → 98% concordance
- **Diagnostic Criteria Applied:**
  - **Pre-1998 (NDDG):** Required at least ONE of:
    - Classic symptoms (thirst, polyuria, weight loss, hunger) + fasting glucose ≥7.8 mmol/L OR random ≥11.1
    - ≥2 elevated glucose values (fasting ≥7.8, random ≥11.1, 2-hr OGTT ≥11.1) without symptoms
    - Treatment with hypoglycemic drugs
  - **Post-1998 (ADA):** Fasting plasma glucose ≥7.0 mmol/L (threshold lowered)
- Tested questions: "How was diabetes diagnosed?" "What validation was done?" "Why 98% concordance important?" "Why change diagnostic criteria?"

E. **Statistical Analysis (Lines 227-277)**
- **Approach:** 
  - Multivariable time-dependent Cox proportional hazards models
  - **Why time-varying:** Covariates updated at each assessment (biennial)
  - **Separate analysis per cohort** then pooled (accounts for differences)
  
- **Covariates adjusted for:**
  - Age (continuous, time-varying)
  - Calendar year (time-varying)
  - Ethnicity (baseline only)
  - Marital status (time-varying: married/divorced/widowed)
  - Living alone (time-varying)
  - Family history of diabetes (baseline)
  - Menopausal status (time-varying)
  - Oral contraceptive use (NHS II only)
  - Alcohol (categorical, time-varying)
  - Total energy intake (time-varying, fifths)
  
- **Interaction Testing (CRITICAL):**
  1. **Multiplicative interaction:**
     - Method: Cross-product term in Cox model; compared -2 log likelihood with/without
     - Result: p > 0.67 (NOT significant in this study)
     - Interpretation: Effects don't multiply on HR scale
  
  2. **Additive interaction:**
     - Method: Relative Excess Risk due to Interaction (RERI)
     - Formula: RERI = HR₁₁ - HR₁₀ - HR₀₁ + 1 where HR₁₁ = joint, HR₁₀ = lifestyle only, HR₀₁ = shift only
     - Result: p < 0.001 (SIGNIFICANT in this study)
     - Interpretation: Effects add on risk difference scale; joint risk exceeds independent sum
  
- **Effect Decomposition:**
  - Partitioned joint effect (HR₁₁ - 1) into:
    - Shift work alone: (HR₁₀ - 1)/(HR₁₁ - 1) × 100
    - Lifestyle alone: (HR₀₁ - 1)/(HR₁₁ - 1) × 100
    - Interaction: RERI/(HR₁₁ - 1) × 100
  - Results: 17.1%, 71.2%, 11.3% (sum to 100%)

- **Pooling Method:** Inverse-variance weighted random effects meta-analysis
  - Allows heterogeneity between cohorts
  - More conservative than fixed effects
  - Examined heterogeneity with Cochrane Q and I² statistics

- **Sensitivity Analyses (5 specifications):**
  1. Adjusted for prevalent hypertension, hyperlipidemia, treatments
  2. Restricted to symptomatic T2DM cases only
  3. Used baseline lifestyle score (not updated)
  4. Used weighted lifestyle score (weighted by regression coefficients)
  5. Removed BMI from lifestyle score

- Tested questions: "Why analyze separately then pool?" "What is additive interaction?" "What do attributable proportions mean?" "Why multiple sensitivity analyses?"

### 4. RESULTS (Most heavily tested for: Specific numbers, outcomes, subgroups, p-values)

**STAMPEDE RCT Results:**

A. **Recruitment & Flow (Lines 502-556, Figure 1)**
- Randomized: 2061 (Jan 22, 2013 - Sept 2, 2016)
  - Control: 1029
  - Radiotherapy: 1032
- Baseline characteristics: Median age 68, PSA 97 ng/mL, 71% WHO 0, 64% nodal positive
- Metastatic burden classified: 819 low (40%), 1120 high (54%), 122 unknown (6%)
- Schedule nominated: 1082 (52%) daily, 979 (48%) weekly
- Adherence: 968 (94%) radiotherapy group started treatment within 1 year
- Follow-up: Median 37 months (IQR 24-48)
- Tested questions: "How many were randomized?" "Were baseline characteristics balanced?" "What was adherence?"

B. **PRIMARY OUTCOME - Overall Survival (Lines 558-576)**
- **Control:** 391 deaths; median survival 46 months (IQR 27-NR); 3-year survival 62%
- **Radiotherapy:** 370 deaths; median survival 48 months (IQR 27-NR); 3-year survival 65%
- **Log-rank test:** p=0.451 (stratified by factors)
- **Adjusted HR (Cox):** 0.92 (95% CI 0.80-1.06); p=0.266
- **Interpretation:** NO overall survival benefit from radiotherapy
- Tested question: "What was the main trial result?"

C. **CRITICAL SUBGROUP ANALYSIS - Metastatic Burden (Lines 570-580, Figure 4A, Table 2)**

| Burden | N | Deaths/control | Deaths/RT | Control 3yr% | RT 3yr% | HR (95% CI) | p-value |
|---|---|---|---|---|---|---|---|
| **Low** | 819 | 116 | 90 | 73% | 81% | 0.68 (0.52-0.90) | **0.007** |
| **High** | 1120 | 252 | 257 | 54% | 53% | 1.07 (0.90-1.28) | 0.420 |
| **Interaction p=0.0098** - SIGNIFICANT heterogeneity of treatment effect by burden

- **Interpretation:** Treatment effect DIFFERS significantly by metastatic burden
  - Low burden: BENEFIT present (8% absolute improvement at 3 years)
  - High burden: NO benefit (similar 53-54%)
- Tested questions: "Did radiotherapy help any subgroup?" "What was the interaction p-value?" "Why are low and high burden different?"

D. **SECONDARY OUTCOME - Failure-Free Survival (Lines 582-650, Figure 2B, Table 2)**
- **Overall (all patients):**
  - Control: 758 events; median 13 months; 3-year FFS 23%
  - Radiotherapy: 685 events; median 17 months; 3-year FFS 32%
  - HR 0.76 (95% CI 0.68-0.84), p<0.0001 ← **SIGNIFICANT**
  - **Restricted mean survival time** (59 months): 21.4 vs 26.2 months (difference 4.8 months)
  
- **By metastatic burden:**
  - Low: HR 0.59 (0.49-0.72), p<0.0001 (interaction p=0.002)
  - High: HR 0.88 (0.77-1.01), p=0.059
  
- **By radiotherapy schedule:**
  - Daily (1082 patients): HR 0.69 (0.59-0.80), p<0.0001 ← **Stronger**
  - Weekly (979 patients): HR 0.85 (0.73-0.99), p=0.033

- **Interpretation:** Radiotherapy improved biochemical control overall; benefit stronger with daily schedule and in low burden
- Tested questions: "Did radiotherapy improve any secondary outcome?" "Which schedule was better?" "How much benefit?"

E. **Adverse Events (Lines 51-55, 679-700, Table 3)**
- **During radiotherapy:** 48 (5%) RTOG grade 3-4 events
- **After radiotherapy:** 37 (4%) RTOG grade 3-4 events
- **Overall severe (CTCAE grade 3+):** 
  - Control: 398/1029 (38%)
  - Radiotherapy: 380/1032 (39%)
  - Similar by treatment group
- **Specific events (Table 3):** UTI, catheterization, kidney injury, stent placement - no major differences
- Tested questions: "Was radiotherapy safe?" "What were common adverse events?" "Difference between arms?"

---

**Nurses' Health EPI Results:**

A. **Study Flow & Follow-up (Lines 260-277)**
- NHS: 22-24 years follow-up; 5,474 T2DM cases (1,139,597 person-years)
- NHS II: 22-24 years follow-up; 5,441 T2DM cases (1,778,721 person-years)
- **Total:** 10,915 incident T2DM cases

B. **Baseline Characteristics by Shift Work Duration (Table 1, Lines 280-312)**
- **Pattern observed:** With increasing shift work duration:
  - Age ↑ (NHS only), BMI ↑, smoking ↑
  - Physical activity: No appreciable difference
  - Diet quality: No appreciable difference
- Tested question: "Did shift workers differ at baseline?" "What characteristics differed?"

C. **PRIMARY OUTCOME - Shift Work Main Effect (Table 2, per 5-year increment)**

| Cohort | Age-adjusted | Multiv-adjusted | +Lifestyle adj | +BMI adj |
|---|---|---|---|---|
| **NHS** | 1.53 (1.41-1.66) | 1.39 (1.28-1.51) | 1.39 (1.28-1.51) | 1.16 (1.06-1.26) |
| **NHS II** | 1.81 (1.65-1.98) | 1.56 (1.43-1.71) | 1.54 (1.41-1.69) | 1.17 (1.07-1.28) |
| **Pooled** | 1.66 (1.41-1.96) | 1.47 (1.32-1.65) | 1.46 (1.33-1.62) | 1.16 (1.09-1.24) |

- **Trend p<0.001:** Linear trend for increasing shift work duration
- **Key:** Adjustment for lifestyle did NOT attenuate association (1.39 → 1.39)
- Tested questions: "What was HR for shift work?" "Did adjusting for lifestyle change it?" "What were the trends?"

D. **PRIMARY OUTCOME - Unhealthy Lifestyle Main Effect (Table 2, per factor)**

| Cohort | Multiv-adjusted |
|---|---|
| **NHS** | 2.08 (1.98-2.18) |
| **NHS II** | 2.56 (2.43-2.70) |
| **Pooled** | 2.30 (1.88-2.83) |

- **Stronger than shift work:** Lifestyle effect ~1.5x larger than shift work
- Tested question: "What was HR for each unhealthy lifestyle factor?"

E. **CRITICAL - JOINT EFFECT & INTERACTION (Table 3, Lines 413-437)**

**Main findings:**

| Measure | NHS | NHS II | Pooled |
|---|---|---|---|
| **Joint HR (both exposures)** | 2.46 (2.37-2.55) | 3.26 (3.15-3.37) | 2.83 (2.15-3.73) |
| **Multiplicative interaction p** | (not sig) | (not sig) | **>0.67** ← NOT SIG |
| **RERI (additive interaction)** | 0.13 (0.09-0.17) | 0.32 (0.21-0.42) | 0.20 (0.09-0.48) |
| **Additive interaction p** | **<0.001** | **<0.001** | **<0.001** ← SIG |

**Effect Decomposition - Attributable Proportions:**

| Component | % of joint effect | 95% CI |
|---|---|---|
| **Shift work alone** | 17.1% | 14.0-20.8% |
| **Unhealthy lifestyle alone** | **71.2%** | 66.9-75.8% |
| **Additive interaction** | 11.3% | 7.3-17.3% |
| **Total** | **100%** | |

- **Interpretation:** 
  - Multiplicative interaction NOT present (effects don't multiply)
  - Additive interaction PRESENT (effects add on risk difference scale)
  - Lifestyle accounts for 71% of joint risk; interaction 11%
  
- Tested questions: "What is the interaction result?" "Are effects multiplicative or additive?" "What do the percentages mean?"

F. **Highest Risk Group (Lines 413-421)**
- **≥10 years shift work + ≥3 unhealthy lifestyle factors:**
  - HR 7.04 (5.29-9.37) vs reference (no shift work + ≤1 lifestyle factors)
  - ~7-fold elevated risk
- Tested question: "What was the highest risk group?"

G. **Cohort Differences (Discussion lines 489-550)**
- **NHS (older women):** RERI 0.13 (smaller interaction)
- **NHS II (younger women):** RERI 0.32 (larger interaction)
- **P for heterogeneity <0.001**
- **Explanation:** Age modifies interaction; younger show stronger effects
- Tested question: "Did age affect the results?" "Which cohort showed stronger effects?"

H. **Sensitivity Analyses (Lines 438-456)**
- All analyses remained significant after:
  1. Adjusting for hypertension/hyperlipidemia
  2. Restricting to symptomatic T2DM only
  3. Using baseline lifestyle score
  4. Using weighted lifestyle scores
  5. Removing BMI from lifestyle
- Tested question: "Were results robust?" "What did sensitivity analyses show?"

### 5. DISCUSSION (Tested for: Interpretation, comparison to prior work, limitations, mechanisms)

**STAMPEDE RCT Discussion areas (typical structure):**
- Main findings interpretation: Radiotherapy no OS benefit for unselected; subgroup benefit in low burden
- Comparison to HORRAD & other trials
- Biological mechanisms for differential effect
- Clinical implications
- Study strengths & limitations

**Nurses' Health EPI Discussion areas (typical structure):**
- Main findings interpretation: Joint associations, additive interaction, public health implications
- Comparison with prior studies: First to examine joint associations
- Potential mechanisms: Sleep/circadian rhythm disruption, hormonal effects, gut microbiota
- Strengths: Prospective design, large sample, long follow-up, validated questionnaires
- Limitations: Self-reported exposures, female nurses only, observational (not causal), Cox assumptions

### 6. TABLES & FIGURES (Tested for: Specific numbers, comparisons, visual interpretation)

**Most critical tables/figures for EXAMS:**

**RCT (STAMPEDE):**
- **Table 1:** Baseline characteristics (confirms balance)
- **Table 2:** Primary & secondary outcomes (HR, CI, 3-year survival) - **MOST COMPREHENSIVE**
- **Figure 1:** Trial profile (flow diagram)
- **Figure 2:** OS and FFS Kaplan-Meier curves
- **Figure 3:** Forest plot subgroup analyses
- **Figure 4:** OS and FFS by metastatic burden

**Cohort (Nurses' Health):**
- **Table 1:** Baseline characteristics by shift work duration
- **Table 2:** Main effects HRs (shift work, lifestyle by cohort)
- **Table 3:** Joint effects, RERI, interaction, attributable proportions
- Supplementary figures: Sensitivity analyses

---

## QUICK REFERENCE: WHAT QUESTION TYPE → WHICH SECTION

| Question Type | Primary Section | Secondary Section | Key Table/Figure |
|---|---|---|---|
| Study design | Methods (Design) | Abstract | Figure 1 (flow) |
| Randomization/stratification | Methods (Randomization) | Abstract | Table 1 (balance) |
| Exposure definition | Methods (Exposure/Intervention) | Abstract | Table 1 (baseline by exposure) |
| Outcome definition/validation | Methods (Outcomes) | Results (flow) | - |
| Sample size/power | Methods (Statistical) | - | - |
| Statistical methods | Methods (Statistical) | Results | - |
| Main findings | Results (Primary outcome) | Abstract | Table 2 (if available) |
| Subgroup findings | Results (Subgroup analysis) | Table/Figure | Figure 3-4 (RCT) |
| Interaction analysis | Results (Interaction section) | Methods (Statistical) | Table 3 (EPI) |
| Secondary outcomes | Results (Secondary outcome) | Table 2 | Figure 2 |
| Adverse events | Results (Adverse events section) | Table 3 | - |
| Baseline characteristics | Table 1 | Results (Flow) | - |
| Cohort differences (EPI) | Discussion/Results | Methods (Population) | Table 1 |
| Sensitivity analyses | Results (Sensitivity) or Supplementary | Methods (Statistical) | Supplementary figures |
| Mechanisms | Discussion (Mechanisms section) | Introduction | - |
| Limitations | Discussion (Limitations section) | - | - |


# QUICK REFERENCE: WHERE TESTED INFORMATION APPEARS

## ARTICLE 1: STAMPEDE RCT (Metastatic Prostate Cancer)

### Baseline Information
- **Abstract (Lines 15-59):** Study design, randomization method, primary outcome definition, key results
- **Methods Randomization (Lines 25-29):** Stratification factors listed; open-label 1:1 allocation
- **Table 1 (Baseline characteristics):** Confirms balanced groups; baseline demographics, disease stage

### Methodology Information
- **Randomization:** Summary + Methods lines 150-158 + Table 1
- **Sample size & power:** Methods lines 402-432 (90% power for HR 0.75; ~300 events needed)
- **Interventions:** Methods lines 31-32, 200-204; daily vs weekly schedules, nominated pre-randomization
- **Outcomes:** Summary lines 33-40; Methods lines 345-350 (OS primary, FFS primary activity)
- **Statistical methods:** Methods lines 422-493; Cox proportional hazards, stratified log-rank, flexible parametric models

### Primary Results
- **Overall survival (MAIN FINDING):** Results lines 558-576
  - HR 0.92 (0.80-1.06), p=0.266 ← **NO benefit**
  - Control: 391 deaths, 46 mo median, 62% 3-yr survival
  - Radiotherapy: 370 deaths, 48 mo median, 65% 3-yr survival

- **Failure-free survival:** Results lines 582-650
  - HR 0.76 (0.68-0.84), p<0.0001 ← **SIGNIFICANT benefit**
  - Control: 13 mo median, 23% 3-yr
  - Radiotherapy: 17 mo median, 32% 3-yr
  - By schedule: Daily HR 0.69 (stronger) vs weekly HR 0.85

- **Subgroup analysis by metastatic burden (CRITICAL):** Results lines 570-580, Table 2, Figure 4A
  - **Low burden:** HR 0.68 (0.52-0.90), p=0.007 ← **BENEFIT PRESENT**
    - 73% vs 81% 3-year OS
  - **High burden:** HR 1.07 (0.90-1.28), p=0.420 ← **NO benefit**
    - 54% vs 53% 3-year OS
  - **Interaction p=0.0098:** Treatment effect DIFFERS significantly by metastatic burden

### Adverse Events
- Results lines 51-55: 5% grade 3-4 during RT, 4% after; overall 38-39% any grade 3+ event (similar arms)

---

## ARTICLE 2: NURSES' HEALTH STUDY (Shift Work & T2DM)

### Study Population & Design
- **Two cohorts:** Methods lines 122-145
  - NHS: 1976 start, 55,324 women, baseline 1988
  - NHS II: 1989 start, 88,086 women, baseline 1991
  - Total n=143,410
- **Why 2 cohorts:** Different ages, examine age effects, long follow-up already available
- **Analyzed separately then pooled** with inverse-variance meta-analysis

### Exposure Definitions
- **Rotating night shift work (Methods lines 101-116):**
  - Definition: ≥3 night shifts/month PLUS day/evening shifts same month
  - Duration: Never, 1-5, 5-9, ≥10 years (categorical); per 5-year increment (continuous)
  - Measurement: NHS baseline only; NHS II cumulative through 2009

- **Unhealthy lifestyle (4 factors, Methods lines 119-166):**
  1. **Smoking:** Current smoker
  2. **Physical activity:** <30 min/day moderate-vigorous intensity
  3. **Diet quality:** Bottom 3/5 of Alternate Healthy Eating Index (AHEI)
  4. **BMI:** ≥25 kg/m²
  - Scoring: Binary each (0/1); sum to 0-4 scale
  - Measured: Every 2-4 years (time-varying)

### Outcome Definition
- **T2DM ascertainment (Methods lines 200-225):**
  - Self-reported on questionnaire
  - Validated via supplementary questionnaire + investigator review
  - Diagnostic criteria: Pre-1998 NDDG, post-1998 ADA (fasting ≥7.0 mmol/L)
  - Validation check: 98% concordance with blinded medical record review

### Main Results

**1. Main effects (Table 2):**

| Exposure | Shift work (per 5yr) | Unhealthy lifestyle (per factor) |
|---|---|---|
| NHS HR (multiv adj) | 1.39 (1.28-1.51) | 2.08 (1.98-2.18) |
| NHS II HR | 1.56 (1.43-1.71) | 2.56 (2.43-2.70) |
| **Pooled HR** | **1.47 (1.32-1.65)** | **2.30 (1.88-2.83)** |

**Key finding:** Lifestyle effect > shift work effect; but both independent

**2. JOINT EFFECT & INTERACTION (Table 3, Results lines 413-437):**

- **Joint HR** (when both exposures present):
  - Pooled: 2.83 (2.15-3.73)
  - *If independent: would be ~1.31 × 2.30 = 3.01*
  - *Observed: 2.83 < 3.01 → less than multiplicative*

- **Multiplicative interaction:** p > 0.67 ← **NOT significant**

- **ADDITIVE INTERACTION (RERI):** p < 0.001 ← **SIGNIFICANT**
  - NHS: RERI 0.13 (0.09-0.17)
  - NHS II: RERI 0.32 (0.21-0.42)
  - Pooled: RERI 0.20 (0.09-0.48)
  - **Interpretation:** Significant additive interaction on risk difference scale

**3. ATTRIBUTABLE PROPORTIONS (partition of joint effect):**
| Component | % of joint effect | 95% CI |
|---|---|---|
| Shift work alone | 17.1% | 14.0-20.8% |
| Unhealthy lifestyle alone | **71.2%** | 66.9-75.8% |
| Additive interaction | 11.3% | 7.3-17.3% |

**Public health interpretation:** 
- 71% of T2DM in exposed women preventable by lifestyle modification
- 11% additional synergistic reduction possible if shift workers adopt healthy lifestyle
- Focus intervention on lifestyle; benefits maximized in shift workers

**4. Highest risk group (Lines 413-421):**
- ≥10 years shift work + ≥3 unhealthy lifestyle factors
- HR 7.04 (5.29-9.37) vs reference
- ~7-fold elevated risk

**5. Cohort differences (Discussion lines 489-550):**
- Interaction STRONGER in NHS II (younger): RERI 0.32
- Interaction weaker in NHS (older): RERI 0.13
- **Explanation:** Younger women show stronger effects; age is effect modifier

### Sensitivity Analyses
- All remained significant when adjusted for hypertension/hyperlipidemia
- Similar results for symptomatic T2DM only
- Weighted vs equal-weight lifestyle score: similar results
- BMI removed: effects observed in both BMI strata

---

# MOST TESTED COMPARISON: RC vs EPI Study Design

| Feature | RC (STAMPEDE) | EPI (Nurses' Health) |
|---|---|---|
| **Primary question** | Does intervention (radiotherapy) work? | Do exposures associate with outcome? |
| **Design strength** | Randomization eliminates confounding | Long follow-up, large n, but observational |
| **Primary outcome** | Hard endpoint (death) | Disease diagnosis (self-reported, validated) |
| **Comparison groups** | Allocated treatment (1:1) | Exposure categories (observational) |
| **Key confounders** | Minimized by randomization | Adjusted multivariable models |
| **Subgroup testing** | Prespecified by burden & schedule | Exploratory interactions tested |
| **Statistical model** | Cox proportional hazards (stratified) | Cox proportional hazards (time-varying covariates) |
| **Interaction testing** | Not tested in main (prespecified subgroup analysis) | Multiplicative AND additive interaction tested |
| **Main statistical issue** | Non-proportional hazards in FFS | Multiple exposures, interaction complexity |

---

# CRITICAL EXAM ANSWERS

**Q: What is the STAMPEDE trial's main finding?**
A: Radiotherapy does NOT improve overall survival (HR 0.92, p=0.266) in unselected metastatic prostate cancer patients. However, a subgroup of low metastatic burden patients DID benefit (HR 0.68, p=0.007), with significant treatment-burden interaction (p=0.0098).
*Location: Results lines 558-576 + subgroup analysis lines 570-580*

**Q: What is the Nurses' Health main finding?**
A: Both rotating night shift work and unhealthy lifestyle independently increase T2DM risk. When BOTH present, there is a SIGNIFICANT ADDITIVE INTERACTION (p<0.001; RERI 0.20). Of the joint effect, 71% is attributable to lifestyle alone, 11% to their synergistic interaction.
*Location: Results lines 413-437 + Table 3*

**Q: How did the RCT differ from the cohort study in measuring effects?**
A: RCT used STRATIFIED randomization (7 factors) to eliminate confounding; measured hard endpoints (death). Cohort used multivariable TIME-VARYING covariates to adjust for confounding; self-reported outcomes (validated). RCT stronger for causation; cohort stronger for long-term patterns.
*Location: RC Methods lines 150-158, 237; EPI Methods lines 250-258*

**Q: Explain the difference between multiplicative and additive interaction in the cohort.**
A: Multiplicative interaction tests if effects multiply on HR scale (tested p>0.67, NOT significant here). Additive interaction tests if effects add on risk difference scale (RERI p<0.001, SIGNIFICANT). This means: shift work + lifestyle effects don't have multiplicative synergy but DO have additive synergy—joint risk exceeds independent sum on absolute scale.
*Location: Results lines 413-437 + Methods lines 210-214*

**Q: Why did RCT show improved FFS but not OS?**
A: Failure-free survival is an early event (biochemical failure, months); OS is delayed (years). Study follow-up of 37 months may be insufficient for OS differences. Radiotherapy delays progression but may not prevent ultimate death. Non-proportional hazards noted: FFS curves diverge then may reconverge. Salvage therapies in control arm could catch up.
*Location: Results lines 582-650; comparison of FFS vs OS timelines*

**Q: What do the attributable proportions 71% vs 11% mean clinically?**
A: Among women with both shift work and unhealthy lifestyle: 71% of their excess T2DM risk comes from the lifestyle factors alone; only 11% from the synergistic interaction. Clinically: modifying lifestyle prevents most cases; the extra benefit in shift workers (vs non-shift workers) is about 11 percentage points due to the interaction. Public health priority = lifestyle intervention.
*Location: Table 3 + Results lines 431-435*


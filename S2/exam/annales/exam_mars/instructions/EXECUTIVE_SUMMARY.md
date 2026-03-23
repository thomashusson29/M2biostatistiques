# 📊 EXECUTIVE SUMMARY: 6-Year Exam Pattern Analysis

**Analysis of 12 Research Articles & 6 Correction Files (2019-2024)**
**Created for M2 Biostatistiques - EPI & RC Exams**

---

## 🎯 KEY FINDINGS

### **Exam Content Breakdown**

| Exam Component | Pattern | Frequency |
|---|---|---|
| **Recurring Core Questions** | Questions that appear 3+ times across 6 years | 10 question types |
| **Unique Questions** | Questions appearing 1-2 times only | 14 question types |
| **EPI-Specific** | Confounding, bias, interaction, observational design | ~40% of content |
| **RC-Specific** | Sample size, endpoints, randomization, blinding | ~40% of content |
| **Shared Concepts** | Design appropriateness, statistical methods, results interpretation | ~20% of content |

---

## 🔥 THE "BIG 5" MOST CRITICAL QUESTION TYPES

Master these to score well (appear 4-6 times):

### **1. Sample Size Calculation (5 appearances)**
- Years tested: 2020RC, 2021RC, 2022b, 2023a, 2024b
- What exams test: Calculate N with realistic adjustments
- Why difficult: Requires understanding multiple parameters (alpha, beta, effect size, special adjustments like ICC for clusters)
- **Your action:** Practice calculating NSN with: multiple endpoints, clustering, and non-inferiority margins

### **2. Study Design Appropriateness (6 appearances)**
- Years tested: 2020EPI, 2021RC, 2022a, 2023a, 2023b, 2024a
- What exams test: Why this design? Advantages/disadvantages?
- Why difficult: Requires knowing design classification AND ability to argue why alternatives are inferior
- **Your action:** For EACH common design (RCT, cohort, case-control, ecological, time-series), prepare 2-minute explanation + pros/cons

### **3. Endpoint Selection & Justification (4 appearances)**
- Years tested: 2020RC, 2021RC, 2022b, 2024b
- What exams test: Is the primary outcome appropriate? Surrogate or clinical?
- Why difficult: Requires judgment about clinical relevance + understanding of surrogate marker validation
- **Your action:** Understand surrogate marker criteria; prepare examples of good vs bad primary endpoints

### **4. Confounding vs Mediation (4 appearances)**
- Years tested: 2019EPI, 2020EPI, 2021EPI, 2023b
- What exams test: Should we adjust for X variable? Why/why not?
- Why difficult: Requires causal thinking + understanding that adjustment direction depends on variable's role
- **Your action:** Draw causal diagrams for the research questions; identify true confounders vs mediators

### **5. Statistical Model Justification (5 appearances)**
- Years tested: 2020EPI, 2021RC, 2023a, 2023b, 2024a
- What exams test: Why use Cox vs logistic vs mixed models? What assumptions?
- Why difficult: Requires matching outcome type to test + knowing when assumptions are violated
- **Your action:** For each test type, create a decision tree: "Use Cox if... Use mixed model if... Use GEE if..."

---

## 📋 WHAT INFORMATION EXAMS EXPECT FROM ARTICLES

**Students who score high extract BEFORE reading questions:**

### **Always Extract (Minimum Checklist)**

```
✓ PICO Framework
  - Population: Inclusion/exclusion, N enrolled vs analyzed, baseline characteristics
  - Intervention: Exact drug/procedure name, dose, frequency, duration
  - Comparator: Type and exact specification (not just "standard care")
  - Outcomes: Primary outcome definition + timing + measurement method + units

✓ Design Details
  - Design type + specific features (randomization method, blinding, stratification)
  - Sample size calculation (parameters + effect size justification)
  - Randomization method + allocation concealment
  - Blinding (who/what and verification)

✓ Statistical Methods
  - Tests used for each outcome
  - Covariates adjusted (and why each selected)
  - Multiplicity correction (if multiple tests)
  - Primary analysis population (ITT vs per-protocol)

✓ Results (The Numbers)
  - Primary outcome: point estimate, 95% CI, p-value for BOTH groups
  - Secondary outcomes: complete for all
  - Subgroup interactions: if tested, p-value for interaction
  - Adverse events: rates by arm, Grade ≥3, serious AEs

✓ Critical Appraisal
  - Selection bias risk (allocation, attrition, baseline balance)
  - Information bias risk (blinding, measurement validity)
  - Confounding (measured, unmeasured, residual)
  - External validity (who can this apply to?)
```

---

## 🎓 EPI vs RC SPECIFIC REQUIREMENTS

### **EPIDEMIOLOGY-SPECIFIC (40% of EPI exams)**

**Always Expected:**
1. **Confounding identification** - List ALL potential confounders with direction of bias
2. **Interaction analysis** - Both multiplicative (interaction p-value) AND additive (RERI, AP)
3. **Bias types** - Selection, information, ecological biases with examples
4. **Cohort details** - Follow-up strategy, losses, outcome ascertainment method
5. **Causality discussion** - Bradford Hill criteria applicability to design

**Unique EPI Questions:**
- Ecological bias and aggregate vs individual data
- Confounding vs mediator distinction
- Additive vs multiplicative interaction interpretation
- Unmeasured confounding strategies (negative controls, sibling comparisons)
- Registry-based data quality

### **CLINICAL RESEARCH-SPECIFIC (40% of RC exams)**

**Always Expected:**
1. **Sample size with adjustments** - Multiple endpoints, clustering, non-inferiority margins
2. **Endpoint appropriateness** - Surrogate vs clinical, composite vs co-primary
3. **Randomization details** - Method, concealment, stratification, verification of success
4. **Blinding structure** - Feasibility, success, implications for bias
5. **Interim analyses** - Alpha spending, stopping rules, relationship to hypothesis testing

**Unique RC Questions:**
- Non-inferiority vs superiority design rationale
- MAMS (Multi-Arm Multi-Stage) trial design
- Trial registration and protocol deviations
- Composite endpoint interpretation
- Blinding in special contexts (psychiatric, surgical)

---

## 📈 ANSWER QUALITY PROGRESSION

**Poor Answer:** "The study is a randomized trial"

**Better Answer:** "Double-blind RCT with randomization 1:1, stratified by ECOG and age, using central telephone randomization for concealment"

**Excellent Answer:** "Double-blind RCT with stratified block randomization (block size 4, 1:1 allocation) by ECOG (0 vs 1-2) and age (<65 vs ≥65), using central telephone server for allocation concealment. Table 1 confirms balance on all baseline characteristics (all p > 0.05), and ITT analysis included all 455 randomized participants, minimizing selection bias."

**Why the difference?** Exams test THREE LEVELS:
1. Factual recall (definition)
2. Article comprehension (specific details + numbers)
3. Critical thinking (implications for validity + interpretation)

---

## ⏱️ 15-MINUTE ARTICLE EXTRACTION PROTOCOL

**Use this before ANY exam question:**

| Time | Task | Output |
|------|------|--------|
| **0-2 min** | Read abstract + skim Methods | Study design, population, primary outcome |
| **2-4 min** | Read Methods comprehensively | All methodology details in extraction template |
| **4-8 min** | Read Results section + Tables 1-4 | Primary/secondary outcomes, baseline balance, AEs |
| **8-10 min** | Read Discussion + Limitations | Study implications, acknowledged bias, generalizability |
| **10-12 min** | Extract Table 1 baseline data | Confirm balance, note imbalances |
| **12-15 min** | Extract primary result numbers | Point estimate, CI, p-value, clinical context |

**Deliverable after 15 minutes:** Filled-in extraction checklist ready for any question

---

## 🚨 COMMON MISTAKES THAT COST POINTS

| Mistake | Example | How to Avoid |
|---|---|---|
| **Vague answers** | "They randomized patients" | Always include numbers and method |
| **Missing clinical context** | "HR = 0.92" | Always add interpretation: "8% lower hazard, not significant" |
| **Ignoring CI interpretation** | Focus only on p-value | Always say if CI includes null (0 or 1) |
| **Confounder/mediator confusion** | Adjust for mediator thinking it prevents bias | Draw causal diagram first |
| **Ignoring sample size adequacy** | Accept low N without question | Calculate post-hoc power if underpowered |
| **Not linking to article** | Generic answer not sourced | Say "Methods page X states..." or "Table Y shows..." |
| **Multiplicative only** | Test only one interaction scale | For EPI, always test additive too |
| **Ignoring biases** | Don't assess study quality | Use checklist: selection? information? confounding? |
| **Missing directionality** | "There's confounding" | Always say: "toward null" or "away from null" |
| **Absolute vs relative mix-up** | Confuse NNT with RRR | State both if binary outcome |

---

## 💾 FILES PROVIDED IN THIS ANALYSIS

1. **EXAM_EXTRACTION_GUIDE.md** (68 KB)
   - Comprehensive checklist of ALL information to extract
   - Templates for every common question type
   - Detailed explanations of methodology terms
   - Example extractions from sample articles
   - **USE THIS**: As your extraction protocol during exam prep

2. **EXECUTIVE_SUMMARY.md** (this file)
   - High-level overview of patterns
   - "Big 5" critical questions
   - Time-efficient extraction protocol
   - Common mistakes to avoid
   - **USE THIS**: Quick reference before exams

3. **QUICK_REFERENCE.md**
   - Specific numbers/findings from 2019 articles
   - Key statistics with line numbers
   - Exact quotes from corrections
   - **USE THIS**: To cross-check your extractions

4. **SECTION_LOCATION_GUIDE.md**
   - Where each tested concept appears in articles
   - Abstract vs Methods vs Results mapping
   - Table/Figure locations
   - **USE THIS**: To quickly find specific information during practice

---

## 🎯 EXAM PREPARATION STRATEGY

### **Week 1-2: Foundation**
- [ ] Read this Executive Summary completely
- [ ] Read EXAM_EXTRACTION_GUIDE.md sections 1-3 (Framework, Study ID, Methods)
- [ ] For each "Big 5" question type, read relevant template
- [ ] Do one full article extraction using the checklist (time yourself: aim for 15 min)

### **Week 3-4: Practice**
- [ ] Extract 3 more articles (mix EPI and RC)
- [ ] For each, compare YOUR extraction to QUICK_REFERENCE
- [ ] Identify which sections you missed or oversimplified
- [ ] Re-read EXAM_EXTRACTION_GUIDE sections 4-6 (Statistics, Results, Appraisal)

### **Week 5: Advanced**
- [ ] Read actual corrections for 2-3 articles
- [ ] For each correction question, identify which extraction details answer it
- [ ] Practice writing answers using the templates
- [ ] Time yourself: aim for 2-3 minutes per question once article extracted

### **Week 6: Triage & Mastery**
- [ ] Do full simulated exams with 2 articles
- [ ] Focus on your weakest question types (sample size? confounding? design?)
- [ ] For each weak area, do 3-5 extra practice questions
- [ ] Review common mistakes checklist before exam

---

## 🏆 SUCCESS INDICATORS

**You're ready for the exam when:**
- ✓ You can extract a full article in ≤15 minutes
- ✓ You know what every section of EXAM_EXTRACTION_GUIDE means
- ✓ You've practiced all "Big 5" question types at least 3 times each
- ✓ You can identify confounders vs mediators without hesitation
- ✓ You understand why each statistical test was used
- ✓ You can calculate sample size with special adjustments
- ✓ You link every answer back to specific article details
- ✓ Your answers include both clinical AND statistical interpretation

---

## 📞 QUICK REFERENCE: WHERE TO FIND THINGS

| Question Type | Document | Section |
|---|---|---|
| Sample size calculation | EXAM_EXTRACTION_GUIDE | Statistical Details #2 + Template 4 |
| Design question | EXAM_EXTRACTION_GUIDE | Methodological Extraction #1 + Template 1 |
| Confounding vs mediator | EXAM_EXTRACTION_GUIDE | EPI-Specific #1 + Template 6 |
| Endpoint appropriateness | EXAM_EXTRACTION_GUIDE | EPI-Specific #2 or RC-Specific #2 |
| Effect size interpretation | EXAM_EXTRACTION_GUIDE | Results #1 + Template 5 |
| Bias assessment | EXAM_EXTRACTION_GUIDE | Critical Appraisal #1 + Template 3 |
| Statistical test justification | EXAM_EXTRACTION_GUIDE | Statistical Details #2 + Template 2 |
| Study design rationale | EXAM_EXTRACTION_GUIDE | Methodological Extraction #1 + Template 1 |

---

## 🎓 FINAL INSIGHT

**The single biggest difference between high-scoring and low-scoring students:**

High-scoring students **extract everything FIRST**, then answer questions using their extraction.
They know the numbers, the methods, and the limitations before the question is asked.

Low-scoring students try to answer questions by re-reading the article during the exam.
They run out of time and give incomplete answers.

**Your action:** Commit to the 15-minute extraction protocol. Make it automatic.
By exam day, you should be able to extract a full article in your sleep.

---

**GOOD LUCK! 🍀**

*This analysis represents 6 years of exam patterns. Use it wisely.*


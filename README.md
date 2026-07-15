# An-Analysis-of-Inflation-on-the-Purchasing-Power-and-Savings-Behaviour-of-Nigerian-Salary-Earners
Final Data Analysis Project — Seeding Africa Data Analysis Scholarship Institution: FEMTECH Information Technology Institute Researcher: Olatunji, Halimoh Temidayo Date: June 2026
Research Objectives

#Objective1Assess the current purchasing power of Nigerian salary earners and how inflation has affected their ability to meet basic financial needs2Identify the specific expenditure categories most severely impacted by inflation3Examine the extent to which inflation has reduced savings capacity and altered financial planning behaviour4Determine whether inflation impact differs significantly by income level, gender, and employment sector5Evaluate financial coping strategies currently adopted and recommend the most effective approaches


❓ Research Questions


To what extent has inflation reduced the purchasing power of Nigerian salary earners?
Which expenditure categories have been most severely affected by inflation?
How has inflation reduced the savings capacity and altered the financial planning behaviour of salary earners?
Does the impact of inflation differ significantly by income level, gender, and employment sector?
Which financial coping strategies are currently being adopted and how effective are they?



🔑 Key Findings at a Glance

MetricFinding📉 Purchasing Power Decline Rate49.7% — Nearly 1 in 2 salary earners affected💸 Spending 70%+ of Salary on Essentials70.86% — Virtually nothing left for savings🏦 Debt Rate40.5% — Borrowing to cover basic expenses💔 Stopped or Reduced Saving58.08% — Savings crisis confirmed😔 Completely Stopped Saving27.1% — Nothing left at month end🏚️ Depleted Savings Completely39.32% — Largest single debt status group✅ Genuinely Financially Stable20.16% — Only 1 in 5 respondents🍚 Most Affected ExpenditureFood & Groceries — 3.7/5🚗 Second Most AffectedTransportation & Fuel — 3.4/5🏥 Third Most AffectedHealthcare — 3.1/5😰 Most Struggling Income GroupBelow ₦50,000 — 54.24% struggling🎉 Most Improved Income GroupAbove ₦500,000 — 67.39% improved👤 Most Affected GenderMale🏢 Most Affected SectorPublic Sector (2.7 impact score)🔴 Poorest Earners' StrategyBorrowing Money — 49.15%🟢 Highest Earners' StrategyCooperative Savings — 47.83%


📐 Statistical Analysis

Pearson Correlation — Salary Adequacy vs Savings Behaviour

MetricValuePearson r0.6454p-value2.27 × 10⁻⁶⁰Relationship StrengthModerate PositiveStatistically SignificantYESConfidence Level95%

 Tools and Technologies Used

ToolPurposeShow ImageDesigned and distributed 15-question structured questionnaire to 501 respondents nationwideShow ImageData cleaning, Power Query recoding, Pivot Tables, frequency analysis, COUNTIF, AVERAGE, RANKShow ImageSix-page interactive dashboard with KPI cards, DAX measures, slicers, and visual storytellingShow ImageFrequency distributions, conditional aggregations, cross-tabulations, window functionsShow ImagePearson Correlation analysis using pandas, scipy.stats


📁 Repository Structure

📦 inflation-purchasing-power-nigeria/
│
├── 📄 README.md                          ← You are here
│
├── 📊 data/
│   ├── raw_survey_data.xlsx              ← Raw Google Forms export
│   └── cleaned_survey_data.xlsx         ← Cleaned and recoded dataset
│
├── 📈 power_bi/
│   └── inflation_analysis_dashboard.pbix ← Full interactive Power BI dashboard
│
├── 🗄️ sql/
│   └── inflation_analysis_queries.sql    ← All SQL queries for full analysis
│
├── 🐍 python/
│   └── pearson_correlation_analysis.py   ← Python statistical analysis script
│
├── 📑 presentation/
│   └── inflation_analysis_presentation.pptx ← Full PowerPoint presentation
│
├── 📝 report/
│   └── inflation_analysis_full_report.pdf   ← Complete project report (PDF)
│
└── 📋 questionnaire/
    └── survey_questionnaire.pdf          ← Original 15-question survey instrument


📊 Dashboard Pages

The Power BI dashboard consists of 6 interactive pages:

PageTitleContent1Dashboard OverviewTotal respondents, headline KPIs, demographic breakdown2Purchasing Power AnalysisSalary adequacy, income expenditure, sector breakdown3Expenditure Impact AnalysisCategory rankings, sector and income group comparisons4Savings Behaviour AnalysisSavings habits, debt status, income group breakdown5Demographic Impact AnalysisGender, age group, sector, income group comparisons6Coping Strategies & RecommendationsOverall strategies, income gradient, sector patterns


All pages include interactive slicers for Gender, Age Group, Employment Sector, and Monthly Income allowing dynamic filtering across all visuals simultaneously.




🗄️ SQL Analysis Covers

sql-- Overview Queries
-- Total respondents, demographic frequency distributions

-- Objective 1: Purchasing Power
-- Purchasing power decline rate, income expenditure distribution
-- Salary adequacy by income group and employment sector

-- Objective 2: Expenditure Categories
-- Average Likert severity scores per category
-- Most and least affected categories
-- Impact by income group and employment sector

-- Objective 3: Savings Behaviour
-- Savings habit distribution, stopped saving rate
-- Debt status distribution, debt rate
-- Savings collapse by income group

-- Objective 4: Demographic Differences
-- Gender vs salary adequacy, purchasing power by sector
-- Debt burden by income bracket, impact by age group

-- Objective 5: Coping Strategies
-- Overall strategy ranking
-- Strategy by income group (income gradient)
-- Strategy by employment sector
-- Most used strategy per income bracket


🐍 Python Analysis

python# Libraries used
import pandas as pd
from scipy import stats

# Pearson Correlation Analysis
# Variables: Salary Adequacy vs Savings Behaviour
# r = 0.6454
# p-value = 2.27e-60
# Confidence Level: 95%
# Result: Moderate Positive — Extremely Statistically Significant


💡 Recommendations

#RecommendationDirected At1Annual minimum wage review tied to Consumer Price IndexFederal Government2Targeted food price stabilisation through subsidies and storage infrastructureFederal & State Governments3Introduction of Cost of Living Allowances covering food, transport and healthcareEmployers4Emergency micro-savings accounts and low-interest credit facilitiesFinancial Institutions5Income diversification alongside primary salarySalary Earners6Active membership in cooperative savings groups (Ajo/Esusu)All Salary Earners7Expand social protection programmes to cover the working poorFederal Government8Workplace financial literacy programmes on budgeting and debt managementEmployers & Government


📋 Methodology

ElementDetailResearch DesignDescriptive and Analytical SurveyData TypePrimary DataCollection ToolStructured Questionnaire via Google FormsSample Size501 respondentsSampling MethodConvenience SamplingEligibility CriterionMinimum 3 years of salary-earning experienceDistributionWhatsApp, LinkedIn, Email, Social MediaStudy ScopeNigeria — All geopolitical zonesLikert Scale1 = Not Affected at All to 5 = Extremely AffectedStatistical TestPearson Correlation (scipy.stats)


# Questionnaire Structure

Section Questions Focus A — DemographicsQ1–Q4Gender, age, employment sector, monthly incomeB — Purchasing Power Q5–Q7 Salary adequacy, expenditure share, debt statusC — Expenditure Impact Q8–Q12 Likert ratings — food, housing, transport, education, healthcareD — Savings & CopingQ13–Q14Savings habit change, primary coping strategyE — Open EndedQ15Respondent's recommended solutionTotal15


# Respondent Profile

Demographic Dominant Group Percentage Employment SectorPrivate Sector44.51%Age Group36–45 Years 42.32% Income Bracket ₦151,000 – ₦300,00027.54% Gender Male 52.10% Work Experience 3 Years and Above 100% (screening criterion)


# About This Project

This project was completed as the Final Capstone Project for the:

Seeding Africa Data Analysis Scholarship Program
in partnership with
FEMTECH Information Technology Institute
June 2026


# Acknowledgements


Seeding Africa — For the life-changing scholarship opportunity that built confidence, capability, and a genuine career path
FEMTECH IT Institute — Management and instructors for rigorous and deeply supportive training
Project Coordinator and Instructor — For the honest feedback and guidance that made this work better
501 Respondents — For taking time to honestly share their financial experiences. This project is yours as much as it is mine
Classmates and Colleagues — For the shared journey, mutual support, and encouragement throughout


A moderate positive relationship exists between salary adequacy and savings behaviour — as purchasing power declines, savings collapse follows. The p-value of 2.27 × 10⁻⁶⁰ is essentially zero, making this one of the most statistically significant findings possible.

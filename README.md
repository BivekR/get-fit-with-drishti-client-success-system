# Get Fit with Drishti — Client Success Intelligence System

## Project Overview

Get Fit with Drishti is a real online nutrition and fitness coaching business. Clients pay upfront, receive personalized meal and workout plans, and check in throughout the program.

The business was growing, but there was no clear system to understand why some clients succeeded, why some dropped off, and which clients were most likely to refer or return.

I built a complete Client Success Intelligence System using Python, SQL, Machine Learning, Tableau, and Excel to turn client data into actionable business insights.

## Project Snapshot

- 3,000 client records
- 41 data fields
- 13 SQL business queries
- 12 Python EDA charts
- 4 client personas
- Churn-risk model
- Superfan scoring system
- 3 Tableau dashboards

## Business Problem

Revenue was not the main problem because clients pay before coaching begins. The real opportunity was improving:

- Client completion
- Goal achievement
- Early dropout prevention
- Referrals
- Repeat clients
- Long-term business growth

The main question was:

**How can the business identify successful clients, detect at-risk clients early, and turn satisfied clients into referral sources?**

## Tools Used

- Python: data cleaning, EDA, segmentation, churn modeling
- SQL: business analysis queries
- Machine Learning: churn-risk prediction and client scoring
- Tableau: interactive dashboards
- Excel: review and business-friendly outputs
- GitHub: project organization and portfolio presentation

## Project Workflow

### 1. Data Cleaning and Preparation

I cleaned and prepared the raw dataset before analysis. The raw data was kept unchanged, and all cleaned outputs were saved separately.

Key cleaning steps included:

- Removed client names for privacy
- Converted date columns into proper datetime format
- Created `Program_Duration_Days`
- Fixed mixed values in `Days_To_First_Engagement`
- Created engagement and referral flags
- Removed redundant or misleading columns
- Prepared a clean dataset for Python, SQL, and Tableau

### 2. SQL Business Analysis

I created 13 SQL queries to answer business questions around client goals, lead sources, engagement, referrals, payment behavior, dropout risk, and repeat business.

Key findings:

- Weight Loss was the largest goal segment
- Referrals had the highest-quality clients
- High-motivation clients checked in more consistently
- Week 3 inactivity was a strong early warning signal
- Referred clients were much more likely to buy a second round

### 3. Exploratory Data Analysis

I created 12 Python charts to understand the full client journey from acquisition to referral.

The analysis showed that engagement was the strongest driver of client success. Clients who checked in consistently were much more likely to complete the program and achieve their goals.

### 4. Ideal Client Profile and Segmentation

I defined ideal clients as clients who completed the program, achieved their goal, and maintained at least an 80% check-in rate.

Then I used K-Means clustering to create 4 business-actionable client personas:

- Strong Starters
- Early Drop-Offs
- Motivated Finishers
- Loyal Referrals

Each persona included a recommended business action for coaching, retention, or referral strategy.

### 5. Churn Prediction and Early Warning System

I built a churn-risk model to identify clients likely to drop out early. The model used only first-week client information to avoid data leakage.

I compared Logistic Regression, Random Forest, and XGBoost, then selected Logistic Regression because it gave the best recall for identifying at-risk clients.

The most important churn signal was delayed first engagement.

Clients who engaged within 3 days had much lower churn risk than clients who did not engage early. This became the **Day 3 Intervention Rule**.

### 6. Referral and Superfan Analysis

I analyzed referral behavior and created a Superfan Score based on client success, check-in behavior, progress photos, referrals, and second-round purchases.

Key finding:

**Referred clients were over 5x more likely to buy a second round than non-referred clients.**

This showed that referrals and word-of-mouth are major growth opportunities for the business.

### 7. Tableau Dashboard System

I created 3 Tableau dashboards designed as a weekly operating system for the business:

1. Business Overview Dashboard  
   Tracks growth, client goals, lead sources, completion, and goal achievement.

2. Retention & Referral Dashboard  
   Tracks repeat clients, referral performance, retention funnel, and referral impact.

3. Client Success Action Dashboard  
   Helps identify at-risk clients, strong superfans, engagement patterns, and health-condition content opportunities.

## Key Business Insights

- Early engagement is one of the strongest predictors of client success.
- Clients who do not engage within the first 3 days need immediate follow-up.
- Referred clients are much more valuable for repeat business.
- Client success is driven more by behavior than demographics.
- Strong superfans can become a major source of testimonials, referrals, and repeat sales.
- Tableau dashboards can help the business move from guesswork to weekly data-driven decisions.

## Strategic Recommendations

1. Create a Day 3 follow-up rule for non-responsive clients.
2. Build a formal referral program.
3. Contact strong superfans for testimonials and referrals.
4. Create PCOS and Thyroid-specific content based on client demand.
5. Use the Tableau dashboards weekly as a client success operating system.

## Repository Structure

```text
01_raw_data/              Raw project data
02_cleaned_data/          Cleaned dataset
03_python_notebooks/      Python notebooks for analysis and modeling
04_sql_database/          SQLite database files
05_outputs/               Exported analysis outputs
05_sql_queries/           SQL business queries
06_eda_charts/            EDA chart outputs
06_visuals/               Segmentation and model visuals
07_tableau_dashboard/     Tableau dashboard files and exports
08_excel_files/           Excel files used for review and outputs
09_project_documentation/ Final project documentation


Final Outcome

This project delivered a complete Client Success Intelligence System for a real nutrition coaching business.

It combines data cleaning, SQL analysis, Python EDA, machine learning, client segmentation, referral strategy, and Tableau dashboards into one practical business solution.

The project demonstrates my ability to frame a real business problem, clean and analyze data, build predictive and segmentation models, design dashboards, and translate insights into clear business actions.
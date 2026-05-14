# 📊 E-commerce Funnel & Customer Behaviour Analysis

## 📌 Overview

This project analyses user behaviour across an e-commerce funnel using Google Analytics sample data in Google BigQuery.

The goal is to identify where users drop off in the conversion journey, evaluate marketing channel performance, and uncover opportunities to improve conversion rates and revenue.

This project demonstrates skills in SQL-based data analysis, funnel tracking, and business insight generation.

---

## 🎯 Business Problem

The business is experiencing high website traffic but suboptimal conversion rates.

We aim to understand:
- Where users drop off in the customer journey
- Which acquisition channels perform best
- How user behaviour differs across segments
- Where improvements can increase revenue and conversion efficiency

---

## ❓ Key Business Questions

### Funnel Performance
- Where do users drop off in the conversion funnel?
- What percentage of users progress through each stage?

### Acquisition Analysis
- Which channels drive the most traffic?
- Which channels generate the highest conversion rates and revenue?

### Customer Behaviour
- Do returning users convert better than new users?
- Which user segments are most valuable?

### Product Performance
- Which products generate the most engagement and revenue?

---

## 🧰 Tools & Technologies

- SQL (BigQuery)
- Google BigQuery public datasets
- Excel / Tableau (for visualisation)
- Python (optional for extended analysis)

---

## 📁 Project Structure

ecommerce-funnel-analysis/
- data/
  - funnel_conversion_rates.csv
  - funnel_stage_counts.csv
  - channel_performance_results.csv
  - [PLACEHOLDER INSERT OTHER EXPORTED QUERY RESULTS]
- sql/
  - 01_funnel_analysis.sql
  - 02_channel_performance.sql
  - 03_customer_segments.sql
  - 04_product_analysis.sql
- visuals/
  - funnel_dropoff.png
  - revenue_by_channel.png
  - channel_conversion_rate.png
  - new_vs_returning_users.png
  - top_products.png
- README.md

---

## 🔍 Analysis & Findings

### 1. Funnel Analysis

**Key Metrics:**
- Total Visitors: 714,167  
- Product Views: 99,256 (13.9%)  
- Add to Carts: 39,817 (40.12%)  
- Purchasers: 10,022 (25.17%)  

**Key Insight:**
- Largest drop-off occurs at visit -> product view stage
- Mid-funnel engagement is relatively strong once users reach product pages

**Business Interpretation:**
- The analysis reveals a significant drop-off at the top of the funnel, with only 13.9% of users progressing from visit to product view. However, once users engage with products, conversion improves substantially, indicating strong product relevance. The largest inefficiencies are observed in acquisition quality and checkout completion, suggesting opportunities to optimise both marketing targeting and checkout UX.

---

### 2. Channel Performance

**Key Metrics:**
- Total Users (Top Channels):
  - Direct: 275,411
  - Google: 197,853
  - YouTube: 201,088

- Highest Revenue Channels:
  - Direct: $1,332,212.03
  - Google: $268,268.31
  - DFA: $128,626.23

- Highest Conversion Rates:
  - dealspotr.com: 12.46%
  - mail.google.com: 8.02%
  - dfa: 3.36%

- Overall Performance Range:
  - Conversion rates vary from 0.01% to 12.46% across channels

- Low/Zero Conversion Channels:
  - YouTube (0.01% conversion rate, 11 purchasers)
  - Several Google subdomains and referral sources (0% purchasers)

**Key Insight:**
- The analysis reveals a highly unbalanced acquisition structure. While Direct and Google drive the majority of traffic, Direct traffic contributes significantly higher revenue efficiency. Google and YouTube generate large volumes of users but exhibit very low conversion rates, suggesting low-intent acquisition traffic.

- In contrast, smaller referral sources such as dealspotr.com and mail.google.com demonstrate significantly higher conversion rates despite lower traffic volumes, indicating stronger user intent and more efficient targeting.

**Business Interpretation:**
- This suggests that the business is heavily reliant on broad, low-intent acquisition channels while underutilising smaller but higher-performing referral sources. Optimising marketing spend toward higher-converting channels and improving targeting precision for large platforms like Google and YouTube could significantly improve overall revenue efficiency.

---

### 3. Customer Segments

**Key Metrics:**
- [To be added]

**Key Insight:**
- [To be added]

**Business Interpretation:**
- [To be added]

---

### 4. Product Analysis

**Key Metrics:**
- [To be added]

**Key Insight:**
- [To be added]

**Business Interpretation:**
- [To be added]

---

## 📊 Visualisations

All visualisations are stored in the `/visuals` folder.

- Funnel drop-off analysis
- Channel performance comparison
- Conversion rate by traffic source
- Customer segmentation analysis
- Product performance rankings

---

## 💡 Key Takeaways (To be completed at end)

- [Insight 1]
- [Insight 2]
- [Insight 3]

---

## 🚀 Recommendations (To be completed at end)

- Improve top-of-funnel acquisition targeting to increase product engagement
- Reduce checkout friction to improve conversion rates
- Invest in highest-converting acquisition channels
- Optimise product discovery experience

---

## 📌 Notes

- This project uses the Google Analytics sample dataset in BigQuery
- Analysis is designed to simulate real-world e-commerce performance tracking
- Further improvements could include Python-based cohort analysis or predictive modelling

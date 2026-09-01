# Bank Marketing Campaign Analysis

## Project Overview

This portfolio project analyses bank marketing campaign data using PostgreSQL and Power BI to explore term-deposit subscriptions, campaign performance and customer segments.

Drawing on my banking experience, I translated the analysis into business recommendations for testing customer targeting and follow-up strategies.

## Business Questions

* What proportion of customers subscribed to a term deposit?
* How does conversion vary by previous campaign outcome?
* How is contact frequency associated with conversion?
* Which customer segments have higher subscription rates?
* How does conversion differ across contact methods and months?

## Tools Used

* **PostgreSQL:** SQL queries and aggregated analysis.
* **Power BI:** Data modelling, interactive dashboards and visualisation.
* **DAX:** KPI measures and calculated customer groups.

## Overall Results

| Metric                     | Result |
| -------------------------- | -----: |
| Records analysed           | 45,211 |
| Term-deposit subscriptions |  5,289 |
| Conversion rate            | 11.70% |

Conversion rate is calculated as subscriptions divided by total records in the selected filter context. The dashboard labels the record count as “Total Customers”; it is not an independently verified distinct-customer count.

## Dashboard Pages

![Campaign Performance Dashboard](Campaign%20performance.png)

### Campaign Performance

* Overall KPI cards
* Conversion by previous campaign outcome
* Conversion by campaign month
* Conversion by contact frequency
* Conversion by contact method

### Customer Segmentation

![Customer Segmentation Dashboard](Customer%20segmentation.png)

* KPI cards that respond to filters
* Conversion by age group
* Conversion by job role
* Conversion by account balance group
* Conversion by housing-loan status
* Interactive job-role slicer

Tooltips provide customer and subscriber counts alongside conversion rates.

## Key Findings

Segment percentages below are rounded from the dashboard.

1. **Previous campaign success:** Customers with a successful previous campaign outcome had approximately 65% conversion, compared with 11.70% overall.

2. **Contact frequency:** Conversion was approximately 15% for customers contacted once, compared with 6% for those contacted six or more times.

3. **Housing-loan status:** Customers without a housing loan converted at approximately 17%, compared with 8% for those with one.

4. **Age groups:** Customers aged 60+ had approximately 34% conversion, followed by customers under 30 at approximately 18%.

5. **Job roles:** Students and retired customers had the highest conversion rates in the job-role comparison.

6. **Account balance:** The 10K+ balance group converted at approximately 16%, compared with 5–6% for customers with negative balances.

7. **Contact method:** Cellular contacts converted at approximately 15%, telephone contacts at 13–14%, and contacts with an unknown method at 4%.

8. **Campaign month:** March, September, October and December showed higher conversion rates than other months.

## Business Recommendations

* Test follow-up campaigns for customers with successful previous campaign outcomes.
* Review repeated contact attempts and test alternative follow-up strategies.
* Test tailored messaging for different customer segments.
* Compare conversion rates with segment volumes before allocating campaign resources.
* Investigate missing contact information and differences in channel performance.

## Limitations

* These findings describe associations, not proven causes.
* Smaller segments may have high conversion rates but contribute few subscriptions.
* Monthly differences may reflect targeting and customer mix rather than seasonality alone.
* Campaign costs and deposit values were not analysed, so profitability and ROI cannot be inferred.
* Recommendations are proposals for testing; no business impact has been measured.

## Dataset Source

- **Dataset:** Bank Marketing
- **Source:** [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/222/bank+marketing)
- **Creators:** S. Moro, P. Rita and P. Cortez
- **Licence:** [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)
- **Project transformations:** Added customer groupings and calculated conversion metrics for analysis.
- **File used:** `bank_marketing.csv` (renamed locally from `bank-full.csv`).
  
## How to Reproduce

1. Download the dataset from the source above.
2. Import the CSV into a PostgreSQL table, matching the column names used in the SQL script.
3. Run the SQL analysis script.
4. Download and open `banking project.pbix` in Power BI Desktop.
5. Update the data-source connection or file path to your local dataset if required.
6. Refresh the report and explore the dashboard filters.

## Repository Contents

- `banking project.pbix` — interactive Power BI report
- `Campaign performance.png` — campaign dashboard preview
- `Customer segmentation.png` — customer segmentation preview
- `README.md` — project documentation

Namrata Rai
Banking professional transitioning into data and business analytics.



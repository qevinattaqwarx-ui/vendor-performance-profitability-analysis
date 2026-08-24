# Vendor Performance & Profitability Analysis

An end-to-end data analytics project focused on evaluating vendor sales performance, profitability, inventory efficiency, and vendor concentration using Python, Pandas, SQLite, MySQL, SQL, and Power BI.

The project started from raw CSV datasets and progressed through data preparation, exploratory data analysis, database migration, analytical validation, and interactive dashboard development.

---

## Project Overview

The objective of this project is to analyze vendor performance and identify key factors affecting sales, profitability, purchasing efficiency, and inventory turnover.

The analysis focuses on questions such as:

* Which vendors generate the highest sales?
* Which vendors generate the highest gross profit?
* How profitable are vendor-brand combinations?
* How efficiently is inventory being turned over?
* How does sales performance compare with purchasing activity?
* How concentrated are sales among the largest vendors?
* Which vendor-level records combine high sales with strong operational efficiency?

---

## Analytical Workflow

```text
Raw CSV Files
     │
     ▼
Python + Pandas
     │
     ▼
SQLite Database
     │
     ├── Data validation
     └── Exploratory Data Analysis
     │
     ▼
MySQL Database
     │
     ├── Analytical preparation
     └── SQL validation
     │
     ▼
Power BI
     │
     └── Vendor Performance Dashboard
```

---

## Dataset

The project uses six source datasets:

* `begin_inventory`
* `end_inventory`
* `purchases`
* `purchase_prices`
* `sales`
* `vendor_invoice`

The combined source data contains approximately **15.4 million records**.

### Dataset Sizes

| Dataset         |    Records |
| --------------- | ---------: |
| begin_inventory |    206,529 |
| end_inventory   |    224,489 |
| purchases       |  2,372,474 |
| purchase_prices |     12,261 |
| sales           | 12,825,363 |
| vendor_invoice  |      5,543 |

---

## Tools & Technologies

### Programming & Data Processing

* Python
* Pandas
* Jupyter Notebook

### Databases

* SQLite
* MySQL

### SQL & Database Access

* SQL
* SQLAlchemy

### Business Intelligence

* Power BI
* Power Query

### Analysis

* Exploratory Data Analysis (EDA)
* Vendor Performance Analysis
* Profitability Analysis
* Vendor Concentration Analysis
* Operational Efficiency Analysis

---

## Data Preparation

The raw CSV files were initially processed using Python and Pandas.

Because several source tables contain millions of records, the data was processed in chunks before being loaded into the SQLite database.

SQLite was used as the initial analytical and validation database.

The resulting SQLite database was:

```text
inventory.db
```

---

## SQLite to MySQL Migration

After the initial analysis and validation, the complete SQLite database was migrated to MySQL.

The analytical MySQL database is:

```text
vendor_analysis
```

The migration preserved the six source tables:

```text
begin_inventory
end_inventory
purchase_prices
purchases
sales
vendor_invoice
```

The migration was completed successfully and took approximately **7.10 minutes**.

SQLite was retained as a validation reference while MySQL became the primary analytical database.

---

## Data Validation

Several validation steps were performed during the analytical preparation phase.

### Sales Validation

The source sales table contains:

* **12,825,363** sales records
* **32,917,876** total sales quantity
* **$452,062,952.07** total sales dollars

A decimal precision reconciliation was also performed during the MySQL analytical preparation.

Using:

```sql
CAST(SalesDollars AS DECIMAL(20,6))
```

produced a reconciled total of:

```text
$452,062,952.02
```

The reconciliation was used to validate the analytical calculation against the source data.

### Purchase Validation

The purchase baseline contains:

* **2,372,474** purchase records
* **33,584,377** purchase quantity
* **$321,900,765.53** purchase dollars
* **126** distinct vendors

### Vendor Coverage

The sales source contains **127 distinct VendorNo values**.

The final vendor-level analytical grain is based on one record per `VendorNo`.

---

## Exploratory Data Analysis

The EDA was performed in Python using Pandas and Jupyter Notebook.

The analysis covered:

1. Vendor profitability
2. Vendor concentration
3. Sales vs. profit
4. Operational efficiency
5. Brand-level analysis
6. Description-level analysis

---

## Vendor Profitability

Profitability was evaluated using:

```text
Gross Profit = Total Sales Dollars - Total Purchase Dollars
```

and:

```text
Profit Margin = Gross Profit / Total Sales Dollars
```

The vendor-brand analysis identified:

* **10,692** vendor-brand combinations
* **1,949** combinations with negative profit margin
* Negative-margin combinations represented approximately **18.23%** of vendor-brand combinations

The Profit Margin distribution was highly skewed.

The mean Profit Margin was approximately:

```text
-15.89%
```

while the median was approximately:

```text
30.78%
```

There were **178 records with missing Profit Margin** because their `TotalSalesDollars` was zero.

---

## Inventory & Operational Efficiency

Vendor efficiency was evaluated using:

* Stock Turnover
* Sales-to-Purchase Ratio
* Profit Margin
* Total Sales

The final `vendor_efficiency` analytical dataset contains vendor-level performance metrics.

### Vendor Efficiency Dataset

Initial dataset:

```text
128 vendor records
```

After cleaning:

```text
126 vendor records
```

The median values were:

| Metric                  | Median |
| ----------------------- | -----: |
| Profit Margin           | 26.78% |
| Stock Turnover          | 0.9834 |
| Sales-to-Purchase Ratio | 1.4446 |

---

## Correlation Analysis

The correlation analysis produced the following results:

| Metric Pair                               | Correlation |
| ----------------------------------------- | ----------: |
| Profit Margin vs Stock Turnover           |    0.090259 |
| Profit Margin vs Sales-to-Purchase Ratio  |    0.089969 |
| Stock Turnover vs Sales-to-Purchase Ratio |    0.999722 |

The extremely high correlation between Stock Turnover and Sales-to-Purchase Ratio indicates that these two operational metrics move very closely together in the analyzed vendor-level data.

In contrast, Profit Margin showed only a weak positive relationship with both operational efficiency metrics.

---

## Vendor Concentration

Vendor concentration was analyzed to understand how dependent total sales are on the largest vendors.

The analysis identified:

* **126** unique vendors in the cleaned vendor-level dataset
* Approximately **$451.62M** in total vendor sales
* The **Top 10 vendors accounted for approximately 65% of sales**

The Power BI dashboard calculates the Top 10 Vendor Contribution at approximately:

```text
64.99%
```

This indicates a high level of sales concentration among the largest vendors.

---

## High-Sales & Operationally Efficient Vendors

A combined efficiency analysis was performed using the following thresholds:

```text
Total Sales Dollars >= $29,524.25
Stock Turnover >= 0.983431
Sales-to-Purchase Ratio >= 1.444635
```

The analysis identified **882 vendor-level records** meeting these criteria.

---

## Brand Analysis

Brand-level profitability was calculated by aggregating:

* Gross Profit
* Total Sales Dollars

before calculating Profit Margin.

The methodology was corrected to ensure that Profit Margin was calculated from aggregated financial values rather than averaging individual ratios.

### Brand Segmentation

Thresholds used in the analysis included:

```text
Low Sales = $729.27
High Sales = $28,459.39
High Profit Margin = 40.2028%
Low Profit Margin = 15.35%
```

The segmentation identified:

* **482** brands with low sales and high profit margin
* **206** brands with high sales and low profit margin

---

## Description-Level Analysis

The project also explored product description-level performance.

The analysis identified:

* **105** low-sales / high-margin descriptions
* **6** high-sales / low-margin descriptions

These segments provide additional areas for potential product-level investigation.

---

## Power BI Dashboard

The final Power BI dashboard presents the vendor analysis through KPI cards and analytical visualizations.

### KPI Metrics

The dashboard contains:

* Total Sales
* Total Purchase
* Gross Profit
* Profit Margin
* Top 10 Vendor Contribution

Current headline values include approximately:

| KPI                        |    Value |
| -------------------------- | -------: |
| Total Sales                | $452.06M |
| Total Purchase             | $321.90M |
| Gross Profit               | $130.16M |
| Profit Margin              |    7.88% |
| Top 10 Vendor Contribution |   64.99% |

### Dashboard Analysis

The dashboard covers:

* Top 10 Vendors by Sales
* Top 10 Vendors by Gross Profit
* Stock Turnover by Vendor
* Sales-to-Purchase Ratio by Vendor
* Sales vs. Gross Profit relationship
* Vendor concentration
* Overall vendor profitability and efficiency

---

## Key Business Findings

### 1. Sales are highly concentrated

The Top 10 vendors contribute approximately **65% of total sales**, indicating significant dependence on a relatively small group of vendors.

### 2. Profitability varies substantially

Profit Margin is highly skewed, with a significant number of vendor-brand combinations generating negative margins.

### 3. Operational efficiency and profitability are not strongly correlated

Profit Margin has only weak correlations with Stock Turnover and Sales-to-Purchase Ratio.

This suggests that improving operational efficiency alone does not necessarily guarantee higher profitability.

### 4. Stock Turnover and Sales-to-Purchase Ratio move almost identically

The correlation between the two metrics is approximately **0.9997**, indicating extremely similar movement at the vendor level.

### 5. High-sales vendors deserve additional monitoring

The combination of high sales and operational efficiency can help identify vendors that have both commercial importance and strong operational performance.

---

## Project Structure

```text
vendor-performance-profitability-analysis/
│
├── README.md
│
├── notebooks/
│   └── 03_vendor_analysis_eda.ipynb
│
├── sql/
│   └── analytical_queries/
│
├── database/
│   └── migration_documentation/
│
├── powerbi/
│   └── vendor_performance_dashboard.pbix
│
├── docs/
│   ├── data_validation/
│   ├── mysql_migration/
│   └── analysis/
│
└── images/
    └── dashboard/
```

> Large raw datasets and database files are intentionally not included in the repository.

---

## Author

**Qevin Attaqwa**

Data Analyst | Business Intelligence | SQL | Power BI

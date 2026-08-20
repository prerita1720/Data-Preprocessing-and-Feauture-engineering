# Holistic Data Preparer — Customer Credit Risk (Final Project)

End-to-end data preprocessing & feature engineering pipeline on a synthetic, multi-source
**Customer Credit Risk** dataset, built for a fintech loan-default use case
(`default_flag`: 0 = No Default, 1 = Default).

## Problem Statement

As a Junior Data Scientist, the dataset arrives messy and split across four sources
(CSV, JSON, SQL, a dummy API). The goal is full-scale cleaning and feature engineering so
the data is ready to train a machine-learning model that predicts loan default.

## Repository Structure

```
├── Holistic_Data_Preparer_Customer_Credit_Risk.ipynb   # Full notebook (Parts A-H, executed)
├── data/
│   ├── transactions_main.csv          # Source 1: CSV  — loan/financial fields
│   ├── customer_metadata.json         # Source 2: JSON — demographic metadata
│   ├── loan_repayment.db              # Source 3: SQLite — repayment/behavioral history
│   └── economic_indicators_api.json   # Source 4: dummy API — region-level indicators
├── outputs/
│   ├── final_cleaned_customer_credit_risk.csv   # Final ML-ready dataset (1500 rows x 53 cols)
│   └── Theory_Concepts.pdf                       # Theory concepts & definitions
└── README.md
```

## Pipeline Overview

| Part | Contents |
|------|----------|
| A | Conceptual notes (data analysis, project planning, ML problem framing, tensors + NumPy) |
| B | Multi-source data acquisition (CSV + JSON + SQL + API) and merge |
| C | `.info()` / `.describe()`, data-quality report, 6 missing-value imputation strategies |
| D | Outlier detection (Z-score, IQR, Percentile) and Winsorization treatment |
| E | Mixed variables, date handling, Ordinal/Label/One-Hot encoding, binning/binarization/K-Means binning |
| F | Standardization, Min-Max, MaxAbs, Robust scaling |
| G | Log/reciprocal/sqrt transforms, Box-Cox & Yeo-Johnson, ColumnTransformer, engineered features |
| H | Final cleaned dataset export + written summary report |

## How to Run

```bash
pip install pandas numpy scikit-learn matplotlib
jupyter notebook Holistic_Data_Preparer_Customer_Credit_Risk.ipynb
```
Run all cells top to bottom. The notebook reads from `data/` and writes the final dataset
and (optionally, if `ydata-profiling` is installed) an HTML profiling report to `outputs/`.

## Final Dataset

- **Shape:** 1,500 rows x 53 columns
- **Missing values:** 0
- **Includes:** cleaned/imputed numerics, treated outliers, one-hot/ordinal/label-encoded
  categoricals, four scaled variants (standardized columns retained), skew-corrected
  transforms, and engineered ratios (`debt_to_income_ratio`, `average_monthly_transactions`,
  `spending_to_income_ratio`).

## Notes

- The dataset is **synthetically generated** (not real customer data) specifically to match
  the missingness/outlier/skew patterns required by each task in the project brief.
- Suitable assumptions (imputation strategy per column, bin thresholds, transform choice)
  are documented inline in the notebook markdown cells.

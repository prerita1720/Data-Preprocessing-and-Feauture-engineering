# Data Cleanser — Healthcare Dataset Pre-processing

A data pre-processing pipeline for a healthcare dataset (5,000 patient records), covering **missing value imputation** and **outlier treatment**, culminating in a clean, model-ready dataset.

## Overview

This project analyzes and cleans a healthcare dataset containing patient demographic and clinical information. It compares multiple imputation and outlier-handling techniques before selecting the most statistically robust combination for the final dataset.

## Dataset

`healthcare_dataset_5000.csv` — 5,000 rows with the following columns:

| Column | Type | Missing % |
|---|---|---|
| patient_id | Numerical | 0% |
| age | Numerical | ~12% |
| gender | Categorical | ~32.8% |
| bmi | Numerical | ~12% |
| blood_pressure | Numerical | 0% |
| cholesterol | Numerical | ~12% |
| glucose | Numerical | ~12% |
| region | Categorical | ~24.4% |
| disease_risk | Numerical | 0% |

## Project Structure (Notebook Tasks)

1. **Load Dataset & Initial Overview** — read CSV, inspect structure
2. **Missing Value Analysis** — compute and visualize missing % per column
3. **Simple Imputation** — Mean and Median imputation (BMI)
4. **Categorical Imputation** — Most Frequent (mode) imputation (gender, region)
5. **Random Sample + Missing Indicator** — distribution-preserving imputation with missingness flags
6. **KNN Imputation** — imputation based on 5 nearest neighbors (age, bmi, cholesterol, glucose)
7. **MICE (Iterative Imputation)** — multivariate, chained-equations imputation
8. **Outlier Detection — Z-Score** — removes rows with |Z| > 3
9. **Outlier Detection — IQR** — removes rows outside 1.5×IQR
10. **Outlier Detection — Percentile Capping** — clips values at 1st/99th percentile
11. **Winsorization** — caps values at 5th/95th percentile (no row removal)
12. **Visualization** — before/after boxplots comparing outlier treatment
13. **Dataset Comparison** — shape comparison across all outlier methods
14. **Final Dataset Creation** — combines MICE + mode imputation + Winsorization into `final_df`

## Methods Used & Why

**Imputation**
- **Mean/Median** — simple baselines; median preferred for skewed features like BMI
- **Mode** — used for categorical variables (gender, region)
- **Random Sample + Indicator** — preserves original distribution, flags missingness for the model
- **KNN** — leverages similarity between patients, numerical columns only
- **MICE** *(chosen for final dataset)* — models each feature as a function of the others; most statistically reliable

**Outlier Treatment**
- **Z-Score / IQR** — effective but cause data loss (rows are dropped)
- **Percentile Capping** — no data loss, simple thresholding
- **Winsorization** *(chosen for final dataset)* — caps extreme values at 5th/95th percentile; preserves all 5,000 records, which matters in healthcare data where every patient record is valuable

## Final Pipeline

```
final_df = df.copy()

# 1. Impute numerical columns with MICE
mice_imputer = IterativeImputer(random_state=42)
final_df[['age','bmi','cholesterol','glucose']] = mice_imputer.fit_transform(...)

# 2. Impute categorical columns with mode
cat_imputer = SimpleImputer(strategy='most_frequent')
final_df[['gender','region']] = cat_imputer.fit_transform(...)

# 3. Cap outliers with Winsorization
for col in ['bmi','blood_pressure','cholesterol','glucose']:
    final_df[col] = winsorize(final_df[col], limits=[0.05, 0.05])
```

**Result:** 0 missing values, 5,000 rows retained, dataset ready for machine learning modeling (e.g., disease risk prediction).

## Requirements

```
pandas
numpy
matplotlib
seaborn
scikit-learn
scipy
```

Install with:
```bash
pip install pandas numpy matplotlib seaborn scikit-learn scipy
```

## How to Run

1. Place `healthcare_dataset_5000.csv` in the same directory as the notebook.
2. Open `Data_Cleanser.ipynb` in Jupyter Notebook / JupyterLab.
3. Run all cells sequentially (Tasks 1 → 14).
4. The cleaned dataset is available as the `final_df` DataFrame at the end.

## Files

| File | Description |
|---|---|
| `Data_Cleanser.ipynb` | Main notebook with all pre-processing steps |
| `healthcare_dataset_5000.csv` | Raw input dataset |
| `final_df` (in-notebook) | Cleaned, model-ready output dataset |

## Author's Notes

This project demonstrates a comparative approach to data cleaning — rather than applying a single method, multiple imputation and outlier-treatment techniques were tested side by side so the most appropriate one could be chosen based on the data's actual characteristics (skewness, missingness pattern, and importance of preserving all records in a healthcare context).

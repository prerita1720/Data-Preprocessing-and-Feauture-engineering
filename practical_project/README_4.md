# Ride Demand Forecasting Data Prep Engine

**Practical Exam | Set C — Data Preprocessing and Feature Engineering**
Exam type: Practical · Duration: 6 hours

## Objective

Build a complete data preprocessing & feature engineering pipeline that prepares real-world
ride-hailing trip data for downstream analytics and predictive modeling (ride demand
forecasting, surge pricing prediction), working with **CSV, JSON, and SQL** datasets related
to ride bookings, users, and city zones.

## Repository Structure

```
.
├── README.md
├── data/
│   ├── riders.csv          # Rider demographic & account details
│   ├── trips.json          # Trip booking & ride completion logs
│   └── city_zones.sql      # Zone-level attributes (CREATE TABLE + INSERT statements)
├── notebook/
│   └── main.ipynb          # Full preprocessing & feature engineering pipeline
└── output/
    ├── final_prepared_rides_dataset.csv   # Final model-ready dataset
    ├── summary_table.csv                  # Before/after cleaning summary
    ├── Summary_Report.docx                # 1-page theory + observations report
    ├── ride_demand_by_hour.png            # Bonus EDA visual
    ├── surge_vs_nosurge.png               # Bonus EDA visual
    └── outlier_handling_boxplots.png      # Before/after outlier visual
```

## How to Run

1. Install dependencies:
   ```bash
   pip install pandas numpy scikit-learn scipy matplotlib seaborn
   ```
2. Open and run `notebook/main.ipynb` top to bottom (paths are relative — run it from
   inside the `notebook/` folder, or adjust `DATA_DIR`).
3. The final dataset is written to `output/final_prepared_rides_dataset.csv`.

## Pipeline Steps (matches exam spec)

| # | Step | What it does |
|---|------|---------------|
| 1 | Data Understanding & Loading | Loads CSV/JSON/SQL, shows `.head()`, `.info()`, missing-value counts, duplicate & invalid-entry checks |
| 2 | Data Cleaning | `SimpleImputer` (mean/most-frequent), `KNNImputer` for duration/distance/fare, date-format standardization, removes unrealistic rows |
| 3 | Outlier Handling | Z-score (fare/distance), IQR (duration), Winsorization, before/after comparison |
| 4 | Data Transformation | `hour`/`day_of_week`/`month` extraction, Label/One-Hot/Ordinal encoding, ride-frequency binning, log & sqrt transforms |
| 5 | Feature Scaling | `StandardScaler` and `MinMaxScaler`, before/after stats |
| 6 | Feature Construction | `avg_ride_distance`, `avg_ride_fare`, `is_peak_hour`, `days_since_signup`, `ride_cancellation_rate`, `surge_flag` |
| 7 | Final Dataset | Merges cleaned & enriched tables, summary table, exports `final_prepared_rides_dataset.csv` |
| 8 | Bonus | Ride demand by hour, surge vs no-surge visualizations |

## Deliverables Checklist

- [x] Python Notebook (`notebook/main.ipynb`)
- [x] Final CSV Output (`output/final_prepared_rides_dataset.csv`)
- [x] Summary Report (`output/Summary_Report.docx` — Theory + Observations, 1 page)
- [x] All within a GitHub repository, including this `README.md`

## Notes

`riders.csv`, `trips.json`, and `city_zones.sql` in `data/` are synthetically generated
(seeded, reproducible) to mirror realistic ride-hailing data quality issues — missing
values, duplicates, inconsistent date formats, negative fares, zero-distance-but-billed
rides, and surge-fare outliers — so every cleaning/outlier-handling step in the notebook
has genuine work to do.

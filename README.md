# Power BI Executive Dashboard

A portfolio project demonstrating **Power Query, star-schema modelling, DAX, KPI architecture, business variance analysis, drilldowns and executive storytelling**.

> **Data note:** All business data is synthetic. No employer/customer commercial information is included.

## Business Problem

Leadership dashboards often fail because they contain too many disconnected charts without answering the questions executives actually have:

- Are we on target?
- Are we growing?
- Are margins healthy?
- Which regions or products explain the result?
- Where should management investigate?
- What action might follow?

This project is designed around **decision-ready reporting**, not visual volume.

## Tech Stack

- Power BI design
- Power Query / M
- DAX
- Star-schema modelling
- SQL
- Python/Pandas
- Executive KPI design

## Repository Structure

```text
powerbi-executive-dashboard/
├── data/
│   ├── raw/
│   └── processed/
├── src/
├── sql/
├── powerbi/
│   ├── dashboard_spec.md
│   ├── dax_measures.md
│   └── power_query_m.md
├── docs/
├── screenshots/
├── requirements.txt
└── README.md
```

## Data Model

The model uses a star schema:

```text
              DimDate
                 |
DimProduct -- FactSales -- DimRegion
                 |
             DimChannel
                 |
             DimSegment
```

The fact table contains:
- revenue
- gross sales
- discount
- cost
- gross profit
- revenue target
- units

## KPI Architecture

### Executive KPIs
- Revenue
- Gross Profit
- Gross Margin %
- Revenue Target
- Revenue Variance
- Revenue Variance %
- YoY Growth

### Driver KPIs
- Product performance
- Region performance
- Channel performance
- Segment performance
- Average Order Value
- Discount Rate

### Diagnostic Detail
- Orders
- Units
- mix
- transaction-level drillthrough

## DAX

The project contains measures for:

- Revenue
- Gross Profit
- Gross Margin %
- Revenue vs Target
- Variance %
- YoY Revenue
- YoY %
- YTD Revenue
- YTD Target
- YTD Variance
- Rolling 3-Month Revenue
- Average Order Value
- Discount Rate

See [`powerbi/dax_measures.md`](powerbi/dax_measures.md).

## Power Query

The Power Query examples demonstrate:

- source ingestion
- header promotion
- explicit typing
- null/business-key validation
- data-quality handling

See [`powerbi/power_query_m.md`](powerbi/power_query_m.md).

## Dashboard Pages

### Executive Overview
High-level outcome KPIs and exception-focused visuals.

### Commercial Performance
Product, region, channel and segment drivers.

### Variance Analysis
Actual vs target, waterfall and driver analysis.

### Detail & Drillthrough
Controlled route from executive signal to transaction-level detail.

## Variance Analysis

This project uses business performance variance:

```text
Actual - Target
```

and percentage variance:

```text
(Actual - Target) / Target
```

See [`docs/variance_analysis.md`](docs/variance_analysis.md).

## Executive Storytelling

The dashboard follows:

```text
What happened?
      ↓
Where?
      ↓
Why?
      ↓
What needs investigation?
      ↓
What action might follow?
```

See [`docs/executive_storytelling.md`](docs/executive_storytelling.md).

## Why Star Schema?

A star schema improves:

- clarity
- filter behaviour
- DAX maintainability
- time intelligence
- semantic-layer reuse
- model performance

See [`docs/star_schema.md`](docs/star_schema.md).

## Build the Model Data

```bash
pip install -r requirements.txt
python src/build_star_schema.py
```

## Skills Demonstrated

- Power BI
- Power Query
- DAX
- Data modelling
- Star schema
- SQL
- Python
- KPI architecture
- Variance analysis
- Time intelligence
- Executive reporting
- Drillthrough / drilldown
- Business storytelling

## Interview Talking Points

1. Star schema vs flat table.
2. Measures vs calculated columns.
3. Filter context.
4. `CALCULATE`.
5. Time intelligence.
6. YTD and YoY.
7. Actual vs target variance.
8. Power Query vs DAX.
9. Drilldown vs drillthrough.
10. Dashboard validation.
11. Executive dashboard design.
12. Semantic-model governance.

## Portfolio Classification

**Type:** Portfolio Build  
**Data:** Synthetic  
**Purpose:** Demonstrate Power BI engineering and executive business intelligence.

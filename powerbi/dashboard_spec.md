# Power BI Executive Dashboard Specification

## Page 1 — Executive Overview

### KPI Cards
- Revenue
- Gross Profit
- Gross Margin %
- Revenue Target
- Revenue Variance
- Revenue Variance %
- Orders
- Average Order Value

### Visuals
- Revenue vs Target by Month
- Revenue YoY %
- Gross Margin trend
- Revenue by Region
- Revenue by Product
- Variance waterfall
- Top / Bottom performance table

### Executive Questions
- Are we ahead or behind target?
- Is growth improving?
- Which regions/products explain variance?
- Is margin improving or deteriorating?

---

## Page 2 — Commercial Performance

Visuals:
- Product x Region matrix
- Revenue by Channel
- Revenue by Segment
- Discount Rate by Product
- Gross Margin by Product
- Average Order Value by Segment

Drilldown:
- Region → Product → Channel

---

## Page 3 — Variance Analysis

Visuals:
- Revenue vs Target waterfall
- Variance by Region
- Variance by Product
- Variance by Channel
- YTD Variance %
- Prior-year comparison

Use conditional formatting to highlight material negative variance.

---

## Page 4 — Detail & Drillthrough

Drillthrough fields:
- Region
- Product
- Segment

Detail:
- Revenue
- Profit
- Margin
- Target
- Variance
- Units
- Orders
- Discount

Purpose:
Move from executive signal to underlying commercial detail without overloading the executive page.

---

## Recommended Slicers

- Date
- Region
- Product
- Channel
- Segment

## Executive Design Principles

- Put decisions before decoration.
- Limit KPI cards to metrics leaders act on.
- Use consistent units and number formats.
- Avoid overcrowding.
- Highlight exceptions rather than every data point.
- Keep drilldowns separate from executive summary.

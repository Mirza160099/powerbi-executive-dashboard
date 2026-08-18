# DAX Measure Library

```DAX
Revenue =
SUM(FactSales[revenue_gbp])

Gross Sales =
SUM(FactSales[gross_sales_gbp])

Discount =
SUM(FactSales[discount_gbp])

Gross Profit =
SUM(FactSales[gross_profit_gbp])

Gross Margin % =
DIVIDE([Gross Profit], [Revenue])

Revenue Target =
SUM(FactSales[revenue_target_gbp])

Revenue Variance =
[Revenue] - [Revenue Target]

Revenue Variance % =
DIVIDE([Revenue Variance], [Revenue Target])

Orders =
DISTINCTCOUNT(FactSales[order_id])

Units =
SUM(FactSales[units])

Average Order Value =
DIVIDE([Revenue], [Orders])

Discount Rate % =
DIVIDE([Discount], [Gross Sales])

Revenue LY =
CALCULATE(
    [Revenue],
    SAMEPERIODLASTYEAR(DimDate[date])
)

Revenue YoY =
[Revenue] - [Revenue LY]

Revenue YoY % =
DIVIDE([Revenue YoY], [Revenue LY])

Revenue YTD =
TOTALYTD(
    [Revenue],
    DimDate[date]
)

Target YTD =
TOTALYTD(
    [Revenue Target],
    DimDate[date]
)

YTD Variance =
[Revenue YTD] - [Target YTD]

YTD Variance % =
DIVIDE([YTD Variance], [Target YTD])

Rolling 3M Revenue =
CALCULATE(
    [Revenue],
    DATESINPERIOD(
        DimDate[date],
        MAX(DimDate[date]),
        -3,
        MONTH
    )
)
```

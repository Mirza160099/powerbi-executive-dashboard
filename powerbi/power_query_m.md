# Power Query M Examples

## FactSales

```powerquery
let
    Source = Csv.Document(
        File.Contents("fact_sales.csv"),
        [Delimiter=",", Encoding=65001, QuoteStyle=QuoteStyle.Csv]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    Typed = Table.TransformColumnTypes(
        PromotedHeaders,
        {
            {"order_id", type text},
            {"date_key", Int64.Type},
            {"product_key", Int64.Type},
            {"region_key", Int64.Type},
            {"channel_key", Int64.Type},
            {"segment_key", Int64.Type},
            {"units", Int64.Type},
            {"gross_sales_gbp", Currency.Type},
            {"discount_gbp", Currency.Type},
            {"revenue_gbp", Currency.Type},
            {"cogs_gbp", Currency.Type},
            {"gross_profit_gbp", Currency.Type},
            {"revenue_target_gbp", Currency.Type}
        }
    ),
    CleanRows = Table.SelectRows(Typed, each [order_id] <> null and [date_key] <> null)
in
    CleanRows
```

## Recommended Data Quality Steps

- Promote headers.
- Assign explicit data types.
- Remove invalid/null business keys.
- Standardise text dimensions.
- Validate numerical ranges.
- Remove duplicates using order/business key where appropriate.
- Surface errors instead of silently suppressing them.

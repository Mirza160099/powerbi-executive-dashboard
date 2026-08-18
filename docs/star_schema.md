# Star Schema

```text
              DimDate
                 |
DimProduct -- FactSales -- DimRegion
                 |
             DimChannel
                 |
             DimSegment
```

## Fact Table

`FactSales`

Grain:
**one order line / synthetic transaction record**

Measures:
- units
- gross sales
- discount
- revenue
- cost
- gross profit
- revenue target

## Dimensions

### DimDate
Calendar attributes for time intelligence.

### DimProduct
Product classification.

### DimRegion
Geographic reporting.

### DimChannel
Sales channel.

### DimSegment
Customer segment.

## Why Star Schema?

- simpler relationships
- better DAX behaviour
- clearer filter propagation
- reusable dimensions
- easier time intelligence
- more maintainable semantic layer

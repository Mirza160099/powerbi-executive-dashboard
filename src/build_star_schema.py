import pandas as pd

fact = pd.read_csv("data/raw/fact_sales_synthetic.csv")
fact["date"] = pd.to_datetime(fact["date"])

def make_dim(series, key, label):
    values = sorted(series.dropna().unique())
    return pd.DataFrame({key: range(1, len(values)+1), label: values})

dim_product = make_dim(fact["product"], "product_key", "product")
dim_region = make_dim(fact["region"], "region_key", "region")
dim_channel = make_dim(fact["channel"], "channel_key", "channel")
dim_segment = make_dim(fact["segment"], "segment_key", "segment")

dim_date = pd.DataFrame({"date": pd.date_range(fact["date"].min(), fact["date"].max(), freq="D")})
dim_date["date_key"] = dim_date["date"].dt.strftime("%Y%m%d").astype(int)
dim_date["year"] = dim_date["date"].dt.year
dim_date["month_number"] = dim_date["date"].dt.month
dim_date["month_name"] = dim_date["date"].dt.strftime("%b")
dim_date["year_month"] = dim_date["date"].dt.to_period("M").astype(str)
dim_date["quarter"] = "Q" + dim_date["date"].dt.quarter.astype(str)

star = fact.copy()
star["date_key"] = star["date"].dt.strftime("%Y%m%d").astype(int)

for dim, key, label in [
    (dim_product, "product_key", "product"),
    (dim_region, "region_key", "region"),
    (dim_channel, "channel_key", "channel"),
    (dim_segment, "segment_key", "segment"),
]:
    star = star.merge(dim, on=label, how="left")

fact_star = star[[
    "order_id","date_key","product_key","region_key","channel_key","segment_key",
    "units","gross_sales_gbp","discount_gbp","revenue_gbp","cogs_gbp",
    "gross_profit_gbp","revenue_target_gbp"
]]

fact_star.to_csv("data/processed/fact_sales.csv", index=False)
dim_date.to_csv("data/processed/dim_date.csv", index=False)
dim_product.to_csv("data/processed/dim_product.csv", index=False)
dim_region.to_csv("data/processed/dim_region.csv", index=False)
dim_channel.to_csv("data/processed/dim_channel.csv", index=False)
dim_segment.to_csv("data/processed/dim_segment.csv", index=False)

print("Star schema generated.")

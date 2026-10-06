import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("retail_sales.csv")
df["Date"] = pd.to_datetime(df["Date"])

print("Total Revenue:", round(df["Revenue"].sum(), 2))
print("Total Units:", int(df["Quantity"].sum()))
print("Average Order Value:", round(df["Revenue"].mean(), 2))
print("\nRevenue by Category:")
print(df.groupby("Category")["Revenue"].sum().sort_values(ascending=False))
print("\nRevenue by Region:")
print(df.groupby("Region")["Revenue"].sum().sort_values(ascending=False))
print("\nTop Products:")
print(df.groupby("Product")["Revenue"].sum().sort_values(ascending=False).head(5))

monthly = df.groupby(df["Date"].dt.to_period("M"))["Revenue"].sum()
monthly.plot(kind="line", marker="o", title="Monthly Revenue Trend")
plt.ylabel("Revenue")
plt.tight_layout()
plt.savefig("monthly_revenue.png", dpi=160)
plt.show()

# Amazon_Sales_Analysis
# 🛒 Amazon Sales Data Analysis (SQL + Python)

This project explores and analyzes an Amazon sales dataset using both **SQL** and **Python (Pandas/Seaborn)** to uncover patterns in customer behavior, product performance, order fulfillment, and cancellations.

---

## 📦 Dataset Overview

- **Records:** 121,143 orders
- **Date Range:** March to June 2022
- **Key Columns:** `Order ID`, `Date`, `Status`, `Amount`, `Qty`, `ship_city`, `ship_state`, `Category`, `Fulfilment`, `Courier Status`, `B2B`

---

## 🧹 Data Cleaning Process

Performed using **Pandas** in the `Amazon_sales_Analysis.ipynb` notebook.

### 🔧 Cleaning Steps:
- Filled missing values in critical fields:
  ```python
  df['fulfilled_by'].fillna("others", inplace=True)
  df['currency'].fillna("INR", inplace=True)

### Removed columns with no useful data:
```python
  df.drop(columns=["new", "pendings"], inplace=True)
```

### Removed remaining rows with null values:
```python
  df.dropna(inplace=True)
```

### Converted data types for consistency:
```python
  df['date'] = pd.to_datetime(df['date'])
  df['ship_postal_code'] = df['ship_postal_code'].astype("int64")
```

## 🧠 Feature Engineering (Calculated Columns)
### To enable deeper insights, several new columns were created:
```python
  df["month"] = df['date'].dt.month_name()
  df["year"] = df['date'].dt.year
  df["day"] = df['date'].dt.day_name()
```
###These were used to analyze sales trends over time (monthly, daily) and uncover seasonality in purchase behavior

## ✅ Key Questions & Insights
### 1. 📈 Sales Analysis
- **Total Sales :** ₹78,570,548.25
- **Top State by Revenue:** Maharashtra
- **Top City:** Bengaluru
- **Top Category (Qty):** T-Shirt (45,217 units)
- **Top Category (Amount):** T-Shirt (₹39.2M)

### 2. 🚚 Fulfillment & Logistics
- **Order Status Distribution: Shipped, Cancelled, etc.**
- **Cancellations by Fulfilment Method:**
    - **Amazon:** 5,627
    - **Merchant:** 5,131
 
### 3. 👕 Customer Behavior
- Most popular sizes vary by region (ranked using SQL RANK()).
- Highest order volume in April, especially on Mondays and Wednesdays.

### 4. ❌ Cancellation Insights
- Overall Cancellation Rate: 8.88%
- By Category (Highest):
| Category | Cancellation % |
| -------- | -------------- |
| Socks    | 9.52%          |
| Blazzer  | 9.08%          |
| Shirt    | 8.96%          |



This project provides exploratory data analysis (EDA) on an **Amazon sales dataset** from March to June 2022, containing over 120,000 records. The analysis was conducted using SQL and covers sales performance, customer behavior, order fulfillment, and cancellation trends.

---

## 📁 Dataset Overview

- **Total Records:** 121,143
- **Key Columns:** `Order ID`, `Date`, `Status`, `Category`, `Amount`, `Qty`, `ship_city`, `ship_state`, `Fulfilment`, `Courier Status`, `B2B`, etc.
- **Time Range:** March – June 2022

---

## ✅ Key Questions Answered

### 1. 📈 Sales Analysis
- **Total Sales:** ₹78,570,548.25
- **Top State by Sales:** Maharashtra
- **Top City by Revenue:** Bengaluru
- **Top Categories by Revenue:**
  - T-Shirt – ₹39.19M
  - Shirt – ₹21.29M
  - Blazzer – ₹11.21M
- **Top Categories by Quantity:**
  - T-Shirt – 45,217
  - Shirt – 44,954

---

### 2. 🚚 Order Fulfillment
- **Fulfillment-wise Cancellations:**
  - Amazon: 5,627
  - Merchant: 5,131
- Fulfillment method doesn’t drastically affect cancellation rate.

---

### 3. 👥 Customer Behavior
- **Most Popular Size by State:** Ranked using SQL `RANK()` function.
- **Order Volume by Month:**
  - April had the highest number of orders (46,049).
- **Order Volume by Day:** Peaks identified via grouping.

---

### 4. ❌ Cancellations
- **Overall Cancellation Rate:** 8.88%
- **Cancellation Rate by Category:**
  | Category | Cancelled Orders | Cancellation % |
  |----------|------------------|----------------|
  | Socks    | 40 / 420         | 9.52%          |
  | Blazzer  | 1335 / 14,702    | 9.08%          |
  | Shirt    | 4185 / 46,695    | 8.96%          |
  | T-shirt  | 4202 / 47,038    | 8.93%          |

---

## 🛠 SQL Highlights

Key techniques used:
- Window functions: `RANK() OVER (...)`
- Aggregations: `SUM()`, `COUNT()`, `ROUND()`
- Conditional logic: `CASE WHEN ...`
- Filtering with `WHERE`, `GROUP BY`, and `ORDER BY`

---

# Amazon Sales Dashboard
![1](https://github.com/user-attachments/assets/1a1b9e8c-e44a-4c82-8122-6141f974d5df)
![2](https://github.com/user-attachments/assets/2f1b27e8-7353-4781-8915-e00ea29d9dd9)
![3](https://github.com/user-attachments/assets/f0a88daf-3e1b-4f31-a748-eb5f514f40dc)


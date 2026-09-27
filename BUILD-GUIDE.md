# Power BI build guide

## 1. Import and model

1. Open Power BI Desktop and select **Get data > Text/CSV**.
2. Choose `dataset/ecommerce-sales.csv` and name the query `Sales`.
3. Confirm the data types listed in `power-query/Sales Query.m`.
4. Create the Date table using `measures/Date Table.dax`.
5. Mark `Date[Date]` as the date table and create `Date[Date]` (1) to `Sales[Order Date]` (*) relationship.
6. Create a blank table named `Measures`, then add every measure from `measures/Ecommerce Measures.dax`.
7. Import `theme/ecommerce-dark-theme.json` from **View > Themes > Browse for themes**.

Use a 16:9 canvas. Keep page background `#0B1120`, visual background `#121A2A`, primary accent `#2DD4BF`, sales accent `#38BDF8`, and loss color `#FB7185`.

## 2. Page 1 — Executive Overview

- Cards: Total Sales, Total Profit, Total Orders, Total Customers, Profit Margin.
- Line chart: `Date[Month Year]` on X, `[Total Sales]` on Y.
- Clustered bar chart: `Sales[Category]` and `[Total Sales]`.
- Clustered column chart: `Sales[Region]`, `[Total Sales]`, and `[Total Profit]`.
- Slicers: Date, Region, Segment.
- Tooltip fields: Total Profit, Profit Margin, Total Orders.

## 3. Page 2 — Product Analysis

- Bar chart: `Sales[Product Name]` and `[Total Sales]`. Apply a Top N = 10 filter by Total Sales.
- Matrix: Category > Sub-Category with Total Sales, Total Profit, Profit Margin.
- Scatter chart: Total Sales on X, Total Profit on Y, Product Name in Details, Category in Legend.
- Loss table: Product Name, Total Sales, Total Profit, Profit Margin. Add visual filter `[Total Profit] < 0` and conditional formatting in red.
- Slicers: Category, Sub-Category, Date.

## 4. Page 3 — Customer & Regional Analysis

- Cards: Average Order Value, Total Customers, top region/city visible through charts.
- Bar chart: City and Total Sales. Apply Top N = 10.
- Column chart: Region with Total Sales and Total Profit.
- Customer table: Customer Name, Total Orders, Total Sales, Total Profit, Average Order Value.
- Optional filled map: City/State in Location and Total Sales in Bubble size. Set data categories for City and State first.
- Slicers: Region, State, Segment, Ship Mode, Date.

## 5. Final checks and export

- Verify totals against `project-summary.json` without any slicers selected.
- Check that Month Year sorts chronologically.
- Use **Edit interactions** so slicers filter every relevant visual.
- Add page navigation buttons and a reset-filters bookmark.
- Save as `Ecommerce-Sales-Dashboard.pbix` in the repository root.
- Replace the supplied preview images with screenshots exported from the completed PBIX before publishing your portfolio.


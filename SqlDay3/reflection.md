# Day 03 Reflection

Today I learned how to combine data from multiple tables using JOINs and summarizing data using GROUP BY

- A **INNER JOIN** specifies that you want to combine orders with the users table.
- The **`COUNT(orders.order_id)`** This is an aggregate function. It counts the number of orders.
- The **`GROUP BY username`** It groups all the rows for each `username` together and then performs the `COUNT` on each group.
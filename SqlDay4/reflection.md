# Day 04 Reflection

Today I learned how to combine tables in more advanced ways and how to filter summarized data.

- **`LEFT JOIN`** is different from `INNER JOIN` because it includes all rows from the left table, 
- even if they don't have a match in the right table. It's useful for finding what's missing.
- **`SUM()`** is an aggregate function that calculates the total of a numeric column.
- The **`HAVING`** clause is used to filter data *after* it has been grouped with `GROUP BY`. `WHERE` filters before grouping, 
- and `HAVING` filters after.
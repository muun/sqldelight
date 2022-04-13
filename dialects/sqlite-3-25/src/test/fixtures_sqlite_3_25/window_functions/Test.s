CREATE TABLE ImageTable(
  id INTEGER NOT NULL,
  Size INTEGER NOT NULL
);

SELECT *
FROM (
  SELECT id, SUM(Size) OVER (ORDER BY id ROWS UNBOUNDED PRECEDING) AS RunningTotal
  FROM ImageTable
) AS X
WHERE X.RunningTotal <= ?;
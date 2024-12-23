SELECT
  DATE_TRUNC(t.refresh_date, WEEK) AS Week,  
  t.term AS Top_Term,
  t.rank
FROM
  `bigquery-public-data.google_trends.international_top_rising_terms` t
JOIN
  `bigquery-public-data.google_trends.international_top_terms` i
ON
  t.term = i.term
WHERE
  t.rank IN (1, 2, 3)
  AND t.refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 4 WEEK)
  AND t.region_name = 'England' --region name is wrong 
GROUP BY
  Week, Top_Term, t.rank
ORDER BY
  Week DESC;

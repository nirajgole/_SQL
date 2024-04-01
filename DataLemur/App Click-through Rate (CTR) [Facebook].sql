SELECT
  app_id,
  ROUND(100.0*COUNT(*) FILTER(WHERE event_type='click')/COUNT(*) FILTER(WHERE event_type='impression'),2) as ctr
FROM events
WHERE date_part('year',timestamp)=2022
GROUP BY app_id;
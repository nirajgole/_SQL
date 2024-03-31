SELECT
  COUNT(*) FILTER(WHERE device_type='laptop') AS laptop_views,
  COUNT(*) FILTER(WHERE device_type IN ('tablet','phone')) as mobile_views
FROM viewership;
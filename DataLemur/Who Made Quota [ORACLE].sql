SELECT
  d.employee_id,
  CASE
    WHEN SUM(d.deal_size) >= sq.quota THEN 'yes'
    ELSE 'no'
  END
FROM deals d
JOIN sales_quotas sq ON d.employee_id=sq.employee_id
GROUP BY d.employee_id, sq.quota
ORDER BY d.employee_id
;
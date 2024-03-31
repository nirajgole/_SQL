SELECT sender_id, COUNT(message_id) as message_count
FROM messages
WHERE date_part('year',sent_date::DATE)=2022 and date_part('month',sent_date::DATE)=8
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2
;
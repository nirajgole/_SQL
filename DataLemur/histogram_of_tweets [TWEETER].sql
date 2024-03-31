with cte as(
SELECT count(user_id) as tweet_count_per_user
FROM tweets
WHERE date_part('year', tweet_date)=2022
GROUP BY(user_id)
)

select tweet_count_per_user as tweet_bucket, count(tweet_count_per_user) as users_num from cte
GROUP BY(tweet_count_per_user)
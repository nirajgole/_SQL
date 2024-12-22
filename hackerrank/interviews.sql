with challenges_cte as (
select 
    ch.college_id,
    ch.challenge_id,
    col.contest_id
from challenges ch
inner join colleges col on ch.college_id = col.college_id
),

total_submissions as (
select 
    contest_id,
    sum(total_submissions) as total_submissions,
    sum(total_accepted_submissions) as total_accepted_submissions
from 
    submission_stats st
    inner join challenges_cte cc on st.challenge_id = cc.challenge_id
group by contest_id
),

total_views as (
select 
    contest_id,
    sum(total_unique_views) as total_unique_views,
    sum(total_views) as total_views
from view_stats as vs
    inner join challenges_cte cc on vs.challenge_id = cc.challenge_id
group by contest_id
)

select 
    con.contest_id,
    con.hacker_id, 
    con.name,
    ts.total_submissions, 
    ts.total_accepted_submissions, 
    tv.total_views,
    tv.total_unique_views
from 
    contests con inner join total_views tv on con.contest_id = tv.contest_id
    inner join total_submissions ts on con.contest_id = ts.contest_id
where 
    ts.total_submissions > 0 OR 
    ts.total_accepted_submissions > 0 OR
    tv.total_views > 0 OR
    tv.total_unique_views > 0 
order by contest_id;

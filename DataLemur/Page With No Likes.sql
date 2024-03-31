#1
SELECT page_id
FROM pages
WHERE page_id not in (select page_id from page_likes)
ORDER BY page_id ASC;

#2
SELECT page_id
FROM pages
EXCEPT
SELECT page_id
FROM page_likes;
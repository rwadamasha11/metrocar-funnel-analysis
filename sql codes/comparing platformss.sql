--How many ride requests happened on each platform?


SELECT ad.platform, COUNT (rq.user_id)
FROM app_downloads ad
JOIN signups su
ON su.session_id = ad.app_download_key
JOIN ride_requests rq
ON su.user_id = rq.user_id
GROUP BY 1 


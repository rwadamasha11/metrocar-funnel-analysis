--What is the drop-off from users signing up to users requesting a ride?


WITH t1 AS 
(
SELECT COUNT(user_id) AS su_ 
FROM  signups 
)
, t2 AS 
(
    SELECT COUNT (DISTINCT user_id) AS rq_
    FROM ride_requests
)

SELECT 100 - (CAST(rq_ AS float) / CAST( su_  AS float) * 100)
FROM t1,t2




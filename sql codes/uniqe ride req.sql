--How many rides were requested and how many unique users requested a ride?


SELECT  COUNT (DISTINCT user_id) AS dis_uid, COUNT (ride_id) AS ride_count
FROM ride_requests
--How many rides were requested and completed through the app?


SELECT COUNT (ride_id) AS req , COUNT (dropoff_ts) AS completed
FROM ride_requests;


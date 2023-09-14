--What is the average time of a ride from pick up to drop off?


SELECT AVG (dropoff_ts - pickup_ts ) AS avg_timeride
FROM ride_requests
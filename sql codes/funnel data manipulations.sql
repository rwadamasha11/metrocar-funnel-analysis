WITH step1 AS 
(
  SELECT COUNT (app_download_key) AS s1
  FROM app_downloads
  )
  ,step2 AS 
  (
    SELECT COUNT (DISTINCT user_id) AS s2
    FROM signups
    )
   , step3 AS 
   (
    SELECT COUNT (DISTINCT user_id) AS s3
    FROM ride_requests
    )
    
   , step4 AS 
   (
      SELECT COUNT (DISTINCT user_id) AS s4
    FROM ride_requests
     WHERE dropoff_ts IS NOT NULL
     )
     
     ,totals AS(
       SELECT s1,s2,S3,s4
       FROM step1,step2,step3,step4
      )
      ,funnel AS 
      (
      SELECT 1 AS funnel_steps,
      'downloads' AS funnel_name,
      s1 AS value 
      FROM totals
      
      UNION 
      
      SELECT 2 AS funnel_steps,
      'signups' AS funnel_name,
      s2 AS value 
      FROM totals
      
      UNION
      
      SELECT 3 AS funnel_steps,
      'ride_req' AS funnel_name,
      s3 AS value 
      FROM totals
      
      UNION
      
      SELECT 4 AS funnel_steps,
      'ride_req_com' AS funnel_name,
      s4 AS value 
      FROM totals
        )
        
        SELECT * , CAST (value AS FLOAT) / lag(value) OVER (ORDER BY funnel) *100  AS pre_stage
        FROM funnel
        ORDER BY funnel_steps
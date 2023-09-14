--How many rides did we successfully collect payments and how much was collected?


SELECT COUNT (transaction_id) , SUM (purchase_amount_usd)
FROM transactions 
WHERE charge_status = 'Approved'



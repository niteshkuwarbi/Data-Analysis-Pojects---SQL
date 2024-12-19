show databases;

CREATE DATABASE IF NOT EXISTS RAZOR_PAY;

USE RAZOR_PAY;

SELECT * FROM PO_BATCHES;
	
	-- Q1: Total number of unique batches in the dataset
    
SELECT count(DISTINCT BatchNumber) FROM po_batches;
	
    -- Q2: Total number of unique batches for "Purchase Order #1075875"

SELECT COUNT(DISTINCT BatchNumber) 
FROM po_batches
WHERE PurchaseOrder = 'Purchase Order #1075875';

	-- Q3: Total number of unique Purchase Orders (POs) with more than 4 unique batches
    
SELECT COUNT(DISTINCT PurchaseOrder) 
FROM (
	SELECT PurchaseOrder
    FROM po_batches
    GROUP BY PurchaseOrder
    HAVING COUNT(DISTINCT BatchNumber) > 4
) AS filtered_orders;

	-- Q4: Difference in days between the maximum and minimum Production Ready Date (PRD) for Purchase Order #1075875

SELECT DATEDIFF(
	(SELECT MAX(ProductionReadyDate) 
		FROM po_batches 
		WHERE PurchaseOrder = 'Purchase Order #1075875'), 
	(SELECT MIN(ProductionReadyDate) 
		FROM po_batches 
		WHERE PurchaseOrder = 'Purchase Order #1075875')
	) AS prd_date_diff;
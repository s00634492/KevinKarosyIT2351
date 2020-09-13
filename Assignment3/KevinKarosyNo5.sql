SELECT COUNT(*) AS "Total Orders",
	SUM(ship_amount) AS "Ship Value"
FROM orders;
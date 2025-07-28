SELECT 
    o.date AS sale_date, 
    SUM(p.price * od.quantity) AS daily_sales,
    SUM(od.quantity) AS sold_quantity
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN pizzas p ON p.pizza_id = od.pizza_id
GROUP BY sale_date
ORDER BY sale_date;
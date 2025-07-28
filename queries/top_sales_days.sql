SELECT 
    o.date, 
    SUM(p.price * od.quantity) AS total_sales
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN pizzas p ON p.pizza_id = od.pizza_id
GROUP BY o.date
ORDER BY total_sales DESC
LIMIT 5;
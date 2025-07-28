SELECT 
    SUM(p.price * od.quantity) AS total_sales,
    SUM(od.quantity) AS total_pizzas_sold,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN pizzas p ON p.pizza_id = od.pizza_id;
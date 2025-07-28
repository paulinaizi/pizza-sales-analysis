SELECT 
    c.name AS category, 
    SUM(od.quantity) AS sold_quantity,
    ROUND(100 * SUM(od.quantity) / SUM(SUM(od.quantity)) OVER (), 1) AS percent_share
FROM order_details od
JOIN pizzas p ON p.pizza_id = od.pizza_id
JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
JOIN categories c ON pt.category_id = c.category_id
GROUP BY c.name
ORDER BY sold_quantity DESC;
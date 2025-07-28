SELECT 
    pt.name AS pizza_name,
    c.name AS category,
    SUM(od.quantity) AS sold_quantity
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
JOIN categories c ON pt.category_id = c.category_id
GROUP BY pt.pizza_type_id, pt.name, c.name
ORDER BY SUM(od.quantity) DESC
LIMIT 3;

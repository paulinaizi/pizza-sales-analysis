SELECT 
    p.pizza_id,
    pt.name AS pizza_name, 
    c.name As category, 
    p.size, p.price, 
    SUM(od.quantity) AS sold_quantity
FROM order_details od
JOIN pizzas p on p.pizza_id = od.pizza_id
JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
JOIN categories c ON pt.category_id = c.category_id
GROUP BY p.pizza_id, pt.name, c.name, p.size, p.price
ORDER BY SUM(od.quantity) DESC
LIMIT 3; 
# Display the name of the customers that belong to the "Farmàcia" category.
# Sort your results ordered by name (ascending or descending).
SELECT name FROM customer WHERE category_id in (
Select id FROM category WHERE name = "Farmàcia");

#Display a list with the categories (name) and its parent category (name),
#where the parent category is "Tecnologia" or "Llibreria".


#Select the name and distance between customers and offices, where the
#office is identified with "10" and the distance is greater than 1000. Sort results by
#distance in ascending order.


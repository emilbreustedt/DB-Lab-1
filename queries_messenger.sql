USE messengers;

# 1) (5 points) Display the name of the customers that belong to the "Farmàcia" category.
# Sort your results ordered by name (ascending or descending).

SELECT name FROM customer WHERE category_id IN (
SELECT id FROM category WHERE name = "Farmàcia");

#2) (5 points) Display a list with the categories (name) and its parent category (name),
#where the parent category is "Tecnologia" or "Llibreria".

SELECT parent.name AS parent_name, child.name AS child_name
FROM category child
   JOIN category parent
    ON parent.id = child.parent_category_id 
    AND parent.id IN
(SELECT id FROM category WHERE name IN ("Tecnologia", "Llibreria"));

#3) (5 points) Select the name and distance between customers and offices, where the
#office is identified with "10" and the distance is greater than 1000. Sort results by
#distance in ascending order.

SELECT c.name, s.distance FROM customer c, office o, serve s
WHERE c.id = s.customer_id AND o.id = s.office_id AND s.distance > 1000 AND o.id = 10
ORDER BY s.distance ASC;

# 4) (5 points) Select the name of the types of vehicles existing in the database and indicate
# how many vehicles of each type there are. Sort results by number of vehicles in
# descending order.

SELECT t.name, (SELECT count(*) AS num FROM vehicle v WHERE t.id = v.type_id)
FROM type t ORDER BY (SELECT count(*) AS num FROM vehicle v WHERE t.id = v.type_id) DESC;

# 5) (5 points) Select the customers that can be delivered by the driver identified with the
# code "10".

SELECT name FROM customer WHERE id IN 
(SELECT customer_id FROM serve where office_id = 
(SELECT office_id FROM driver WHERE id = 10));

# 6) (5 points) Display the identifier and the address of the office closest to a customer with
# "Restaurant" as a name. Also display what is the distance between them.

SELECT o.id, o.adress, s.distance
FROM office o, serve s 
WHERE o.id = s.office_id AND s.customer_id IN 
(SELECT id FROM customer WHERE category_id IN 
(SELECT id FROM category WHERE name = "Restaurant"))
ORDER BY s.distance LIMIT 1;

# 7) (10 points) Display a list of drivers that can drive more than 3 types of vehicles. The list
# must contain the identifier of the driver, the name and the number of types of vehicles
# (that the driver can drive).

SELECT driver_id, name, count(type_id) as number_of_types FROM driver dr JOIN drive de ON dr.id = de.driver_id
GROUP BY driver_id, name
HAVING count(type_id) > 3;

# 8) (10 points) Display a list with the name, latitude and longitude of the customers that
# have a office with a 2-wheeled vehicle assigned but none of 6 wheels. Also include the
# name of the corresponding vehicle type and remove the duplicates. Sort the result
# ordered by the office name (ascending or descending).

SELECT DISTINCT c.name, c.latitude, c.longitude, t.name FROM customer c JOIN serve s JOIN have h JOIN vehicle v JOIN type t
ON c.id = s.customer_id AND s.office_id = h.office_id AND h.vehicle_id = v.id AND v.type_id = t.id
AND t.number_of_wheels = 2 AND t.number_of_wheels != 6
GROUP BY c.id, t.id
ORDER BY c.name; # assuming this was customer name since office name doesn't exist ?

# 9) (10 points) Select the model and brand of all vehicles that can be driven by drivers with
# less than 3 years of experience. In addition, vehicles that can be driven by drivers with
# more than 9 years of experience, must be displayed in uppercase (brand and model).
# The result will not contain repeated elements unless they are in both groups.
 
SELECT brand, model FROM vehicle v JOIN drive d
ON v.type_id = d.type_id
WHERE experience < 3
UNION 
SELECT UPPER(brand), UPPER(model) FROM vehicle v JOIN drive d
ON v.type_id = d.type_id
WHERE experience > 9;

# 10) (10 points) Select the category (name) and the customer (name) categorized by
# "Dentista" or "Farmàcia", which can provide a Mitsubishi or Volkswagen (brand),
# including the number wheels. Display the non-repetitions list and sorted first
# alphabetically and ascending order by the category (name) of the customer. Second, by
# the number of wheels in descending order. Then, sorted by the name of the customer in
# ascending order. And finally, by the type of vehicle also in ascending order.

SELECT DISTINCT ca.name as cat_name, cu.name as cust_name, t.number_of_wheels, t.name FROM category ca JOIN customer cu JOIN serve s JOIN have h JOIN vehicle v JOIN type t
ON ca.id = cu.category_id AND cu.id = s.customer_id AND s.office_id = h.office_id AND h.vehicle_id = v.id AND v.type_id = t.id
WHERE ca.name in ("Dentista", "Farmàcia") AND v.brand in ("Mitsubishi", "Volkswagen")
ORDER BY ca.name asc, t.number_of_wheels DESC, cu.name ASC, t.name ASC;

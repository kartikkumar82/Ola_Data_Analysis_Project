CREATE TABLE olaa(
		Date DATE,
		Time TIME,
		Booking_ID VARCHAR(20),
		Booking_Status VARCHAR(30),
		Customer_ID VARCHAR(20),
		Vehicle_Type VARCHAR(20),
		Pickup_Location VARCHAR(25),
		Drop_Location VARCHAR(25),
		V_TAT INT,
		C_TAT INT, 
		Canceled_Rides_by_Customer VARCHAR(50),
		Canceled_Rides_by_Driver VARCHAR(70),
		Incomplete_Rides VARCHAR(10),
		Incomplete_Rides_Reason VARCHAR(70),
		Booking_Value INT,
		Payment_Method VARCHAR(20),
		Ride_Distance INT,
		Driver_Ratings FLOAT,
		Customer_Rating FLOAT
);

SELECT * FROM olaa



-- Questions--------------



-- 1. Retrieve all successful bookings:

SELECT
	*
FROM olaa
WHERE booking_status = 'Success';


-- 2. Find the average ride distance for each vehicle type:

SELECT 	
	AVG(ride_distance) as avg_ride_distance
FROM olaa;


-- 3. Get the total number of cancelled rides by customers:

SELECT 	
	COUNT(canceled_rides_by_customer)
FROM olaa
WHERE 
	canceled_rides_by_customer <> 'null';


-- 4. List the top 5 customers who booked the highest number of rides:

SELECT
	customer_id,
	COUNT(booking_id) AS booking_count
FROM olaa
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

SELECT 
	canceled_rides_by_driver,
	COUNT(canceled_rides_by_driver) as canell_ride_count
FROM olaa
WHERE 
	canceled_rides_by_driver = 'Personal & Car related issue'
GROUP BY 1;




-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

SELECT 
	vehicle_type,
	MAX(driver_ratings) AS max_driver_rating,
	MIN(driver_ratings) AS min_driver_rating
FROM olaa
WHERE vehicle_type = 'Prime Sedan'
GROUP BY 1;



-- 7. Retrieve all rides where payment was made using UPI:

SELECT 
	*
FROM olaa
WHERE payment_method = 'UPI'


-- 8. Find the average customer rating per vehicle type:

SELECT
	vehicle_type,
	AVG(customer_rating) AS average_rating
FROM olaa
GROUP BY 1;


-- 9. Calculate the total booking value of rides completed successfully:

SELECT 
	SUM(booking_value) AS total_booking 
FROM olaa
WHERE booking_status = 'Success';



-- 10. List all incomplete rides along with the reason:

SELECT
	vehicle_type,
	incomplete_rides_reason
FROM olaa
WHERE incomplete_rides = 'Yes';
-- Route Revenue Performance --

SELECT 
    r.origin, 
    r.destination, 
    SUM(b.price * b.passenger_count) AS Total_Revenue,
    SUM(b.passenger_count) AS Total_Passengers
FROM my_bookings b
JOIN flights f ON b.flight_id = f.flight_id
JOIN routes r ON f.route_id = r.route_id
GROUP BY r.origin, r.destination
ORDER BY Total_Revenue DESC;

--  Load Factor (Critical Airline KPI) --
SELECT 
    f.flight_id, 
    f.flight_date,
    f.capacity,
    SUM(b.passenger_count) AS Booked_Seats,
    CAST(SUM(b.passenger_count) AS FLOAT) / f.capacity * 100 AS Load_Factor_Percentage
FROM flights f
LEFT JOIN my_bookings b ON f.flight_id = b.flight_id
GROUP BY f.flight_id, f.flight_date, f.capacity;

-- RASK (Revenue per Available Seat Kilometer) --
SELECT 
    r.route_id,
    r.origin,
    r.destination,
    SUM(CAST(b.price AS FLOAT) * b.passenger_count) / 
    NULLIF(SUM(CAST(f.capacity AS FLOAT) * f.distance_km), 0) AS RASK
FROM flights f
JOIN routes r ON f.route_id = r.route_id
JOIN my_bookings b ON f.flight_id = b.flight_id
GROUP BY r.route_id, r.origin, r.destination;


-- Booking Curve (Advance Purchase Behavior) --

SELECT 
    DATEDIFF(day, b.booking_date, b.travel_date) AS Days_Advance_Purchase,
    COUNT(b.booking_id) AS Number_of_Bookings,
    SUM(b.passenger_count) AS Total_Passengers
FROM my_bookings b
WHERE b.travel_date >= b.booking_date
GROUP BY DATEDIFF(day, b.booking_date, b.travel_date)
ORDER BY Days_Advance_Purchase DESC;

-- Cabin & Fare Class Mix --
SELECT 
    cabin, 
    fare_class, 
    SUM(price * passenger_count) AS Revenue,
    SUM(passenger_count) AS Passengers,
    AVG(price) AS Avg_Fare
FROM my_bookings
GROUP BY cabin, fare_class
ORDER BY cabin, Revenue DESC;

-- Revenue by POS (Point of Sale) Country --
SELECT 
    pos_country, 
    SUM(price * passenger_count) AS Total_Revenue,
    COUNT(booking_id) AS Booking_Count
FROM my_bookings
GROUP BY pos_country
ORDER BY Total_Revenue DESC;

-- Sales Channel Effectiveness --
SELECT 
    sales_channel, 
    SUM(price * passenger_count) AS Total_Revenue,
    SUM(passenger_count) AS Total_Passengers,
    AVG(price) AS Yield_Per_Passenger
FROM my_bookings
GROUP BY sales_channel
ORDER BY Total_Revenue DESC;

-- Revenue Before vs After RM Actions --
WITH FlightActionStatus AS (
    SELECT 
        f.flight_id,
        f.route_id,
        f.flight_date,
        CASE WHEN rm.action_id IS NOT NULL THEN 'During Action' ELSE 'No Action' END AS RM_Status,
        SUM(b.price * b.passenger_count) AS Flight_Revenue
    FROM flights f
    LEFT JOIN revenue_management_actions rm ON f.route_id = rm.route_id 
        AND f.flight_date BETWEEN rm.start_date AND rm.end_date
    JOIN my_bookings b ON f.flight_id = b.flight_id
    GROUP BY f.flight_id, f.route_id, f.flight_date, rm.action_id
)
SELECT 
    route_id,
    RM_Status,
    AVG(Flight_Revenue) AS Avg_Revenue_Per_Flight,
    SUM(Flight_Revenue) AS Total_Revenue
FROM FlightActionStatus
GROUP BY route_id, RM_Status;

-- Competitive Fare Benchmark -- 
SELECT 
    r.route_id,
    r.origin,
    r.destination,
    AVG(b.price) AS My_Avg_Fare,
    c.competitor,
    c.avg_competitor_fare,
    (AVG(b.price) - c.avg_competitor_fare) AS Fare_Difference
FROM routes r
JOIN flights f ON r.route_id = f.route_id
JOIN my_bookings b ON f.flight_id = b.flight_id
JOIN competition c ON r.route_id = c.route_id
GROUP BY r.route_id, r.origin, r.destination, c.competitor, c.avg_competitor_fare;
CREATE EVENT delete_activity_from_database
ON SCHEDULE EVERY 1 minute 
            STARTS current_time() + INTERVAL 1 minute
DO
    DELETE 
    FROM activity
    WHERE start_time < CURRENT_DATE;
-- Create the database
CREATE DATABASE releves_db;

-- Connect to the new database
\c releves_db;

-- Create the releves table
CREATE TABLE releves (
    id SERIAL PRIMARY KEY,
    value NUMERIC,
    type VARCHAR(50),
    date TIMESTAMP
);

-- Generate 100 rows with random values
DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO releves (value, type, date)
        VALUES (
            ROUND((RANDOM() * 1000)::NUMERIC, 2),  -- Random value between 0 and 1000
            CASE WHEN RANDOM() > 0.5 THEN 'A' ELSE 'B' END,  -- Random 'A' or 'B' for type
            NOW() - INTERVAL '1 day' * (RANDOM() * 365)  -- Random date within the last year
        );
    END LOOP;
END $$;

-- Check the inserted data
SELECT * FROM releves;
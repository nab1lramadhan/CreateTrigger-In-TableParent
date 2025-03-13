-- Create an insert history table (i_customers) for the main (customers)
-- Make sure that all the coloumn, according to the number in the main table (customers)

CREATE TABLE i_customers (
	history_id INT IDENTITY (1,1) PRIMARY KEY,              -- New coloumn for history tables (i_customers), so that each incoming row is automatically recorded with a unique number
	customer_id INT,                                        -- Coloumn from the main table (customers)
	FOREIGN KEY (customer_id)                    
  REFERENCES customers (customer_id) ON DELETE CASCADE,   -- Delete data in a reference table if data in a primary table is deleted
  
	nama_customer VARCHAR (50),                             -- Coloumn from the main table (customers)
	tanggal_lahir DATE,                                     -- Coloumn from the main table (customers)
	provinsi_alamat CHAR (40),                              -- Coloumn from the main table (customers)
	jenis_kelamin CHAR (1),	                                -- Coloumn from the main table (customers)
	status_nikah CHAR (1),                                  -- Coloumn from the main table (customers)
	gaji INT,                                               -- Coloumn from the main table (customers)
	status CHAR (1),                                        -- As a sign that the data was successfully inserted
	waktu_insert DATETIME                                   -- Recording time, at the time of data in the insert
  );


-- Create a trigger with the name (after_insert_customers) for the main table (customers)
CREATE TRIGGER after_insert_customers ON customers
AFTER INSERT  -- Process data that has just been inserted from the main table (customers)
AS
BEGIN
--  
INSERT INTO	i_customers (
	customer_id,
	nama_customer,
	tanggal_lahir,
	provinsi_alamat,
	jenis_kelamin,
	status_nikah,
	gaji,
	status,
	waktu_insert)

SELECT 
	customer_id,
	nama_customer,
	tanggal_lahir,
	provinsi_alamat,
	jenis_kelamin,
	status_nikah,
	gaji,
	'A',
	getdate ()
FROM
	inserted
END

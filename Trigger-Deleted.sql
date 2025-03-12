-- For the history table, from the main table
-- Make sure the number of main columns of the main table matches

CREATE TABLE d_customers (
	history_id INT IDENTITY (1,1) PRIMARY KEY,                      -- Gives a unique number, for each new row that increments itself, after executing the
	customer_id INT                                                 -- Coloumn From Table Main
	FOREIGN KEY (customer_id) 
	REFERENCES customers (customer_id) ON DELETE CASCADE,   	-- Automatically delete related data in other tables when data in the main (customers) table is deleted
  
	nama_customer CHAR (50),                                        -- Coloumn From Table Main
	tanggal_lahir DATE,                                             -- Coloumn From Table Main
	provinsi_alamat VARCHAR (30),                                   -- Coloumn From Table Main
	jenis_kelamin CHAR (1),                                         -- Coloumn From Table Main
	status_nikah CHAR (1),                                          -- Coloumn From Table Main
	gaji INT,                                                       -- Coloumn From Table Main
	status CHAR (1),                                                -- New Coloumn, Gives a status of "D" which means it has been deleted
	waktu_deleted DATETIME)                                         -- New Coloumn, To know when a delete occurred
  );


-- Create a trigger, named (deleted_customers) for the main table (customers)
CREATE TRIGGER deleted_customers ON customers 
AFTER DELETE  -- Processing deleted data
AS
BEGIN
	-- Which will save the history, if there is a delete in the main table (customers)
	INSERT INTO d_customers (     
		customer_id,            
		nama_customer,         
		tanggal_lahir,         
		provinsi_alamat,      
		jenis_kelamin,         
		status_nikah,           
		gaji,                   
		status,                 	--Coloumn gives the status, that it has been deleted
		waktu_deleted           	--Coloumn for the time at the time of deletion
	)


  
	-- Retrieve deleted data from the main table (customers) and enter it into the history table (d_customers)
	SELECT
		customer_id,
		nama_customer,
		tanggal_lahir,
		provinsi_alamat,
		jenis_kelamin,
		status_nikah,
		gaji,
		'D',                   -- Indicates that the customer has been deleted (D)
		GETDATE()              -- Instant retrieved deletion time
	FROM deleted             
	print 'Deleted data is stored in Table d_customers' 	-- Gives a message that the data has been deleted, and the history is in the d_customers table
END

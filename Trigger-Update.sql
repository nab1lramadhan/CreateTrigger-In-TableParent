--Create a history table (u_customers) for the main table (customers)
--I only cursed a few columns from the main table, because that was all it took

CREATE TABLE u_customers (
    history_id INT IDENTITY (1,1) PRIMARY KEY,                  -- Provides a unique number, for each new line when updated
    customer_id INT,                                            -- Coloumn from the main table 
    FOREIGN KEY (customer_id) 
    REFERENCES customers (customer_id) ON UPDATE CASCADE,       --Update related data in another table when the data in the main table is updated
  
    nama_lama VARCHAR (50),                                     -- Coloumn from the main table   (Old Coloumn)
    nama_baru VARCHAR (50),                                     -- Coloumn From u_customers	 (New Coloumn)              
  
    provinsi_lama VARCHAR (50),                                 -- Coloumn from the main table   (Old Coloumn)
    provinsi_baru VARCHAR (50),                                 -- Coloumn from u_customers	 (New Coloumn)                 
  
    status CHAR (1),                                            -- To give a status that the data has been updated                                     
    waktu_update DATETIME                                       -- Records the time, at the time of the update
);


-- Create triggers with update_customers name for the main table (customers)
CREATE TRIGGER update_customers ON customers
AFTER UPDATE	-- Keep a record of updates
AS
BEGIN
	
-- Which will save the history, if there is an update in the main table (customers)
INSERT INTO u_customers (
	customer_id,
	nama_lama,
	nama_baru,
	provinsi_lama,
	provinsi_baru,
	status,			-- Saves status, which means the data is updated successfully
	waktu_update		-- Record the time of updates in the main table (customers)
	);

SELECT
	d.customer_id,
	d.nama_customer as nama_lama,		-- Given an alias, so that it is marked that this (Old coloumn)
	i.nama_customer as nama_baru,		-- Given an alias, so that it is marked that this (New coloumn)
	
	d.provinsi_alamat as provinsi_lama,	-- Given an alias, so that it is marked that this (Old coloumn)
	i.provinsi_alamat as provinsi_baru,     -- Given an alias, so that it is marked that this (New coloumn)
	
	'U',					-- Marked with a "U" means successfully updated
	getdate ()				-- Record the time of updates in the main table (customers)
from
	deleted as d
inner join
	inserted as i
on
	d.customer_id = i.customer_id

end

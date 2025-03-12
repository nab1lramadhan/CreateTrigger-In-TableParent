--For the history table, from the main table
CREATE TABLE d_customers (
	history_id INT IDENTITY (1,1) PRIMARY KEY,                      --New Coloumn
	customer_id INT                                                 --Coloumn From Table Main
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id),   --Make a reference to the main table (customers)
  
	nama_customer CHAR (50),                                        --Coloumn From Table Main
	tanggal_lahir DATE,                                             --Coloumn From Table Main
	provinsi_alamat VARCHAR (30),                                   --Coloumn From Table Main
	jenis_kelamin CHAR (1),                                         --Coloumn From Table Main
	status_nikah CHAR (1),                                          --Coloumn From Table Main
	gaji INT,                                                       --Coloumn From Table Main
	status CHAR (1),                                                --New Coloumn
	waktu_deleted DATETIME)                                         --New Coloumn
  );


--Main table (customers), which will be created to have a history in the d_customers table
CREATE TRIGGER d_customers ON customers 
AFTER DELETE  
AS
BEGIN

  --Which will save the history, if there is a delete in the main table (customers)
	INSERT INTO d_customers (     
		customer_id,            
		nama_customer,         
		tanggal_lahir,         
		provinsi_alamat,      
		jenis_kelamin,         
		status_nikah,           
		gaji,                   
		status,                 -- Status penghapusan ('D' untuk Deleted)
		waktu_deleted           -- Waktu penghapusan
	);
  
	-- Mengambil data yang dihapus dari tabel 'customers' dan memasukkannya ke Riwayat_Deleted_Customers
	SELECT
		customer_id,
		nama_customer,
		tanggal_lahir,
		provinsi_alamat,
		jenis_kelamin,
		status_nikah,
		gaji,
		'D',                   -- Menandakan bahwa pelanggan sudah dihapus (D)
		GETDATE()              -- Waktu penghapusan yang diambil langsung
	FROM deleted             
	print 'Data Yang Dihapus Disimpan Di Table Riwayat_Deleted_Customers' -- Memberikan pesan bahwa data telah disalin
END

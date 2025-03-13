# CreateTrigger-In-TableParent-SQL Server 18

This trigger is used to track changes and maintain a history of data modifications in the Parent table
There are various needs, which I have usually for needs:

- Insert
- Update
- Deleted
  
It will record every action from the main table (customers) in its history table (trigger) 

Make sure to update and delete the history table, the Coloumn corresponds to the main Coloumn 
In the update and deleted tables, I only added 3 coloumns:

- history_id
- status
- waktu_insert/update/deleted

Used to ensure that the data in the history table is organized, this is the explanation 

-> history_id:
   So that each row that enters the history table has a unique number and automatically fills in itself

-> status:
   To ensure that the data that is being executed in the main table has indeed been successful and recorded in the history 
   table then marked according to the history table

-> waktu_insert/update/deleted:
   To record when an execution occurred from the main table and recorded its time in the history table


That's all my explanation, for more details I have given the explanation,
in each trigger update, insert and deleted file


Thank you.. 
- Muhammad Nabil Ramadhan
- muh.nabilramadhannn@gmail.com

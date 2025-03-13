# CreateTrigger-In-TableParent-SQL Server 18

This trigger is used to track changes and maintain a history of data modifications in the Parent table.
There are three common operations that I usually handle:

Insert

Update

Delete


It will record every action from the main table (customers) into its history tables (trigger-based logging).

Important Notes:

Make sure that in the update and delete history tables, the columns correspond to the main table columns.
For the update and delete triggers, I added 3 additional columns:

1. history_id
Each row in the history table gets a unique ID, which is automatically generated.


2. status
Used to indicate the action taken:

"A" = Added (Insert)

"U" = Updated

"D" = Deleted
This ensures that the data in the history table reflects the type of modification in the main table.



3. waktu_insert / waktu_update / waktu_deleted
Records when the action happened.
This helps track changes over time, giving visibility into data modifications.




---

Purpose

This trigger setup helps maintain data integrity and provides a clear audit trail for each data modification in the customers table.

For more detailed explanations, check the comments in each trigger file:

insert trigger

update trigger

delete trigger



---

Thanks!
Muhammad Nabil Ramadhan
muh.nabilramadhannn@gmail.com

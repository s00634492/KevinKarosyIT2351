# Executive Summary
In this assignment, we discuss the responsibilities of database administrators, including the purposes of various log files, status variables, system variables, user accounts, privileges, and roles. In addition, we will also explore some SQL code that creates users, grants privileges, and assigns roles.

# Database Administrator Responsibilities
Many users will use the SQL database to run queries and to access or add data to it, and it is the job of the database administrators to make sure that they can achieve those tasks. Their responsibilities toward the databases include their design, creation, security, backups, restoration, migration, replication, monitoring, software updating, optimization, as well as management of their associated log files and user accounts. Some administrative teams may divide these tasks amongst them, and some administrators may specialize in particular tasks, such as database design or monitoring.

# Log Files
Log files are written by the database server to record events and activities that are taking place, which is useful for the administrators for monitoring and troubleshooting purposes. General Log files record client connections and SQL statements that are received from those clients. Error Logs record messages related to the startup and shutdown of the server, and any errors that may have occurred. Slow Query Logs list queries that take a long time to execute, which can be useful for identifying queries that need to be rewritten and optimized. Binary Logs keep records of all changes that are made to the database, and they’re used during the database restoration and replication processes. Finally, Relay Logs are used during replication to allow slave servers to relay changes to the master server.

# Variables
Status Variables are values that tell you statistics about the database server’s operation and performance. For example, there are status variables that tell you how many connection attempts have been made and how many of those attempts aborted with errors. System Variables are values for the configuration of the database server. For example, there are values to view and change where the various log files are stored, the maximum number of connections that can be made simultaneously, and whether table names are case sensitive or not.

# Privileges
For task A, we will explain the function of the SQL code that follows this paragraph. Line 1 and 2 create new user accounts “guitar_admin” and “guitar_user”, who both can only connect from the local server (@localhost) and who both must use the password “pa55word” for authentication. Line 4 starts a GRANT statement which is used to adjust privileges for users. In this case, the statement grants “ALL” privileges to the “guitar_admin” user account when they are interacting with the “guitar” database. The ALL keyword includes privileges to select, insert, update, delete, and create and drop tables, views, triggers, events, and more. The asterisk after the database name (guitar) indicates that the statement is referring to all of the tables within the guitar database. Line 8 begins a new GRANT statement that is quite similar. However, here we are adjusting the privileges for the “guitar_user” user account, and we are applying four specific privileges (select, insert, update, and delete).
```SQL
 1   CREATE USER guitar_admin@localhost IDENTIFIED BY 'pa55word';
 2   CREATE USER guitar_user@localhost IDENTIFIED BY 'pa55word';
 3
 4   GRANT ALL
 5   ON guitar.*
 6   TO guitar_admin@localhost;
 7
 8   GRANT SELECT, INSERT, UPDATE, DELETE
 9   ON guitar.*
10   TO guitar_user@localhost;
```
Regarding task B, there are four privileges levels for user accounts: Global, Database, Table, and Column. The Global privilege level grants access to all databases. The Database privilege level grants access to a specific database, and all tables within it. The Table privilege level grants access to a specific table, and all columns within it. Finally, the Column privilege level grants access to only specific columns of a table.
For task C, if we wanted to change the GRANT statement on line 8 to grant column privileges, we would list the column names in parentheses after each privilege, and specify the table name instead of the asterisk on line 9. For example, the following code would grant privileges for only three specific columns of the customers table.
```SQL
 8   GRANT
 9       SELECT (first_name, last_name, email_address),
10       INSERT (first_name, last_name, email_address),
11       UPDATE (first_name, last_name, email_address),
12       DELETE (first_name, last_name, email_address)
13   ON guitar.customers
14   TO guitar_user@localhost;
```
Regarding task D, it’s wise to limit the privileges of users to only what is necessary for them. To clarify, you shouldn’t give users more privileges than they need to do their job. If users have more privileges, there is a possibility for them to affect columns, tables, or databases that they should not be tampering with. You may want to restrict access to confidential information, prevent users from deleting or altering database infrastructure, and prevent users from being able to change their own privileges or the privileges of others.

# Roles
For task A, the code below creates a role to provide update privileges to the categories table. The code is actually similar to how users are granted privileges, except that we’re granting them to the role instead of to the user. We can then grant/revoke the role to/from users.
```SQL
1   CREATE ROLE categories_update;
2   GRANT UPDATE ON guitar.categories TO categories_update;
```
For task B, we can assign the role to users as if it were a privilege. We can then use the SET DEFAULT ROLE command to specify the roles that are active for that user when they connect to the server. The code below shows an example of how this can be done.
```SQL
1   GRANT categories_update TO kevin@localhost;
2   SET DEFAULT ROLE categories_update TO kevin@localhost;
```
Regarding task C, roles are very useful for creating templates of privileges. You can bundle privileges together into combinations that are logical for your situation, and you can then easily grant and revoke the role to users instead of having to list out the intricate privileges manually. Roles are also useful for modifying the privileges of a large number of users from one location. By modifying the role, all of the users that have been granted that role are affected, instead of having to modify the privileges of each of those users manually.

# Conclusion
I enjoyed this week’s assignment, and I think that the database administration tasks are among my favorite topics that were discussed in this class. I think all of the technologies that were discussed in this week’s chapters were very well-implemented, straightforward, and easy to use. I like that accessing status and system variables is similar to how data is accessed in databases. And I like that roles are assigned privileges as if they were users, and that roles are assigned to users as if they were privileges (that sounds much more confusing than it really is).

Upon entering this class, I didn’t know much about SQL or databases. But upon exiting the class, I now consider databases to be yet another very interesting part of information technology that I enjoy exploring. I really appreciate this class and this textbook for introducing this material so well, thank you very much.

# Executive Summary

In this assignment we run some simple queries in Workbench and take screenshots of our results. We then create an Assignment1 folder in our GitHub repository and upload the screenshots into that folder. The assignment introduces us to Workbench, SQL, and GitHub all at the same time.

# MySQL Workbench

I have never used MySQL before, so this entire class will be all new content for me. I had some issues installing MySQL Workbench, but I was able to resolve them with a bit of research. To elaborate, the installation process encountered an error while trying to automatically install a required component (Visual Studio C++). The error was "0x800700e8 The pipe is being closed." I searched online for this error and I found a forum where a Microsoft moderator said that the error could be caused by corrupted system files, and gave some instructions to repair the files. Following along, I opened command prompt in administrator mode, ran the DISM tool, ran an SFC scan, restarted my computer, tried again to install MySQL, and it was successful this time.

Also, during installation I chose to untick the checkbox that would start the server automatically when my computer starts, because I would rather control this operation manually here on my personal computer. To familiarize myself with this, I located instructions in Murach Chapter 2 to manually start and stop the server from inside Workbench using the Server > Startup/Shutdown drop down menu.

# Queries

I've never used SQL before, but I've always been interested to learn. So far the instructions have been very clear and helpful, so I'm enjoying the experience.

In this assignment I created a query to see all columns from the customers table using the keywords SELECT and FROM. In another query, I used the SELECT statement to target specific columns, and the WHERE statement to append a condition. In this case, it resulted in showing only the records that had a unit_price value greater than 16.

# Conclusion

This assignment introduced a lot of new stuff all at the same time, such as MySQL Workbench, SQL queries, and GitHub. Being unfamiliar with all of these felt a bit overwealming at times, but I appreciate the introductory simplicity of this first assignment to allow me to familiarize myself. GitHub is still a bit confusing to me, but I think some practice using it will definitely help. I look forward to learning more SQL!

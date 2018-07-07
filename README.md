## Filename: Online Bookstore
---
### Author: Hongxiang Wang (whx0509@gmail.com or hongxiang_wang@126.com)
---
### Version: 1.0
---
### Language: Java, JavaScript
---
### Description:

This is a toy-like web application developed by using java. This program go
through the test under: java 1.8.0_101, MySQL 5.7.16 MySQL Community Server,
Mac osx10.13 (x86_64) environments. However, the app still face problems
when large amount of user visit the site at the same time. This is because I do 
not lock the database table when program make opeations on the database. 
Furthermore, I do not encode the user's password in database and I do not encode 
the cookie. I will try to fix these problems in following version.

---

### Main Functions:
+ Login to System
+ Sign up an account
+ Buy books
+ look through personal orders
+ change personal information
---

### How to use it:
1. Install Java: <https://www.java.com/en/download/>
2. Download tomcat: <https://tomcat.apache.org/>
3. Download MySQL: <https://dev.mysql.com/downloads/mysql/5.7.html#downloads>
4. Put this project folder under `/apache/webapps`
5. Open the terminal and go under data folder then execute the command:
`source create.sql`
6. Modify databaseConnect.java, change the username and password to your username
and password and recompile this file
7. startup the tomcat
8. visit the site: <localhost:8080/onlineBookstore/>
9. Test username: admin, password: 1234
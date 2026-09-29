Last login: Tue Sep 29 14:51:05 on ttys000
kevanshi@192 ~ % mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 9.7.2 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE Library_db;
Query OK, 1 row affected (0.003 sec)

mysql> USE libarary_db;
ERROR 1049 (42000): Unknown database 'libarary_db'
mysql> USE libarary_db;
ERROR 1049 (42000): Unknown database 'libarary_db'
mysql> USE Library_db;
Database changed
mysql> CREATE TABLE Authors(
    -> author_id INT PRIMARY KEY AUTO_INCREMENT,
    -> name VARCHAR(100),
    -> email VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.011 sec)

mysql> SHOW TABLES;
+----------------------+
| Tables_in_library_db |
+----------------------+
| Authors              |
+----------------------+
1 row in set (0.003 sec)

mysql> CREATE TABLE Books(
    -> book_id INT PRIMARY KEY AUTO_INCREMENT,
    -> title VARCHAR(200),
    -> author_id INT,
    -> category VARCHAR(100),
    -> isbn VARCHAR(20),
    -> published_date DATE,
    -> price DECIMAL (10,2),
    -> available_copies INT,
    -> FOREIGN KEY(author_id) REFERENCES Authors(author_id)
    -> );
Query OK, 0 rows affected (0.015 sec)

mysql> CREATE TABLE Members (
    -> member_id INT PRIMARY KEY AUTO_INCREMENT,
    -> name VARCHAR(100),
    -> email VARCHAR(100),
    -> phone_number VARCHAR(15),
    -> membership_date DATE
    -> );
Query OK, 0 rows affected (0.014 sec)

mysql> CREATE TABLE Transaction (
    -> transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    -> member_id INT,
    -> book_id INT,
    -> borrow_date DATE,
    -> return_date DATE,
    -> fine_amount DECIMAL(10,2),
    -> FOREIGN KEY (member_id) REFERENCES Members(member_id),
    -> FOREIGN KEY (book_id) REFERENCES Books (book_id)
    -> );
Query OK, 0 rows affected (0.018 sec)

mysql> INSERT INTO Books (book_id, title, author_id, category, isbn, published_date, price, available_copies) VALUES
    -> (1, 'Harry Potter', 101, 'Fantasy', 'ISBN001', '1997-06-26', 500.00, 5),
    -> (2, 'A Brief History of Time', 102, 'Science', ISBN003, '1954-07-29', 650.00,3),
    -> (3, 'A Great Gatsby', 103, 'Fiction', ISBN004, '1957-04-29', 750.00, 6),
    -> (4, 'The Hobbit', 104, 'Fantasy', 'ISBN004', '1937-09-21', 450.00, 12),
    -> (5, 'The Way of Kings', 105, 'Fantasy', 'ISBN005', '2010-08-31', 800.00, 6);
ERROR 1054 (42S22): Unknown column 'ISBN003' in 'field list'
mysql> INSERT INTO Books (book_id, title, author_id, category, isbn, published_date, price, available_copies) VALUES
    -> (1, 'Harry Potter', 101, 'Fantasy', 'ISBN001', '1997-06-26', 500.00, 5),
    -> (2, 'A Brief History of Time', 102, 'Science', 'ISBN003', '1954-07-29', 650.00, 3),
    -> (3, 'A Great Gatsby', 103, 'Fiction', 'ISBN004', '1957-04-29', 750.00, 6),
    -> (4, 'The Hobbit', 104, 'Fantasy', 'ISBN004', '1937-09-21', 450.00, 12),
    -> (5, 'The Way of Kings', 105, 'Fantasy', 'ISBN005', '2010-08-31', 800.00, 6);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`library_db`.`books`, CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`))
mysql> SELECT * FROM Authors;
Empty set (0.000 sec)

mysql> INSERT INTO Books
    -> (book_id, title, author_id, category, isbn, published_date, price, available_copies)
    -> VALUES
    -> (1, 'Harry Potter', 1, 'Fantasy', 'ISBN001', '1997-06-26', 500.00, 5),
    -> (2, 'A Brief History of Time', 2, 'Science', 'ISBN002', '1988-04-01', 650.00, 3),
    -> (3, 'The Great Gatsby', 3, 'Fiction', 'ISBN003', '1925-04-10', 750.00, 6),
    -> (4, 'The Hobbit', 4, 'Fantasy', 'ISBN004', '1937-09-21', 450.00, 12),
    -> (5, 'The Way of Kings', 5, 'Fantasy', 'ISBN005', '2010-08-31', 800.00, 6);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`library_db`.`books`, CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`))
mysql> INSERT INTO Books ( book_id,title, author_id, category, isbn, published_date, price, available_copies) VALUES
    -> (1,'Wings of Fire', 2, 'Science', 'ISBN001', '1999-01-01', 450, 5),
    -> (2,'Harry Potter', 3, 'Fantasy', 'ISBN002', '2005-06-26', 660, 8),
    -> ('Revolution 2020', 1, 'Fiction', 'ISBN003', '2016-03-10', 300, 4);
ERROR 1136 (21S01): Column count doesn't match value count at row 3
mysql> INSERT INTO Books ( book_id,title, author_id, category, isbn, published_date, price, available_copies) VALUES
    -> (1,'Wings of Fire', 2, 'Science', 'ISBN001', '1999-01-01', 450, 5),
    -> (2,'Harry Potter', 3, 'Fantasy', 'ISBN002', '2005-06-26', 660, 8),
    -> (3,'Revolution 2020', 1, 'Fiction', 'ISBN003', '2016-03-10', 300, 4);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`library_db`.`books`, CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`))
mysql> DESC Books;
+------------------+---------------+------+-----+---------+----------------+
| Field            | Type          | Null | Key | Default | Extra          |
+------------------+---------------+------+-----+---------+----------------+
| book_id          | int           | NO   | PRI | NULL    | auto_increment |
| title            | varchar(200)  | YES  |     | NULL    |                |
| author_id        | int           | YES  | MUL | NULL    |                |
| category         | varchar(100)  | YES  |     | NULL    |                |
| isbn             | varchar(20)   | YES  |     | NULL    |                |
| published_date   | date          | YES  |     | NULL    |                |
| price            | decimal(10,2) | YES  |     | NULL    |                |
| available_copies | int           | YES  |     | NULL    |                |
+------------------+---------------+------+-----+---------+----------------+
8 rows in set (0.002 sec)

mysql> SELECT * FROM Authors;
Empty set (0.001 sec)

mysql> INSERT INTO Authors (author_id, name, email) VALUES
    -> (1, 'A.P.J. Abdul Kalam', 'kalam@email.com'),
    -> (2, 'Chetan Bhagat', 'chetan@email.com'),
    -> (3, 'J.K. Rowling', 'jkrowling@email.com'),
    -> (4, 'J.R.R. Tolkien', 'tolkien@email.com'),
    -> (5, 'Brandon Sanderson', 'brandon@email.com');
Query OK, 5 rows affected (0.008 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Authors;
+-----------+--------------------+---------------------+
| author_id | name               | email               |
+-----------+--------------------+---------------------+
|         1 | A.P.J. Abdul Kalam | kalam@email.com     |
|         2 | Chetan Bhagat      | chetan@email.com    |
|         3 | J.K. Rowling       | jkrowling@email.com |
|         4 | J.R.R. Tolkien     | tolkien@email.com   |
|         5 | Brandon Sanderson  | brandon@email.com   |
+-----------+--------------------+---------------------+
5 rows in set (0.000 sec)

mysql> INSERT INTO Books
    -> (book_id, title, author_id, category, isbn, published_date, price, available_copies)
    -> VALUES
    -> (1, 'Wings of Fire', 1, 'Science', 'ISBN001', '1999-01-01', 450.00, 5),
    -> (2, 'Harry Potter', 3, 'Fantasy', 'ISBN002', '2005-06-26', 660.00, 8),
    -> (3, 'Revolution 2020', 2, 'Fiction', 'ISBN003', '2011-10-01', 300.00, 4),
    -> (4, 'The Hobbit', 4, 'Fantasy', 'ISBN004', '1937-09-21', 450.00, 12),
    -> (5, 'The Way of Kings', 5, 'Fantasy', 'ISBN005', '2010-08-31', 800.00, 6);
Query OK, 5 rows affected (0.002 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Books;
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
|       1 | Wings of Fire    |         1 | Science  | ISBN001 | 1999-01-01     | 450.00 |                5 |
|       2 | Harry Potter     |         3 | Fantasy  | ISBN002 | 2005-06-26     | 660.00 |                8 |
|       3 | Revolution 2020  |         2 | Fiction  | ISBN003 | 2011-10-01     | 300.00 |                4 |
|       4 | The Hobbit       |         4 | Fantasy  | ISBN004 | 1937-09-21     | 450.00 |               12 |
|       5 | The Way of Kings |         5 | Fantasy  | ISBN005 | 2010-08-31     | 800.00 |                6 |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
5 rows in set (0.002 sec)

mysql> INSERT INTO Members
    -> (member_id, name, email, phone_number, membership_date)
    -> VALUES
    -> (1, 'Ankit Shah', 'ankit@email.com', '9876543210', '2026-01-10'),
    -> (2, 'Priya Mehta', 'priya@email.com', '9876543211', '2026-02-15'),
    -> (3, 'Dev Yadav', 'dev@email.com', '9876543212', '2026-03-20'),
    -> (4, 'Riya Patel', 'riya@email.com', '9876543213', '2026-04-05'),
    -> (5, 'Rahul Sharma', 'rahul@email.com', '9876543214', '2026-05-12');
Query OK, 5 rows affected (0.004 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Members;
+-----------+--------------+-----------------+--------------+-----------------+
| member_id | name         | email           | phone_number | membership_date |
+-----------+--------------+-----------------+--------------+-----------------+
|         1 | Ankit Shah   | ankit@email.com | 9876543210   | 2026-01-10      |
|         2 | Priya Mehta  | priya@email.com | 9876543211   | 2026-02-15      |
|         3 | Dev Yadav    | dev@email.com   | 9876543212   | 2026-03-20      |
|         4 | Riya Patel   | riya@email.com  | 9876543213   | 2026-04-05      |
|         5 | Rahul Sharma | rahul@email.com | 9876543214   | 2026-05-12      |
+-----------+--------------+-----------------+--------------+-----------------+
5 rows in set (0.001 sec)

mysql> INSERT INTO Transactions
    -> (transaction_id, member_id, book_id, borrow_date, return_date, fine_amount)
    -> VALUES
    -> (1, 1, 1, '2026-06-01', '2026-06-10', 0.00),
    -> (2, 2, 2, '2026-06-03', '2026-06-15', 20.00),
    -> (3, 3, 3, '2026-06-05', '2026-06-12', 0.00),
    -> (4, 4, 4, '2026-06-08', '2026-06-20', 30.00),
    -> (5, 5, 5, '2026-06-10', '2026-06-18', 10.00);
ERROR 1146 (42S02): Table 'library_db.transactions' doesn't exist
mysql> CREATE TABLE Transactions (
    ->     transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     member_id INT,
    ->     book_id INT,
    ->     borrow_date DATE,
    ->     return_date DATE,
    ->     fine_amount DECIMAL(10,2),
    ->     FOREIGN KEY (member_id) REFERENCES Members(member_id),
    ->     FOREIGN KEY (book_id) REFERENCES Books(book_id)
    -> 0000;;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '0000' at line 10
ERROR: 
No query specified

mysql> INSERT INTO Transactions
    -> (transaction_id, member_id, book_id, borrow_date, return_date, fine_amount)
    -> VALUES
    -> (1, 1, 1, '2026-06-01', '2026-06-10', 0.00),
    -> (2, 2, 2, '2026-06-03', '2026-06-15', 20.00),
    -> (3, 3, 3, '2026-06-05', '2026-06-12', 0.00),
    -> (4, 4, 4, '2026-06-08', '2026-06-20', 30.00),
    -> (5, 5, 5, '2026-06-10', '2026-06-18', 10.00);
ERROR 1146 (42S02): Table 'library_db.transactions' doesn't exist
mysql> CREATE TABLE Transactions (
    ->     transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     member_id INT,
    ->     book_id INT,
    ->     borrow_date DATE,
    ->     return_date DATE,
    ->     fine_amount DECIMAL(10,2),
    ->     FOREIGN KEY (member_id) REFERENCES Members(member_id),
    ->     FOREIGN KEY (book_id) REFERENCES Books(book_id)
    -> );
Query OK, 0 rows affected (0.018 sec)

mysql> INSERT INTO Transactions
    -> (transaction_id, member_id, book_id, borrow_date, return_date, fine_amount)
    -> VALUES
    -> (1, 1, 1, '2026-06-01', '2026-06-10', 0.00),
    -> (2, 2, 2, '2026-06-03', '2026-06-15', 20.00),
    -> (3, 3, 3, '2026-06-05', '2026-06-12', 0.00),
    -> (4, 4, 4, '2026-06-08', '2026-06-20', 30.00),
    -> (5, 5, 5, '2026-06-10', '2026-06-18', 10.00);
Query OK, 5 rows affected (0.004 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Transactions;
+----------------+-----------+---------+-------------+-------------+-------------+
| transaction_id | member_id | book_id | borrow_date | return_date | fine_amount |
+----------------+-----------+---------+-------------+-------------+-------------+
|              1 |         1 |       1 | 2026-06-01  | 2026-06-10  |        0.00 |
|              2 |         2 |       2 | 2026-06-03  | 2026-06-15  |       20.00 |
|              3 |         3 |       3 | 2026-06-05  | 2026-06-12  |        0.00 |
|              4 |         4 |       4 | 2026-06-08  | 2026-06-20  |       30.00 |
|              5 |         5 |       5 | 2026-06-10  | 2026-06-18  |       10.00 |
+----------------+-----------+---------+-------------+-------------+-------------+
5 rows in set (0.000 sec)

mysql> INSERT INTO Books (book_id, title, author_id, category, isbn, published_date, price, available_copies) VALUES 
    -> (6, 'The Alchemist', 2, 'Fiction', 'ISBN006', '1998-01-01', 550.00, 7);
Query OK, 1 row affected (0.002 sec)

mysql> SELECT * FROM Books;
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
|       1 | Wings of Fire    |         1 | Science  | ISBN001 | 1999-01-01     | 450.00 |                5 |
|       2 | Harry Potter     |         3 | Fantasy  | ISBN002 | 2005-06-26     | 660.00 |                8 |
|       3 | Revolution 2020  |         2 | Fiction  | ISBN003 | 2011-10-01     | 300.00 |                4 |
|       4 | The Hobbit       |         4 | Fantasy  | ISBN004 | 1937-09-21     | 450.00 |               12 |
|       5 | The Way of Kings |         5 | Fantasy  | ISBN005 | 2010-08-31     | 800.00 |                6 |
|       6 | The Alchemist    |         2 | Fiction  | ISBN006 | 1998-01-01     | 550.00 |                7 |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
6 rows in set (0.001 sec)

mysql> UPDATE Books
    -> SET available_copies = available_copies - 1
    -> WHERE book_id = 1;
Query OK, 1 row affected (0.008 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT book_id, title, available_copies
    -> FROM Books
    -> WHERE book_id = 1;
+---------+---------------+------------------+
| book_id | title         | available_copies |
+---------+---------------+------------------+
|       1 | Wings of Fire |                4 |
+---------+---------------+------------------+
1 row in set (0.002 sec)

mysql> UPDATE Books 
    -> SET available_copies  = available_copies + 1
    -> WHERE book_id = 1;
Query OK, 1 row affected (0.002 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT m.*
    -> FROM Members m
    -> WHERE NOT EXISTS (
    -> SELECT 1
    -> FROM Transactions t
    -> WHERE t.member_id = m.member_id
    -> AND t.borrow_date >= DATE_SUB((CURDATE(), INTERVAL 1 YEAR )
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')
)' at line 7
mysql> SELECT m.*
    -> FROM Members m
    -> WHERE NOT EXISTS (
    -> SELECT !
    -> FROM /;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM /' at line 5
mysql> SELECT m.*
    -> FROM Members m
    -> WHERE NOT EXISTS (
    -> SELECT 1
    -> FROM Transactions t
    -> WHERE t.member_id = m.member_id
    -> AND t.borrow_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    -> );
Empty set (0.011 sec)

mysql> SELECT *
    -> FROM Books
    -> WHERE available_copies > 0;
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
|       1 | Wings of Fire    |         1 | Science  | ISBN001 | 1999-01-01     | 450.00 |                5 |
|       2 | Harry Potter     |         3 | Fantasy  | ISBN002 | 2005-06-26     | 660.00 |                8 |
|       3 | Revolution 2020  |         2 | Fiction  | ISBN003 | 2011-10-01     | 300.00 |                4 |
|       4 | The Hobbit       |         4 | Fantasy  | ISBN004 | 1937-09-21     | 450.00 |               12 |
|       5 | The Way of Kings |         5 | Fantasy  | ISBN005 | 2010-08-31     | 800.00 |                6 |
|       6 | The Alchemist    |         2 | Fiction  | ISBN006 | 1998-01-01     | 550.00 |                7 |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
6 rows in set (0.001 sec)

mysql> SELECT * FROM Books
    -> WHERE available_copies > 0;
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
|       1 | Wings of Fire    |         1 | Science  | ISBN001 | 1999-01-01     | 450.00 |                5 |
|       2 | Harry Potter     |         3 | Fantasy  | ISBN002 | 2005-06-26     | 660.00 |                8 |
|       3 | Revolution 2020  |         2 | Fiction  | ISBN003 | 2011-10-01     | 300.00 |                4 |
|       4 | The Hobbit       |         4 | Fantasy  | ISBN004 | 1937-09-21     | 450.00 |               12 |
|       5 | The Way of Kings |         5 | Fantasy  | ISBN005 | 2010-08-31     | 800.00 |                6 |
|       6 | The Alchemist    |         2 | Fiction  | ISBN006 | 1998-01-01     | 550.00 |                7 |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
6 rows in set (0.001 sec)

mysql> SELECT * FROM Books WHERE available_copies > 0;
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
|       1 | Wings of Fire    |         1 | Science  | ISBN001 | 1999-01-01     | 450.00 |                5 |
|       2 | Harry Potter     |         3 | Fantasy  | ISBN002 | 2005-06-26     | 660.00 |                8 |
|       3 | Revolution 2020  |         2 | Fiction  | ISBN003 | 2011-10-01     | 300.00 |                4 |
|       4 | The Hobbit       |         4 | Fantasy  | ISBN004 | 1937-09-21     | 450.00 |               12 |
|       5 | The Way of Kings |         5 | Fantasy  | ISBN005 | 2010-08-31     | 800.00 |                6 |
|       6 | The Alchemist    |         2 | Fiction  | ISBN006 | 1998-01-01     | 550.00 |                7 |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
6 rows in set (0.001 sec)

mysql> SELECT book_id, title, available_copies
    -> FROM Books
    -> WHERE available_copies > 0;
+---------+------------------+------------------+
| book_id | title            | available_copies |
+---------+------------------+------------------+
|       1 | Wings of Fire    |                5 |
|       2 | Harry Potter     |                8 |
|       3 | Revolution 2020  |                4 |
|       4 | The Hobbit       |               12 |
|       5 | The Way of Kings |                6 |
|       6 | The Alchemist    |                7 |
+---------+------------------+------------------+
6 rows in set (0.001 sec)

mysql> SELECT * FROM books
    -> WHERE published_date > '2015-12-31';
Empty set (0.001 sec)

mysql> SELECT * FROM Books ORDER BY price DESC 
    -> LIMIT 5;
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
|       5 | The Way of Kings |         5 | Fantasy  | ISBN005 | 2010-08-31     | 800.00 |                6 |
|       2 | Harry Potter     |         3 | Fantasy  | ISBN002 | 2005-06-26     | 660.00 |                8 |
|       6 | The Alchemist    |         2 | Fiction  | ISBN006 | 1998-01-01     | 550.00 |                7 |
|       1 | Wings of Fire    |         1 | Science  | ISBN001 | 1999-01-01     | 450.00 |                5 |
|       4 | The Hobbit       |         4 | Fantasy  | ISBN004 | 1937-09-21     | 450.00 |               12 |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
5 rows in set (0.001 sec)

mysql> SELECT * FROM Members 
    -> WHERE membership_date < '2022-01-01';
Empty set (0.001 sec)

mysql> SELECT * FROM Books ORDER BY price DESC LIMIT 5;
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
|       5 | The Way of Kings |         5 | Fantasy  | ISBN005 | 2010-08-31     | 800.00 |                6 |
|       2 | Harry Potter     |         3 | Fantasy  | ISBN002 | 2005-06-26     | 660.00 |                8 |
|       6 | The Alchemist    |         2 | Fiction  | ISBN006 | 1998-01-01     | 550.00 |                7 |
|       1 | Wings of Fire    |         1 | Science  | ISBN001 | 1999-01-01     | 450.00 |                5 |
|       4 | The Hobbit       |         4 | Fantasy  | ISBN004 | 1937-09-21     | 450.00 |               12 |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
5 rows in set (0.001 sec)

mysql> SELECT * FROM
    -> Members
    -> WHERE 
    -> membership_date < '2022-01-01';
Empty set (0.001 sec)

mysql> SELECT * FROM Members WHERE
    -> membership_date < '2022-01-01';
Empty set (0.001 sec)

mysql> SELECT * FROM Books
    -> WHERE category = 'Science'
    -> AND price < 500;
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title         | author_id | category | isbn    | published_date | price  | available_copies |
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
|       1 | Wings of Fire |         1 | Science  | ISBN001 | 1999-01-01     | 450.00 |                5 |
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
1 row in set (0.003 sec)

mysql> SELECT * FROM Books 
    -> WHERE Books 
    -> WHERE NOT available_copies >0;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE NOT available_copies >0' at line 3
mysql> SELECT *
    -> FROM Books
    -> WHERE NOT available_copies > 0;
Empty set (0.001 sec)

mysql> SELECT *
    -> FROM Books
    -> WHERE available_copies = 0;
Empty set (0.001 sec)

mysql> SELECT m.member_id, m.name, m.email, m.membership_date
    -> FROM Membera m
    -> LEFT JOIN Transactions t
    -> ON m.member_id = t.member_id
    -> GROUP BY m.member_id, m,name, m.email, m.membership_date
    -> HAVING YEAR (m.membership_date) > 2020
    -> OR COUNT (t.transaction_id) >3;
ERROR 1146 (42S02): Table 'library_db.membera' doesn't exist
mysql> SELECT m.member_id, m.name, m.email, m.membership_date
    -> FROM Members m
    -> LEFT JOIN Transactions t
    -> ON m.member_id = t.member_id
    -> GROUP BY m.member_id, m.name, m.email, m.membership_date
    -> HAVING YEAR(m.membership_date) > 2020
    -> OR COUNT(t.transaction_id) > 3;
+-----------+--------------+-----------------+-----------------+
| member_id | name         | email           | membership_date |
+-----------+--------------+-----------------+-----------------+
|         1 | Ankit Shah   | ankit@email.com | 2026-01-10      |
|         2 | Priya Mehta  | priya@email.com | 2026-02-15      |
|         3 | Dev Yadav    | dev@email.com   | 2026-03-20      |
|         4 | Riya Patel   | riya@email.com  | 2026-04-05      |
|         5 | Rahul Sharma | rahul@email.com | 2026-05-12      |
+-----------+--------------+-----------------+-----------------+
5 rows in set (0.004 sec)

mysql> SELECT *
    -> FROM Books
    -> WHERE category = 'Science'
    -> AND price < 500;
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title         | author_id | category | isbn    | published_date | price  | available_copies |
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
|       1 | Wings of Fire |         1 | Science  | ISBN001 | 1999-01-01     | 450.00 |                5 |
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
1 row in set (0.000 sec)

mysql> SELECT *
    -> FROM Books
    -> WHERE NOT available_copies > 0;
Empty set (0.001 sec)

mysql> SELECT *
    -> FROM Books
    -> WHERE NOT available_copies > 0;
Empty set (0.000 sec)

mysql> SELECT m.member_id, m.name, m.email, m.membership_date
    -> FROM Members m
    -> LEFT JOIN Transactions t
    -> ON m.member_id = t.member_id
    -> GROUP BY m.member_id, m.name, m.email, m.membership_date
    -> HAVING YEAR(m.membership_date) > 2020
    ->  OR COUNT(t.transaction_id) > 3;
+-----------+--------------+-----------------+-----------------+
| member_id | name         | email           | membership_date |
+-----------+--------------+-----------------+-----------------+
|         1 | Ankit Shah   | ankit@email.com | 2026-01-10      |
|         2 | Priya Mehta  | priya@email.com | 2026-02-15      |
|         3 | Dev Yadav    | dev@email.com   | 2026-03-20      |
|         4 | Riya Patel   | riya@email.com  | 2026-04-05      |
|         5 | Rahul Sharma | rahul@email.com | 2026-05-12      |
+-----------+--------------+-----------------+-----------------+
5 rows in set (0.001 sec)

mysql> SELECT *
    -> FROM Books
    -> ORDER BY title ASC;
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
|       2 | Harry Potter     |         3 | Fantasy  | ISBN002 | 2005-06-26     | 660.00 |                8 |
|       3 | Revolution 2020  |         2 | Fiction  | ISBN003 | 2011-10-01     | 300.00 |                4 |
|       6 | The Alchemist    |         2 | Fiction  | ISBN006 | 1998-01-01     | 550.00 |                7 |
|       4 | The Hobbit       |         4 | Fantasy  | ISBN004 | 1937-09-21     | 450.00 |               12 |
|       5 | The Way of Kings |         5 | Fantasy  | ISBN005 | 2010-08-31     | 800.00 |                6 |
|       1 | Wings of Fire    |         1 | Science  | ISBN001 | 1999-01-01     | 450.00 |                5 |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
6 rows in set (0.002 sec)

mysql> SELECT member_id, COUNT(*) AS books_borrowed
    -> FROM Transactions
    -> GROUP BY member_id;
+-----------+----------------+
| member_id | books_borrowed |
+-----------+----------------+
|         1 |              1 |
|         2 |              1 |
|         3 |              1 |
|         4 |              1 |
|         5 |              1 |
+-----------+----------------+
5 rows in set (0.002 sec)

mysql> SELECT category, COUNT(*) AS total_books
    -> FROM Books
    -> GROUP BY category;
+----------+-------------+
| category | total_books |
+----------+-------------+
| Science  |           1 |
| Fantasy  |           3 |
| Fiction  |           2 |
+----------+-------------+
3 rows in set (0.000 sec)

mysql> SELECT *
    -> FROM Books
    -> ORDER BY title ASC;
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
|       2 | Harry Potter     |         3 | Fantasy  | ISBN002 | 2005-06-26     | 660.00 |                8 |
|       3 | Revolution 2020  |         2 | Fiction  | ISBN003 | 2011-10-01     | 300.00 |                4 |
|       6 | The Alchemist    |         2 | Fiction  | ISBN006 | 1998-01-01     | 550.00 |                7 |
|       4 | The Hobbit       |         4 | Fantasy  | ISBN004 | 1937-09-21     | 450.00 |               12 |
|       5 | The Way of Kings |         5 | Fantasy  | ISBN005 | 2010-08-31     | 800.00 |                6 |
|       1 | Wings of Fire    |         1 | Science  | ISBN001 | 1999-01-01     | 450.00 |                5 |
+---------+------------------+-----------+----------+---------+----------------+--------+------------------+
6 rows in set (0.001 sec)

mysql> SELECT member_id, COUNT(*) AS books_borrowed
    -> FROM Transactions
    -> GROUP BY member_id;
+-----------+----------------+
| member_id | books_borrowed |
+-----------+----------------+
|         1 |              1 |
|         2 |              1 |
|         3 |              1 |
|         4 |              1 |
|         5 |              1 |
+-----------+----------------+
5 rows in set (0.000 sec)

mysql> 
mysql> SELECT member_id, COUNT(*) AS books_borrowed
    -> FROM Transactions
    -> GROUP BY member_id;
+-----------+----------------+
| member_id | books_borrowed |
+-----------+----------------+
|         1 |              1 |
|         2 |              1 |
|         3 |              1 |
|         4 |              1 |
|         5 |              1 |
+-----------+----------------+
5 rows in set (0.000 sec)

mysql> SELECT category, COUNT(*) AS total_books
    -> FROM Books
    -> GROUP BY category;
+----------+-------------+
| category | total_books |
+----------+-------------+
| Science  |           1 |
| Fantasy  |           3 |
| Fiction  |           2 |
+----------+-------------+
3 rows in set (0.001 sec)

mysql> SELECT category, COUNT(*) AS total_books
    -> FROM Books
    -> GROUP BY category;
+----------+-------------+
| category | total_books |
+----------+-------------+
| Science  |           1 |
| Fantasy  |           3 |
| Fiction  |           2 |
+----------+-------------+
3 rows in set (0.000 sec)

mysql> SELECT AVG(price) AS average_price
    -> FROM Books;
+---------------+
| average_price |
+---------------+
|    535.000000 |
+---------------+
1 row in set (0.003 sec)

mysql> SELECT b.book_id, b.title, COUNT(t.transaction_id) AS times_borrowed
    -> FROM Books b
    -> JOIN Transactions t
    -> ON b.book_id = t.book_id
    -> GROUP BY b.book_id, b.title
    -> ORDER BY times_borrowed DESC
    -> LIMIT 1;
+---------+---------------+----------------+
| book_id | title         | times_borrowed |
+---------+---------------+----------------+
|       1 | Wings of Fire |              1 |
+---------+---------------+----------------+
1 row in set (0.001 sec)

mysql> SELECT SUM(fine_amount) AS total_fines
    -> FROM Transactions;
+-------------+
| total_fines |
+-------------+
|       60.00 |
+-------------+
1 row in set (0.002 sec)

mysql> SHOW CREATE TABLE Books;
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Books | CREATE TABLE `Books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `available_copies` int DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.002 sec)

mysql> SHOW CREATE TABLE Books;
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Books | CREATE TABLE `Books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `available_copies` int DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.001 sec)

mysql> SHOW CREATE TABLE Transactions;
+--------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table        | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
+--------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Transactions | CREATE TABLE `Transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `borrow_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `fine_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `member_id` (`member_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `Members` (`member_id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+--------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.001 sec)

mysql> SELECT b.book_id, b.title, a.name AS author_name
    -> FROM Books b
    -> INNER JOIN Authors a
    -> ON b.author_id = a.author_id;
+---------+------------------+--------------------+
| book_id | title            | author_name        |
+---------+------------------+--------------------+
|       1 | Wings of Fire    | A.P.J. Abdul Kalam |
|       3 | Revolution 2020  | Chetan Bhagat      |
|       6 | The Alchemist    | Chetan Bhagat      |
|       2 | Harry Potter     | J.K. Rowling       |
|       4 | The Hobbit       | J.R.R. Tolkien     |
|       5 | The Way of Kings | Brandon Sanderson  |
+---------+------------------+--------------------+
6 rows in set (0.001 sec)

mysql> SELECT m.member_id, m.name, t.book_id, t.borrow_date
    -> FROM Members m
    -> LEFT JOIN Transactions t
    ->  ON m.member_id = t.member_id;
+-----------+--------------+---------+-------------+
| member_id | name         | book_id | borrow_date |
+-----------+--------------+---------+-------------+
|         1 | Ankit Shah   |       1 | 2026-06-01  |
|         2 | Priya Mehta  |       2 | 2026-06-03  |
|         3 | Dev Yadav    |       3 | 2026-06-05  |
|         4 | Riya Patel   |       4 | 2026-06-08  |
|         5 | Rahul Sharma |       5 | 2026-06-10  |
+-----------+--------------+---------+-------------+
5 rows in set (0.001 sec)

mysql> SELECT b.book_id, b.title
    -> FROM Transactions t
    -> RIGHT JOIN Books b
    -> ON t.book_id = b.book_id
    -> WHERE t.book_id IS NULL;
+---------+---------------+
| book_id | title         |
+---------+---------------+
|       6 | The Alchemist |
+---------+---------------+
1 row in set (0.001 sec)

mysql> SELECT b.book_id, b.title
    -> FROM Transactions t
    -> RIGHT JOIN Books b
    ->   ON t.book_id = b.book_id
    -> WHERE t.book_id IS NULL;
+---------+---------------+
| book_id | title         |
+---------+---------------+
|       6 | The Alchemist |
+---------+---------------+
1 row in set (0.001 sec)

mysql> SELECT m.member_id, m.name, t.transaction_id
    -> FROM Members m
    -> LEFT JOIN Transactions t
    -> ON m.member_id = t.member_id
    -> UNION
    -> SELECT m.member_id, m.name, t.transaction_id
    -> FROM Members m
    -> RIGHT JOIN Transactions t
    -> ON m.member_id = t.member_id;
+-----------+--------------+----------------+
| member_id | name         | transaction_id |
+-----------+--------------+----------------+
|         1 | Ankit Shah   |              1 |
|         2 | Priya Mehta  |              2 |
|         3 | Dev Yadav    |              3 |
|         4 | Riya Patel   |              4 |
|         5 | Rahul Sharma |              5 |
+-----------+--------------+----------------+
5 rows in set (0.003 sec)

mysql> SELECT m.member_id, m.name, t.transaction_id
    -> FROM Members m
    -> LEFT JOIN Transactions t
    ->  ON m.member_id = t.member_id
    -> UNION
    -> SELECT m.member_id, m.name, t.transaction_id
    -> FROM Members m
    -> RIGHT JOIN Transactions  t
    ->  ON m.member_id = t.member_id;
+-----------+--------------+----------------+
| member_id | name         | transaction_id |
+-----------+--------------+----------------+
|         1 | Ankit Shah   |              1 |
|         2 | Priya Mehta  |              2 |
|         3 | Dev Yadav    |              3 |
|         4 | Riya Patel   |              4 |
|         5 | Rahul Sharma |              5 |
+-----------+--------------+----------------+
5 rows in set (0.001 sec)

mysql> SELECT b.book_id, b.title
    -> FROM Books b
    -> WHERE b.book_id IN (
    -> SELECT t.book_id
    -> FROM Transactions t
    -> WHERE t.member_id IN (
    ->  SELECT m.member_id
    -> FROM Members m
    -> WHERE YEAR(m.membership_date) > 2022
    -> )
    -> );
+---------+------------------+
| book_id | title            |
+---------+------------------+
|       1 | Wings of Fire    |
|       2 | Harry Potter     |
|       3 | Revolution 2020  |
|       4 | The Hobbit       |
|       5 | The Way of Kings |
+---------+------------------+
5 rows in set (0.001 sec)

mysql> SELECT b.book_id, b.title
    -> FROM Books b
    -> WHERE b.book_id IN (
    -> SELECT t.book_id
    -> '';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 5
mysql> SELECT b.book_id, b.title, COUNT(t.transaction_id) AS times_borrowed
    -> FROM Books b
    -> JOIN Transactions t
    -> ON b.book_id = t.book_id
    -> GROUP BY b.book_id, b.title
    -> HAVING COUNT(t.transaction_id) = (
    -> SELECT MAX(borrow_count)
    -> FROM (
    ->  SELECT COUNT(*) AS borrow_count
    -> FROM Transactions
    -> GROUP BY book_id
    ->  ) AS counts
    -> );
+---------+------------------+----------------+
| book_id | title            | times_borrowed |
+---------+------------------+----------------+
|       1 | Wings of Fire    |              1 |
|       2 | Harry Potter     |              1 |
|       3 | Revolution 2020  |              1 |
|       4 | The Hobbit       |              1 |
|       5 | The Way of Kings |              1 |
+---------+------------------+----------------+
5 rows in set (0.005 sec)

mysql> SELECT m.member_id, m.name
    -> FROM Members m
    -> WHERE NOT EXISTS (
    -> SELECT 1
    -> FROM Transactions t
    ->  WHERE t.member_id = m.member_id
    -> );
Empty set (0.000 sec)

mysql> SELECT m.member_id, m.name
    -> FROM Members m
    -> WHERE NOT EXISTS (
    -> ;;'
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
ERROR: 
No query specified

    '> ';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''
'' at line 1
mysql> SELECT m.member_id, m.name
    -> FROM Members m
    -> WHERE NOT EXISTS (
    ->     SELECT 1
    ->     FROM Transactions t
    ->     WHERE t.member_id = m.member_id
    -> );
Empty set (0.001 sec)

mysql> SELECT YEAR(published_date) AS publication_year,
    -> COUNT(*) AS total_books
    -> FROM Books
    -> GROUP BY YEAR(published_date)
    -> ORDER BY publication_year;
+------------------+-------------+
| publication_year | total_books |
+------------------+-------------+
|             1937 |           1 |
|             1998 |           1 |
|             1999 |           1 |
|             2005 |           1 |
|             2010 |           1 |
|             2011 |           1 |
+------------------+-------------+
6 rows in set (0.001 sec)

mysql> SELECT YEAR(published_date) AS publication_year,
    -> COUNT(*) AS total_books
    -> FROM Books
    -> GROUP BY YEAR(published_date)
    -> ORDER BY publication_year;
+------------------+-------------+
| publication_year | total_books |
+------------------+-------------+
|             1937 |           1 |
|             1998 |           1 |
|             1999 |           1 |
|             2005 |           1 |
|             2010 |           1 |
|             2011 |           1 |
+------------------+-------------+
6 rows in set (0.000 sec)

mysql> SELECT transaction_id,
    -> borrow_date,
    -> return_date,
    -> DATEDIFF(return_date, borrow_date) AS days_borrowed
    -> FROM Transactions;
+----------------+-------------+-------------+---------------+
| transaction_id | borrow_date | return_date | days_borrowed |
+----------------+-------------+-------------+---------------+
|              1 | 2026-06-01  | 2026-06-10  |             9 |
|              2 | 2026-06-03  | 2026-06-15  |            12 |
|              3 | 2026-06-05  | 2026-06-12  |             7 |
|              4 | 2026-06-08  | 2026-06-20  |            12 |
|              5 | 2026-06-10  | 2026-06-18  |             8 |
+----------------+-------------+-------------+---------------+
5 rows in set (0.003 sec)

mysql> SELECT transaction_id,
    -> DATE_FORMAT(borrow_date, '%d-%m-%Y') AS formatted_borrow_date
    -> FROM Transactions;
+----------------+-----------------------+
| transaction_id | formatted_borrow_date |
+----------------+-----------------------+
|              1 | 01-06-2026            |
|              2 | 03-06-2026            |
|              3 | 05-06-2026            |
|              4 | 08-06-2026            |
|              5 | 10-06-2026            |
+----------------+-----------------------+
5 rows in set (0.002 sec)

mysql> SELECT book_id,
    -> UPPER(title) AS uppercase_title
    -> FROM Books;
+---------+------------------+
| book_id | uppercase_title  |
+---------+------------------+
|       1 | WINGS OF FIRE    |
|       2 | HARRY POTTER     |
|       3 | REVOLUTION 2020  |
|       4 | THE HOBBIT       |
|       5 | THE WAY OF KINGS |
|       6 | THE ALCHEMIST    |
+---------+------------------+
6 rows in set (0.002 sec)

mysql> UPDATE books
    -> SET author_name = TRIM (author_name);
ERROR 1054 (42S22): Unknown column 'author_name' in 'field list'
mysql> UPDATE books
    -> SET author_name = TRIM(author_name);
ERROR 1054 (42S22): Unknown column 'author_name' in 'field list'
mysql> 
mysql> SELECT TRIM(author_name) AS clean_author_name
    -> FROM books;
ERROR 1054 (42S22): Unknown column 'author_name' in 'field list'
mysql> SELECT TRIM(your_actual_column_name) AS clean_author_name
    -> FROM books;
ERROR 1054 (42S22): Unknown column 'your_actual_column_name' in 'field list'
mysql> UPDATE books 
    -> SET author = TRIM (author);
ERROR 1054 (42S22): Unknown column 'author' in 'field list'
mysql> 

Last login: Wed Sep 30 18:11:58 on ttys000
kevanshi@192 ~ % mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
Server version: 9.7.2 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE Libarary_smart;
Database changed
mysql> CREATE TABLE Authors (
    -> author_id INT PRIMARY KEY AUTO_INCREMENT,
    -> name VARCHAR(50),
    -> email VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.026 sec)

mysql> DESC Authors;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| author_id | int         | NO   | PRI | NULL    | auto_increment |
| name      | varchar(50) | YES  |     | NULL    |                |
| email     | varchar(50) | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
3 rows in set (0.019 sec)

mysql> CREATE TABLE Books(
    -> book_id INT PRIMARY KEY AUTO_INCREMENT,
    -> title VARCHAR(100) NOT NULL,
    -> author_id INT,
    -> category VARCHAR(50),
    -> isbn VARCHAR(20) UNIQUE,
    -> published_date DATE,
    -> price DECIMAL(10,2),
    -> available_copies INT<
    -> FOREIGN KEY (author_id) REFERENCES Authors (author_id) ON DELETE SET NULL
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '<
FOREIGN KEY (author_id) REFERENCES Authors (author_id) ON DELETE SET NULL
)' at line 9
mysql> CREATE TABLE Books(
    -> book_id INT PRIMARY KEY AUTO_INCREMENT,
    -> title VARCHAR(100) NOT NULL,
    -> author_id INT,
    -> category VARCHAR(50),
    -> isbn VARCHAR(20) UNIQUE,
    -> published_date DATE,
    -> price DECIMAL(10,2),
    -> available_copies INT,
    -> FOREIGN KEY (author_id) REFERENCES Authors (author_id) ON DELETE SET NULL
    -> );
Query OK, 0 rows affected (0.016 sec)

mysql> DESC Books;
+------------------+---------------+------+-----+---------+----------------+
| Field            | Type          | Null | Key | Default | Extra          |
+------------------+---------------+------+-----+---------+----------------+
| book_id          | int           | NO   | PRI | NULL    | auto_increment |
| title            | varchar(100)  | NO   |     | NULL    |                |
| author_id        | int           | YES  | MUL | NULL    |                |
| category         | varchar(50)   | YES  |     | NULL    |                |
| isbn             | varchar(20)   | YES  | UNI | NULL    |                |
| published_date   | date          | YES  |     | NULL    |                |
| price            | decimal(10,2) | YES  |     | NULL    |                |
| available_copies | int           | YES  |     | NULL    |                |
+------------------+---------------+------+-----+---------+----------------+
8 rows in set (0.004 sec)

mysql> CREATE TABLE Members (
    -> member_id INT PRIMARY KEY AUTO_INCREMENT,
    -> name VARCHAR(50) NOT NULL,
    -> email VARCHAR(100),
    -> phone_number VARCHAR(15),
    -> membership_date DATE
    -> );
Query OK, 0 rows affected (0.012 sec)

mysql> DESC Members;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| member_id       | int          | NO   | PRI | NULL    | auto_increment |
| name            | varchar(50)  | NO   |     | NULL    |                |
| email           | varchar(100) | YES  |     | NULL    |                |
| phone_number    | varchar(15)  | YES  |     | NULL    |                |
| membership_date | date         | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
5 rows in set (0.004 sec)

mysql> CREATE TABLE Transactions (
    -> transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    -> member_id INT,
    -> book_id INT,
    -> borrow_date DATE,
    -> return_date DATE,
    -> fine_amount DECIMAL(10,2),
    -> FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
    -> FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE 
    -> );
Query OK, 0 rows affected (0.018 sec)

mysql> DESC Transactions (
    -> transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    -> member_id INT,
    -> book_id INT,
    -> borrow_date DATE ,
    -> return_date DATE,
    -> ...;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(
transaction_id INT PRIMARY KEY AUTO_INCREMENT,
member_id INT,
book_id INT,
bor' at line 1
mysql> DESC Transactions;
+----------------+---------------+------+-----+---------+----------------+
| Field          | Type          | Null | Key | Default | Extra          |
+----------------+---------------+------+-----+---------+----------------+
| transaction_id | int           | NO   | PRI | NULL    | auto_increment |
| member_id      | int           | YES  | MUL | NULL    |                |
| book_id        | int           | YES  | MUL | NULL    |                |
| borrow_date    | date          | YES  |     | NULL    |                |
| return_date    | date          | YES  |     | NULL    |                |
| fine_amount    | decimal(10,2) | YES  |     | NULL    |                |
+----------------+---------------+------+-----+---------+----------------+
6 rows in set (0.002 sec)

mysql> INSERT INTO Authors (name,email) VALUES
    -> (>)
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '>)' at line 2
mysql> INSERT INTO Authors (author_id, name, email) VALUES
    -> (1, 'Jane Austen', 'jane.austen@email.com'),
    -> (2, 'George Orwell', 'george.orwell@email.com'),
    -> (3, 'Mark Twain', 'mark.twain@email.com'),
    -> (4, 'Agatha Christie', 'agatha.christie@email.com'),
    -> (5, 'Ernest Hemingway', 'ernest.hemingway@email.com');
Query OK, 5 rows affected (0.011 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Authors;
+-----------+------------------+----------------------------+
| author_id | name             | email                      |
+-----------+------------------+----------------------------+
|         1 | Jane Austen      | jane.austen@email.com      |
|         2 | George Orwell    | george.orwell@email.com    |
|         3 | Mark Twain       | mark.twain@email.com       |
|         4 | Agatha Christie  | agatha.christie@email.com  |
|         5 | Ernest Hemingway | ernest.hemingway@email.com |
+-----------+------------------+----------------------------+
5 rows in set (0.001 sec)

mysql> INSERT INTO Books (book_id, title, author_id, category, isbn, published_date, price, available_copies) VALUES
    -> (1, 'The Shadow of the Wind', 101, 'Fiction', '9780143034902', '2001-04-12', 18.99, 5),
    -> (2, 'A Brief History of Time', 102, 'Science', '9780553380163', '1988-03-01', 15.50, 3),
    -> (3, 'The Silent Patient', 103, 'Thriller', '9781250301697', '2019-02-05', 26.99, 8),
    -> (4, 'Sapiens', 104, 'History', '9780062316097', '2011-01-01', 22.00, 12),
    -> (5, 'Atomic Habits', 105, 'Self-Help', '9780735211292', '2018-10-16', 16.20, 15); 
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`libarary_smart`.`books`, CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL)
mysql> INSERT INTO Books 
    -> (book_id, title, author_id, category, isbn, published_date, price, available_copies) 
    -> VALUES
    -> (1, 'The Shadow of the Wind', 101, 'Fiction', '9780143034902', '2001-04-12', 18.99, 5),
    -> (2, 'A Brief History of Time', 102, 'Science', '9780553380163', '1988-03-01', 15.50, 3),
    -> (3, 'The Silent Patient', 103, 'Thriller', '9781250301697', '2019-02-05', 26.99, 8),
    -> (4, 'Sapiens', 104, 'History', '9780062316097', '2011-01-01', 22.00, 12),
    -> (5, 'Atomic Habits', 105, 'Self-Help', '9780735211292', '2018-10-16', 16.20, 15); 
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`libarary_smart`.`books`, CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL)
mysql> INSERT INTO Books (title, author_id, category, isbn, published_date, price, available_copies) VALUES
    -> ('Wings of Fire', 2, 'Science', 'ISBN001', '1999-01-01', 450.00, 5),
    -> ('Harry Potter', 3, 'Fantasy', 'ISBN002', '2005-06-26', 650.00, 3),
    -> ('Revolution 2020', 1, 'Fiction', 'ISBN003', '2016-03-10', 300.00, 4),
    -> ('Malgudi Days', 4, 'Fiction', 'ISBN004', '1943-01-01', 250.00, 0),
    -> ('Wise and Otherwise', 5, 'Non-Fiction', 'ISBN005', '2021-05-15', 220.00, 6);
Query OK, 5 rows affected (0.004 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Books;
+---------+--------------------+-----------+-------------+---------+----------------+--------+------------------+
| book_id | title              | author_id | category    | isbn    | published_date | price  | available_copies |
+---------+--------------------+-----------+-------------+---------+----------------+--------+------------------+
|       1 | Wings of Fire      |         2 | Science     | ISBN001 | 1999-01-01     | 450.00 |                5 |
|       2 | Harry Potter       |         3 | Fantasy     | ISBN002 | 2005-06-26     | 650.00 |                3 |
|       3 | Revolution 2020    |         1 | Fiction     | ISBN003 | 2016-03-10     | 300.00 |                4 |
|       4 | Malgudi Days       |         4 | Fiction     | ISBN004 | 1943-01-01     | 250.00 |                0 |
|       5 | Wise and Otherwise |         5 | Non-Fiction | ISBN005 | 2021-05-15     | 220.00 |                6 |
+---------+--------------------+-----------+-------------+---------+----------------+--------+------------------+
5 rows in set (0.003 sec)

mysql> INSERT INTO Members (name, email, phone_number, membership_date) VALUES
    -> ('Rahul', 'rahul@gmail.com', '9999999999', '2021-01-10'),
    -> ('Amit', NULL, '8888888888', '2023-05-20'),
    -> ('Neha', 'neha@gmail.com', '7777777777', '2019-11-15'),
    -> ('Kiran', 'kiran@gmail.com', '6666666666', '2024-01-01'),
    -> ('Priya', 'priya@gmail.com', '5555555555', '2018-06-12');
Query OK, 5 rows affected (0.003 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Members;
+-----------+-------+-----------------+--------------+-----------------+
| member_id | name  | email           | phone_number | membership_date |
+-----------+-------+-----------------+--------------+-----------------+
|         1 | Rahul | rahul@gmail.com | 9999999999   | 2021-01-10      |
|         2 | Amit  | NULL            | 8888888888   | 2023-05-20      |
|         3 | Neha  | neha@gmail.com  | 7777777777   | 2019-11-15      |
|         4 | Kiran | kiran@gmail.com | 6666666666   | 2024-01-01      |
|         5 | Priya | priya@gmail.com | 5555555555   | 2018-06-12      |
+-----------+-------+-----------------+--------------+-----------------+
5 rows in set (0.001 sec)

mysql> INSERT INTO Transactions (member_id, book_id, borrow_date, return_date, fine_amount) VALUES
    -> (1, 1, '2024-01-01', '2024-01-10', 0.00),
    -> (1, 2, '2024-02-01', '2024-02-20', 50.00),
    -> (2, 1, '2024-03-01', NULL, 0.00),
    -> (3, 3, '2023-05-10', '2023-05-20', 0.00),
    -> (1, 3, '2024-06-01', '2024-06-15', 10.00),
    -> (1, 1, '2024-07-01', '2024-07-10', 0.00);
Query OK, 6 rows affected (0.003 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Transactions;
+----------------+-----------+---------+-------------+-------------+-------------+
| transaction_id | member_id | book_id | borrow_date | return_date | fine_amount |
+----------------+-----------+---------+-------------+-------------+-------------+
|              1 |         1 |       1 | 2024-01-01  | 2024-01-10  |        0.00 |
|              2 |         1 |       2 | 2024-02-01  | 2024-02-20  |       50.00 |
|              3 |         2 |       1 | 2024-03-01  | NULL        |        0.00 |
|              4 |         3 |       3 | 2023-05-10  | 2023-05-20  |        0.00 |
|              5 |         1 |       3 | 2024-06-01  | 2024-06-15  |       10.00 |
|              6 |         1 |       1 | 2024-07-01  | 2024-07-10  |        0.00 |
+----------------+-----------+---------+-------------+-------------+-------------+
6 rows in set (0.001 sec)

mysql> SELECT * FROM 
    -> >;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '>' at line 2
mysql> UPDATE Books 
    -> SET available_copies = available_copies - 1
    -> WHERE book_id = 1;
Query OK, 1 row affected (0.009 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM Members 
    -> WHERE member_id NOT IN (
    -> SELECT member_id FROM (
    -> SELECT DISTINCT member_id
    -> FROM Transactions
    -> WHERE borrow_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    -> ) AS temp
    -> );
Query OK, 5 rows affected (0.020 sec)

mysql> SELECT * FROM Members;
Empty set (0.000 sec)

mysql> SELECT * FROM Members;
Empty set (0.000 sec)

mysql> SELECT * FROM Books ORDER BY price DESC LIMIT 5;
+---------+--------------------+-----------+-------------+---------+----------------+--------+------------------+
| book_id | title              | author_id | category    | isbn    | published_date | price  | available_copies |
+---------+--------------------+-----------+-------------+---------+----------------+--------+------------------+
|       2 | Harry Potter       |         3 | Fantasy     | ISBN002 | 2005-06-26     | 650.00 |                3 |
|       1 | Wings of Fire      |         2 | Science     | ISBN001 | 1999-01-01     | 450.00 |                4 |
|       3 | Revolution 2020    |         1 | Fiction     | ISBN003 | 2016-03-10     | 300.00 |                4 |
|       4 | Malgudi Days       |         4 | Fiction     | ISBN004 | 1943-01-01     | 250.00 |                0 |
|       5 | Wise and Otherwise |         5 | Non-Fiction | ISBN005 | 2021-05-15     | 220.00 |                6 |
+---------+--------------------+-----------+-------------+---------+----------------+--------+------------------+
5 rows in set (0.000 sec)

mysql> SELECT * FROM Members WHERE membership_date < '2022-01-01';
Empty set (0.001 sec)

mysql> SELECT * FROM Books ORDER BY 
    -> price DESC LIMMIT 5;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'LIMMIT 5' at line 2
mysql> SELECT * FROM Books ORDER BY
    -> price DESC LIMIT 5;
+---------+--------------------+-----------+-------------+---------+----------------+--------+------------------+
| book_id | title              | author_id | category    | isbn    | published_date | price  | available_copies |
+---------+--------------------+-----------+-------------+---------+----------------+--------+------------------+
|       2 | Harry Potter       |         3 | Fantasy     | ISBN002 | 2005-06-26     | 650.00 |                3 |
|       1 | Wings of Fire      |         2 | Science     | ISBN001 | 1999-01-01     | 450.00 |                4 |
|       3 | Revolution 2020    |         1 | Fiction     | ISBN003 | 2016-03-10     | 300.00 |                4 |
|       4 | Malgudi Days       |         4 | Fiction     | ISBN004 | 1943-01-01     | 250.00 |                0 |
|       5 | Wise and Otherwise |         5 | Non-Fiction | ISBN005 | 2021-05-15     | 220.00 |                6 |
+---------+--------------------+-----------+-------------+---------+----------------+--------+------------------+
5 rows in set (0.001 sec)

mysql> SELECT * FROM Members
    -> WHERE
    -> membership_date < '2022-01-01';
Empty set (0.001 sec)

mysql> SELECT * FROM Books 
    -> WHERE 
    -> category = 'Science' AND price < 500;
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title         | author_id | category | isbn    | published_date | price  | available_copies |
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
|       1 | Wings of Fire |         2 | Science  | ISBN001 | 1999-01-01     | 450.00 |                4 |
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
1 row in set (0.004 sec)

mysql> SELECT * FROM Books
    -> WHERE
    -> NOT available_copies > 0;
+---------+--------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title        | author_id | category | isbn    | published_date | price  | available_copies |
+---------+--------------+-----------+----------+---------+----------------+--------+------------------+
|       4 | Malgudi Days |         4 | Fiction  | ISBN004 | 1943-01-01     | 250.00 |                0 |
+---------+--------------+-----------+----------+---------+----------------+--------+------------------+
1 row in set (0.001 sec)

mysql> SELECT m.member_id , m.name
    -> FROM Members m
    -> LEFT JOIN Transactions t ON m.member_id = t.member_id
    -> GROUP BY m.member_id
    -> HAVING m.membership_date > '2020-01-01'
    -> OR COUNT (t.transaction_id) > 3;
ERROR 1054 (42S22): Unknown column 'm.membership_date' in 'having clause'
mysql> SELECT m.member_id, m.name
    -> FROM Members m
    -> LEFT JOIN Transactions t ON m.member_id = t.member_id
    -> GROUP BY m.member_id
    -> HAVING m.membership_date > '2020-01-01'
    -> OR COUNT(t.transaction_id) > 3;
ERROR 1054 (42S22): Unknown column 'm.membership_date' in 'having clause'
mysql> SELECT m.member_id,m.name,
    -> m.membership_date,
    -> COUNT(t.transaction_id)AS
    -> total_borrows 
    -> FROM Members m
    -> LEFT JOIN Transactions t ON 
    -> m.member_id = t.member_id
    -> GROUP BY m.member_id, m.name,
    -> m.membership_date
    -> HAVING m.membership_date>'2022-12-31'OR
    -> COUNT (t.transaction_id) > 3;
ERROR 1630 (42000): FUNCTION libarary_smart.COUNT does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> SELECT m.member_id,
    ->  m.name,
    ->  m.membership_date,
    -> COUNT(t.transaction_id) AS total_borrows
    -> FROM Members m
    -> LEFT JOIN Transactions t
    -> ON m.member_id = t.member_id
    -> GROUP BY m.member_id, m.name, m.membership_date
    -> HAVING m.membership_date > '2022-12-31'
    -> OR COUNT(t.transaction_id) > 3;
Empty set (0.002 sec)

mysql> SELECT * FROM Books ORDER BY title ASC;
+---------+--------------------+-----------+-------------+---------+----------------+--------+------------------+
| book_id | title              | author_id | category    | isbn    | published_date | price  | available_copies |
+---------+--------------------+-----------+-------------+---------+----------------+--------+------------------+
|       2 | Harry Potter       |         3 | Fantasy     | ISBN002 | 2005-06-26     | 650.00 |                3 |
|       4 | Malgudi Days       |         4 | Fiction     | ISBN004 | 1943-01-01     | 250.00 |                0 |
|       3 | Revolution 2020    |         1 | Fiction     | ISBN003 | 2016-03-10     | 300.00 |                4 |
|       1 | Wings of Fire      |         2 | Science     | ISBN001 | 1999-01-01     | 450.00 |                4 |
|       5 | Wise and Otherwise |         5 | Non-Fiction | ISBN005 | 2021-05-15     | 220.00 |                6 |
+---------+--------------------+-----------+-------------+---------+----------------+--------+------------------+
5 rows in set (0.001 sec)

mysql> SELECT member_id, COUNT(*) AS 
    -> total_borrowed FROM
    -> Transactions
    -> GROUP BY member_id;
Empty set (0.001 sec)

mysql> SELECT category, COUNT(*) AS 
    -> total_books
    -> FROM Books
    -> GROUP BY category;
+-------------+-------------+
| category    | total_books |
+-------------+-------------+
| Science     |           1 |
| Fantasy     |           1 |
| Fiction     |           2 |
| Non-Fiction |           1 |
+-------------+-------------+
4 rows in set (0.001 sec)

mysql> SELECT category, COUNT(*) AS total_books FROM Books GROUP BY category;
+-------------+-------------+
| category    | total_books |
+-------------+-------------+
| Science     |           1 |
| Fantasy     |           1 |
| Fiction     |           2 |
| Non-Fiction |           1 |
+-------------+-------------+
4 rows in set (0.001 sec)

mysql> SELECT AVG(price) AS avg_book_price FROM Books;
+----------------+
| avg_book_price |
+----------------+
|     374.000000 |
+----------------+
1 row in set (0.003 sec)

mysql> SELECT book_id, COUNT(*) AS 
    -> times_borrowed
    -> FROM Transactions
    -> GROUP BY book_id
    -> ORDER BY times_borrowed DESC LIMIT 1;
Empty set (0.001 sec)

mysql> SELECT SUM(fine_amount) AS total_fines FROM Transactions;
+-------------+
| total_fines |
+-------------+
|        NULL |
+-------------+
1 row in set (0.002 sec)

mysql> SELECT b.book_id,b._title,a.name
    -> AS author_name FROM BOoks b
    -> INNER JOIN Authors a ON On
    -> b.author_id = a.author_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'On
b.author_id = a.author_id' at line 3
mysql> SELECT b.book_id,
    -> b.title,
    -> a.name AS author_name
    -> FROM Books b
    -> INNER JOIN Authors a
    -> ON b.author_id = a.author_id;
+---------+--------------------+------------------+
| book_id | title              | author_name      |
+---------+--------------------+------------------+
|       1 | Wings of Fire      | George Orwell    |
|       2 | Harry Potter       | Mark Twain       |
|       3 | Revolution 2020    | Jane Austen      |
|       4 | Malgudi Days       | Agatha Christie  |
|       5 | Wise and Otherwise | Ernest Hemingway |
+---------+--------------------+------------------+
5 rows in set (0.001 sec)

mysql> SELECT  m.member_id, m.name, t.transaction_id,
    -> t.book_id,
    -> t.borrow_date
    -> FROM Members m
    -> LEFT JOIN Transactions t ON
    -> m.member_id = t.member_id;
Empty set (0.000 sec)

mysql> SELECT b.book_id, b.title,
    -> t.transaction_id FROM 
    -> Transaction_id FROM Transaction t
    -> RIGHT JOIN Books b ON t.book_id
    -> = b.book_id WHERE t.transaction_id IS NULL;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM Transaction t
RIGHT JOIN Books b ON t.book_id
= b.book_id WHERE t.transacti' at line 3
mysql> SELECT b.book_id, b.title,
    -> t.transaction_id
    -> FROM Transactions t
    -> RIGHT JOIN Books b
    -> ON t.book_id = b.book_id
    -> WHERE t.transaction_id IS NULL;
+---------+--------------------+----------------+
| book_id | title              | transaction_id |
+---------+--------------------+----------------+
|       1 | Wings of Fire      |           NULL |
|       2 | Harry Potter       |           NULL |
|       3 | Revolution 2020    |           NULL |
|       4 | Malgudi Days       |           NULL |
|       5 | Wise and Otherwise |           NULL |
+---------+--------------------+----------------+
5 rows in set (0.001 sec)

mysql> SELECT m.member_id,m.name FROM Members m
    -> LEFT JOIN Transactions t ON m.member_id = t.member_id 
    -> WHERE t.transaction_id IS NULL;
Empty set (0.001 sec)

mysql> SELECT 8 FROM Books 
    -> WHERE book_id IN (
    -> SELECT,,;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',,' at line 3
mysql> SELECT * FROM Books 
    -> WHERE book_id IN (
    -> SELECT DISTINCT book_id 
    -> FROM Transactions
  [Bookmarked 30 Sep 2026 at 10:54:48 PM]
    -> WHERE member_id IN (
    -> SELECT member_id FROM Members WHERE membership_date > '2022-12-31'
    -> )
    -> );
Empty set (0.006 sec)

mysql> SELECT * FROM Books
    -> WHERE book_id = (
    -> SELECT book_id 
    -> FROM Transactions
    -> GROUP BY book_id
    -> ORDER BY COUNT(*)DESC 
    -> LIMIT 1
    -> );
Empty set (0.004 sec)

mysql> SELECT * FROM Members WHERE member_id NOT IN (
    -> SELECT DISTINCT member_id 
    -> FROM Transactions WHERE member_id IS NOT NULL
    -> );
Empty set (0.001 sec)

mysql> SELECT YEAR(published_date) AS
    -> pub_year, COUNT(*) AS
    -> book_count
    -> FROM Books
    -> GROUP BY YEAR(published_date);
+----------+------------+
| pub_year | book_count |
+----------+------------+
|     1999 |          1 |
|     2005 |          1 |
|     2016 |          1 |
|     1943 |          1 |
|     2021 |          1 |
+----------+------------+
5 rows in set (0.002 sec)

mysql> SELECT transaction_id,
    -> borrow_date, return_date,
    -> DATEDIFF(return_date, borrow_date)AS
    -> days_borrowed
    -> FROM Transactions
    -> WHERE return_date IS NOT NULL;
Empty set (0.003 sec)

mysql> SELECT transaction_id, DATE_FORMAT(borrow_date, '%d-%m-%Y')AS
    -> formatted_borrow_date
    -> FROM Transactions;
Empty set (0.002 sec)

mysql> SELECT UPPER(title) AS clean_author_name FROM 
    -> Authors;
ERROR 1054 (42S22): Unknown column 'title' in 'field list'
mysql> SELECT TRIM(name) AS clean_author_name FROM Authors;
+-------------------+
| clean_author_name |
+-------------------+
| Jane Austen       |
| George Orwell     |
| Mark Twain        |
| Agatha Christie   |
| Ernest Hemingway  |
+-------------------+
5 rows in set (0.001 sec)

mysql> SELECT member_id, name, IFNULL (email,'Not Provided') AS
    -> email_status FROM Members;
Empty set (0.001 sec)

mysql> SELECT book_id, COUNT(*) AS total_borrows
    -> ,
    -> RANK() OVER ORDER BY (ORDER BY COUNT (*) DESC) AS book_rank FROM Transactions GROUP BY 
    -> book_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ORDER BY (ORDER BY COUNT (*) DESC) AS book_rank FROM Transactions GROUP BY 
book' at line 3
mysql> SELECT book_id, COUNT(*) AS total_borrows,
    ->        RANK() OVER (ORDER BY COUNT(*) DESC) AS book_rank
    -> FROM Transactions
    -> GROUP BY book_id;
Empty set (0.004 sec)

mysql> SELECT member_id,
    -> borrow_date,
    -> COUNT (*) OVER (PARTITION BY member_id ORDER BY borrow_date,)
    -> ..;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '*) OVER (PARTITION BY member_id ORDER BY borrow_date,)
..' at line 3
mysql> SELECT member_id, borrow_date,
    -> COUNT(*) OVER 
    -> (PARTITION BY member_id ORDER BY borrow_date) AS cumulative_borrows
    -> FROM Transactions;
Empty set (0.002 sec)

mysql> SELECT borrow_date,
    ->  COUNT(*) OVER (ORDER BY borrow_date RANGE BETWEEN INTERVAL 3 MONTH PRECEDING AND CURRENT ROW) AS moving_avg_borrows
    -> FROM Transactions;
Empty set (0.001 sec)

mysql> SELECT m.member_id, m.name,
    -> CASE WHEN MAX(CURDATE(), INTERVAL 6 MONTH ) THEN 'Active'
    -> ELSE AS Membership_Stuts
    -> FROM Members m
    -> LEFT JOIN
    -> Transactions t ON
    -> m.member_id = t.member_id,
    -> m.name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', INTERVAL 6 MONTH ) THEN 'Active'
ELSE AS Membership_Stuts
FROM Members m
LEFT ' at line 2
mysql> SELECT m.member_id, m.name,
    -> CASE 
    -> WHEN MAX(t.borrow_date) >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH) THEN Active'
    '> '
    ->  ELSE 'Inactive'
    ->     END AS Membership_Status
    -> FROM Members m
    -> LEFT JOIN Transactions t ON m.member_id = t.member_id
    -> GROUP BY m.member_id, m.name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''
'
 ELSE 'Inactive'
    END AS Membership_Status
FROM Members m
LEFT JOIN Trans' at line 3
mysql> SELECT m.member_id, m.name,
    ->     CASE 
    ->         WHEN MAX(t.borrow_date) >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH) THEN 'Active'
    ->         ELSE 'Inactive'
    ->     END AS Membership_Status
    -> FROM Members m
    -> LEFT JOIN Transactions t ON m.member_id = t.member_id
    -> GROUP BY m.member_id, m.name;
Empty set (0.002 sec)

mysql> SELECT title, published_date,
    -> CASE
    -> WHEN YEAR(published_date) > 2020 THEN 'New Arrival'
    -> WHEN YEAR (published_date) < 2000
    -> THEN 'Classic'
    -> ELSE 'Regular'
    -> END AS book_category
    -> FROM Books;
+--------------------+----------------+---------------+
| title              | published_date | book_category |
+--------------------+----------------+---------------+
| Wings of Fire      | 1999-01-01     | Classic       |
| Harry Potter       | 2005-06-26     | Regular       |
| Revolution 2020    | 2016-03-10     | Regular       |
| Malgudi Days       | 1943-01-01     | Classic       |
| Wise and Otherwise | 2021-05-15     | New Arrival   |
+--------------------+----------------+---------------+
5 rows in set (0.001 sec)

mysql> 

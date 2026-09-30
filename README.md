# 📚 Smart Library Management System

A **MySQL-based Smart Library Management System** designed to manage books, authors, library members, and borrowing transactions efficiently.

This project demonstrates practical **SQL and database management concepts**, including database creation, table relationships, constraints, CRUD operations, joins, aggregate functions, subqueries, date functions, conditional logic, and window functions.

---

## 🚀 Project Overview

The Smart Library database manages four core entities:

* 👨‍💼 **Authors** – Stores author information.
* 📚 **Books** – Maintains book details, categories, pricing, and availability.
* 👥 **Members** – Stores library member information.
* 🔄 **Transactions** – Records book borrowing and returning activities.

The database uses **Primary Keys and Foreign Keys** to maintain relationships between these entities.

---

## 🗂️ Database Structure

```text
SMART_LIBRARY
│
├── Authors
│   ├── author_id (PK)
│   ├── name
│   └── email
│
├── Books
│   ├── book_id (PK)
│   ├── title
│   ├── author_id (FK)
│   ├── category
│   ├── isbn
│   ├── published_date
│   ├── price
│   └── available_copies
│
├── Members
│   ├── member_id (PK)
│   ├── name
│   ├── email
│   ├── phone_number
│   └── membership_date
│
└── Transactions
    ├── transaction_id (PK)
    ├── member_id (FK)
    ├── book_id (FK)
    ├── borrow_date
    ├── return_date
    └── fine_amount
```

---

## 🔗 Entity Relationships

```text
Authors
   │
   │ 1 ──────── N
   ▼
 Books
   │
   │ 1 ──────── N
   ▼
Transactions
   ▲
   │ N
   │
   │ 1
Members
```

### Relationships

* One author can have multiple books.
* One member can have multiple transactions.
* One book can appear in multiple transactions.
* Foreign keys maintain referential integrity.
* `ON DELETE CASCADE` is used between Members/Transactions and Books/Transactions.
* `ON DELETE SET NULL` is used for the Books → Authors relationship.

---

## 🛠️ Technologies Used

| Technology              | Purpose                        |
| ----------------------- | ------------------------------ |
| **MySQL**               | Database management            |
| **SQL**                 | Data manipulation and analysis |
| **Relational Database** | Structured data storage        |
| **GitHub**              | Project version control        |

---

## 📌 SQL Concepts Covered

### 1. Database & Table Creation

* `CREATE DATABASE`
* `CREATE TABLE`
* `DESC`
* Primary Keys
* Foreign Keys
* `AUTO_INCREMENT`
* `NOT NULL`
* `UNIQUE`
* `DECIMAL`
* `DATE`

### 2. Data Manipulation

* `INSERT`
* `SELECT`
* `UPDATE`
* `DELETE`

The project includes inserting sample records for authors, books, members, and transactions.

---

## 🔍 Data Analysis

The project demonstrates SQL analysis using:

### Filtering

```sql
WHERE
AND
OR
NOT
```

### Sorting

```sql
ORDER BY
LIMIT
```

### Aggregation

```sql
COUNT()
SUM()
AVG()
```

### Grouping

```sql
GROUP BY
HAVING
```

For example, books are grouped by category to determine the number of books in each category.

---

## 🔄 SQL Joins

The project demonstrates relational data retrieval using:

* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`

Example:

```sql
SELECT b.book_id,
       b.title,
       a.name AS author_name
FROM Books b
INNER JOIN Authors a
ON b.author_id = a.author_id;
```

This connects books with their corresponding authors.

---

## 🧠 Subqueries

The project includes subqueries for analyzing:

* Borrowed books
* Members
* Frequently borrowed books
* Members without transactions

Example concepts:

```sql
IN
NOT IN
GROUP BY
ORDER BY
LIMIT
```

---

## 📅 Date & Time Functions

The project uses MySQL date functions such as:

```sql
YEAR()
DATEDIFF()
DATE_FORMAT()
DATE_SUB()
CURDATE()
```

These can be used to analyze borrowing periods, publication years, and membership activity.

---

## 🔤 String Functions

The project demonstrates string cleaning and transformation using:

```sql
UPPER()
TRIM()
IFNULL()
```

Example:

```sql
SELECT TRIM(name) AS clean_author_name
FROM Authors;
```

---

## 🧮 Conditional Logic

`CASE` expressions are used to classify books based on publication year.

```sql
CASE
    WHEN YEAR(published_date) > 2020 THEN 'New Arrival'
    WHEN YEAR(published_date) < 2000 THEN 'Classic'
    ELSE 'Regular'
END
```

This categorizes books into **New Arrival, Classic, and Regular** groups.

---

## 📊 Window Functions

The project also explores advanced SQL analytics with:

* `RANK() OVER()`
* `COUNT() OVER()`
* `PARTITION BY`
* `ORDER BY` inside window functions
* Cumulative calculations
* Moving-window analysis

Example structure:

```sql
RANK() OVER (
    ORDER BY COUNT(*) DESC
)
```

---

## 🧪 Error Handling & Debugging

An important part of the project is troubleshooting SQL errors.

Examples include:

* Syntax errors
* Foreign key constraint errors
* Incorrect column names
* Incorrect function syntax
* Invalid joins
* Misspelled SQL keywords
* Incorrect `GROUP BY` / `HAVING` usage

For example, an initial Books insertion failed because the supplied `author_id` values did not exist in the Authors table.

The project then corrected the data using valid foreign-key values.

---

## 📈 Sample Analysis

The database demonstrates analytical queries such as:

* Finding the most expensive books
* Finding unavailable books
* Counting books by category
* Calculating average book price
* Finding books without transactions
* Identifying members without borrowing activity
* Grouping books by publication year
* Calculating borrowing duration
* Classifying books based on publication year

Example result from the project:

```text
Category       Total Books
--------------------------
Science             1
Fantasy             1
Fiction             2
Non-Fiction         1
```

---

## 🎯 Learning Outcomes

Through this project, the following skills are demonstrated:

* Relational database design
* SQL query writing
* Database normalization concepts
* Primary and foreign key implementation
* Referential integrity
* CRUD operations
* Filtering and sorting
* Aggregation and grouping
* SQL joins
* Subqueries
* Date and string functions
* Conditional expressions
* Window functions
* SQL debugging and error handling

---

## 💡 Future Enhancements

Possible extensions include:

* 📊 Library analytics dashboard
* 🔐 User authentication
* 📖 Automatic book availability management
* 💰 Automatic fine calculation
* 🔔 Overdue-book notifications
* 📈 Borrowing trend reports
* 👤 Member activity dashboard
* 📚 Book recommendation system
* 🌐 Web-based library interface

---

## 👩‍💻 Project Purpose

This project is created as a practical demonstration of **MySQL, SQL querying, relational database concepts, and data analysis** through a real-world library management scenario.

It focuses on transforming raw library data into structured and meaningful information using SQL.

---

## ⭐ Key Highlights

```text
✔ Relational Database Design
✔ 4 Connected Tables
✔ Primary & Foreign Keys
✔ CRUD Operations
✔ Multiple JOIN Types
✔ Aggregate Functions
✔ GROUP BY & HAVING
✔ Subqueries
✔ Date Functions
✔ String Functions
✔ CASE Statements
✔ Window Functions
✔ SQL Error Debugging
✔ Data Analysis
```

---

## 📄 License

This project is created for **educational and learning purposes**.


# 📚 Library Management System – SQL Project

## 📌 Project Overview

The **Library Management System** is a MySQL-based database project designed to manage library operations efficiently.

This project demonstrates how a relational database can be designed and used to manage information about books, authors, library members, and book transactions.

The project focuses on practical implementation of SQL concepts including database creation, table relationships, data manipulation, joins, aggregate functions, subqueries, and other advanced SQL operations.

---

## 🎯 Project Objectives

- Create and manage a relational library database.
- Store and manage author information.
- Store and manage book information.
- Maintain library member records.
- Track book borrowing and returning transactions.
- Calculate fines for returned books.
- Perform data analysis using SQL queries.
- Demonstrate relationships between multiple tables.
- Practice both basic and advanced SQL concepts.

---

## 🗂️ Database Structure

The database contains the following main tables:

### 1. Authors
Stores information about book authors.

**Columns:**
- `author_id`
- `name`
- `email`

### 2. Books
Stores information about books available in the library.

**Columns:**
- `book_id`
- `title`
- `author_id`
- `category`
- `isbn`
- `published_date`
- `price`
- `available_copies`

### 3. Members
Stores information about library members.

**Columns:**
- `member_id`
- `name`
- `email`
- `phone_number`
- `membership_date`

### 4. Transactions
Stores book borrowing and returning information.

**Columns:**
- `transaction_id`
- `member_id`
- `book_id`
- `borrow_date`
- `return_date`
- `fine_amount`

The database uses **Primary Keys** and **Foreign Keys** to establish relationships between tables. The `Books` table is related to `Authors`, while `Transactions` connects `Members` and `Books`.

---

## 🔗 Database Relationships

```text
Authors
   │
   │ author_id
   ▼
Books
   │
   │ book_id
   ▼
Transactions
   ▲
   │ member_id
   │
Members

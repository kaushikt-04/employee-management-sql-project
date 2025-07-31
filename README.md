# 🧾 Employee Management System (SQL Project)

This is a simple Employee Management System built with SQL. The system allows you to manage employee data such as name, email, phone number, gender, date of joining, and designation. It uses MySQL as the database engine and supports data insertion through a CSV file.

---

## 📁 Project Files

| File | Description |
|------|-------------|
| `Employee Management System.sql` | SQL script that creates the database and tables |
| `output_dataset.csv` | CSV file containing sample employee records |
| `README.md` | Project documentation (this file) |

---

## 🗃️ Database Schema

The project uses a single table:

### Table: `employee`

| Column Name       | Data Type     | Description                      |
|-------------------|---------------|----------------------------------|
| `employee_id`     | INT (AUTO_INCREMENT) | Unique employee ID (Primary Key) |
| `name`            | VARCHAR(100)  | Name of the employee             |
| `email`           | VARCHAR(100)  | Email address                    |
| `phone_number`    | VARCHAR(15)   | Phone number                     |
| `gender`          | VARCHAR(10)   | Gender of the employee           |
| `date_of_joining` | DATE          | Date the employee joined         |
| `designation`     | VARCHAR(100)  | Employee’s job title             |

---

## 📊 Sample Data

Here are a few sample entries from the dataset:

| Worker_id | First_Name | Last_Name | Salary | Joining_date         | Department |
|-----------|------------|-----------|--------|----------------------|------------|
| 2         | Niharika   | Verma     | 80000  | 2014-06-11 09:00:00  | Admin      |
| 4         | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00  | Admin      |
| 6         | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00  | Account    |
| 8         | Geetika    | Chauhan   | 90000  | 2014-02-11 09:00:00  | Admin      |


---

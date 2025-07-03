#  Task 7: Creating Views in SQL

##  Objective
Learn to create and use **Views** in SQL to enhance abstraction, security, and reusability of complex queries.

---

##  What is a View?

A **View** is a **virtual table** based on the result of a `SELECT` query. It does not store data itself but displays data stored in underlying tables.

###  Benefits of Views:
- **Abstraction**: Hides complex SQL logic.
- **Security**: Restrict access to sensitive data.
- **Reusability**: Write complex queries once, reuse many times.
- **Simplicity**: Querying a view is just like querying a table.

---

##  Syntax: Creating a View

###  Basic Syntax:
```sql
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

###  Example (Students View):
```sql
CREATE VIEW top_students AS
SELECT student_id, name, marks
FROM students
WHERE marks > 90;
```

---

##  Using the View

###  Query a View like a Table:
```sql
SELECT * FROM top_students;
```

---

##  Dropping a View

###  Syntax:
```sql
DROP VIEW view_name;
```

###  Example:
```sql
DROP VIEW top_students;
```

---

##  Modifying a View (MySQL Only)

In MySQL, to modify a view:
```sql
CREATE OR REPLACE VIEW view_name AS
SELECT ...
```


---


##  Outcome
- understand how to **create**, **use**, and **manage views** in SQL.
- can use views to **simplify complex logic**, **reuse queries**, and **protect sensitive data**.

---

## Tools You Can Use:
- MySQL Workbench


---


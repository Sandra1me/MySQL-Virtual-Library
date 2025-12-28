# Virtual Library (MySQL)

## Overview

Virtual Library is a relational database project built with **MySQL** that models the core functionality of a library system.  
It manages users, books, writers, and book loans, including loan status, expected return dates, and delayed bookings.

This project was developed as a **beginner-to-junior level MySQL portfolio project**, focusing on database design, relationships, and query practice.

## Database Schema

The database consists of the following tables:

- **users** – library users
- **books** – books available in the library
- **writer** – book authors
- **book_writer** – junction table for the N:M relationship between books and writers
- **bookings** – book loans with dates and status

### Relationships

- A book can have multiple writers (N:M)
- A user can book multiple books
- Each booking references exactly one user and one book

All relationships are enforced using **FOREIGN KEY constraints**.

## Features

- Relational database design with normalized tables
- Many-to-many relationship using a junction table
- Book loan management with:
  - booking date
  - expected return date
  - real return date
  - loan status (borrowed / returned)
- Detection of delayed bookings
- Aggregated queries:
  - most booked books
  - users with the most bookings
- Referential integrity using `FOREIGN KEY`
- Use of `JOIN`, `GROUP BY`, `GROUP_CONCAT`, and date functions

## Technologies Used

- **MySQL 8.0.44**
- **MySQL Workbench**

## Project Structure

/sql

├── virtual_library_schema.sql -- database schema and constraints

├── data.sql -- example data inserts

└── views.sql -- optional views (active bookings, etc.)

## How to Run the Project

1. Create the database and tables:

```sql
SOURCE virtual_library_schema.sql;
```

2. Insert sample data:

```sql
SOURCE data.sql;
```

(Optional) Create views:

```sql
SOURCE views.sql;
```



Use the package manager [pip](https://pip.pypa.io/en/stable/) to install foobar.

```bash
pip install foobar
```

## Example Queries

- List all books with their writers
- Show all currently borrowed books with user information
- Find the most booked books
- Detect delayed bookings and calculate delay in days

## Possible Improvements

- Triggers to prevent bookings when no copies are available
- Stored procedures for booking and returning books
- User roles and permissions

## License

This project is released under the [MIT Licence](https://choosealicense.com/licenses/mit/).

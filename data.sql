-- DELETE ALL
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE book_writer;
TRUNCATE TABLE bookings;
TRUNCATE TABLE books;
TRUNCATE TABLE writer;
TRUNCATE TABLE users;

SET FOREIGN_KEY_CHECKS = 1;

-- -------------------------------------------------------------

-- DUMMY DATA
-- users
INSERT INTO users (name, email) VALUES
('Ana Pérez','ana@example.com'),
('Carlos Ruiz','carlos@example.com'),
('Lucía Gómez','lucia@example.com');

-- writers
INSERT INTO writer (name) VALUES
('Gabriel García Márquez'),
('Isaac Asimov'),
('J. K. Rowling');

-- books
INSERT INTO books (title, isbn, public_year, amount) VALUES
('Cien años de soledad','978-3-16-148410-0',1967,2),
('Fundación','978-0-123456-47-2',1951,3),
('Harry Potter y la piedra filosofal','978-0-987654-32-1',1997,4);

-- relationship book <--> writer
INSERT INTO book_writer (book_id, writer_id) VALUES
(1,1),  -- Cien años -> GGM
(2,2),  -- Fundación -> Asimov
(3,3);  -- Harry Potter -> Rowling

-- SAMPLE BOOKINGS
-- Ana booked book 1, return in 14 days
INSERT INTO bookings (user_id, book_id, booking_date, expect_return_date) VALUES
(1,1, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY) );

-- Carlos booked book 2, returned
INSERT INTO bookings (user_id, book_id, booking_date, expect_return_date, real_return_date, state) VALUES
(2,2, '2025-10-20', '2025-11-03', '2025-10-30', 'R');
-- CHECKS
-- 01 Show all books with authors
SELECT b.idbooks, b.title, GROUP_CONCAT(w.name SEPARATOR ', ') AS writer, b.isbn, b.public_year, b.amount
FROM books b 
LEFT JOIN book_writer bw ON b.idbooks = bw.book_id
LEFT JOIN writer w ON bw.writer_id = w.idwriter
GROUP BY b.idbooks, b.title, b.isbn, b.public_year, b.amount;

-- 02 Booked books (State = B) with users info
SELECT bk.id_bookings AS id_bookings, u.name AS users, b.title, bk.booking_date, bk.expect_return_date
FROM bookings bk
JOIN users u ON bk.user_id = u.id_users
JOIN books b ON bk.book_id = b.idbooks
WHERE bk.state = 'B';

-- 03 Check user with most books rented
SELECT u.id_users, u.name, COUNT(*) AS total_bookings
FROM bookings bk
JOIN users u ON bk.user_id = u.id_users
GROUP BY u.id_users, u.name
ORDER BY total_bookings DESC;

-- 04 Most booked books
SELECT b.idbooks, b.title, COUNT(bk.id_bookings) AS booked_number
FROM books b
LEFT JOIN bookings bk ON b.idbooks = bk.book_id
GROUP BY b.idbooks, b.title
ORDER BY booked_number DESC;

-- 05 Check delayed bookings
SELECT b.idbooks, u.name, b.title, bk.booking_date, bk.expect_return_date,
DATEDIFF(CURDATE(), bk.expect_return_date) AS delay_days
FROM bookings bk
JOIN users u ON bk.user_id = u.id_users
JOIN books b ON bk.book_id = b.idbooks
WHERE bk.state = 'B' AND bk.expect_return_date < CURDATE();

-- 06 Check available books for booking
SELECT b.title, b.amount - COUNT(bk.id_bookings) AS available
FROM books b
LEFT JOIN bookings bk
  ON b.idbooks = bk.book_id AND bk.state = 'B'
GROUP BY b.idbooks, b.title, b.amount;
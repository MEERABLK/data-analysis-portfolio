CREATE DATABASE Library_System;
USE Library_System;

CREATE TABLE Authors(
AuthorID INT PRIMARY KEY,
AuthorName VARCHAR(50) NOT NULL
);


CREATE TABLE Books(
ISBN INT PRIMARY KEY,
Title VARCHAR(13) NOT NULL,
AuthorID INT,
FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);


CREATE TABLE Members(
MemberID INT PRIMARY KEY,
Name VARCHAR(50),
Email VARCHAR(50) UNIQUE,
JoinDate Date NOT NULL,
);


CREATE TABLE BorrowedBooks(
BorrowingID INT,
ISBN INT,
MemberID INT,
BorrowingDate Date,
ReturnDate Date,
CHECK (ReturnDate > BorrowingDate or ReturnDate IS NULL),
FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
);




INSERT INTO Authors (AuthorID,AuthorName) VALUES
(1,'Michael Morpurgo'),
(2,'JK Rowling' ),
(3,'Julie Carbone'),
(4,'Drew Hayden Taylor'),
(5,' Stephen King'
);


INSERT INTO Books (ISBN,Title,AuthorID) VALUES
(978055, 'Soldat Peace', 1),
(978074, 'Harry Potter', 2),
(978014, 'Harry', 3),
(978006, 'AlterNatives', 4),
(978045, 'The Shining', 5
);


INSERT INTO Members (MemberID,Name,Email,JoinDate) VALUES
(10,'James Charles', 'charles@gmail.com','2023-01-01'),
(20,'Andrew Tate','tate@gmail.com','2023-01-01 '),
(30,'Bebe Rexha','rexha@gmail.com','2023-06-15'),
(40,'John Cena', 'cena@gmail.com','2023-05-16'),
(50,'Peter Parker','parker@gmail.com','2022-02-15'
);


INSERT INTO BorrowedBooks (BorrowingID,ISBN,MemberID,BorrowingDate,ReturnDate) VALUES
(100,978055, 10,' 2023-01-01',NULL  ),
(200,978074,10,'2023-03-02','2023-04-01' ),
(300,978014,10,'2023-01-01',NULL ),
(400,978006,10,'2023-09-05','2023-09-15' ),
(500,978045,50,'2023-10-10', NULL 
);


--1 Retrieve books along with their authors.
SELECT b.Title, a.AuthorName 
FROM Books b RIGHT JOIN Authors a ON b.AuthorID = a.AuthorID; 

--2 Retrieve all books and their borrowing information (even if not borrowed yet).
SELECT b.*,c.Title,c.AuthorID
FROM BorrowedBooks b 
LEFT JOIN Books c ON b.ISBN = c.ISBN;

--3 Retrieve all members and their borrowing information (even if they have not borrowed any books).
SELECT  m.Name,b.* 
FROM Members m 
LEFT JOIN BorrowedBooks b ON m.MemberID = b.MemberID;

/*4 Retrieve all books and their borrowing information (including those with no match in the Members
table).*/
SELECT b.Title,b.AuthorID,c.*
FROM BorrowedBooks c 
LEFT JOIN Books b ON c.ISBN = b.ISBN;

--5 Retrieve all records from Books and Members tables where there is a match.
SELECT c.MemberID,b.Title 
FROM BorrowedBooks c
LEFT JOIN Books b ON c.ISBN = b.ISBN 
WHERE c.MemberID IS NOT NULL;

--6 Retrieve all books along with their authors, even if there is no borrowing information.
SELECT b.*, a.AuthorName 
FROM Books b 
RIGHT JOIN Authors a ON b.AuthorID = a.AuthorID; 

--7 Retrieve all members along with their borrowing information, even if there is no book information.
SELECT m.Name, bb.*
FROM Members m
LEFT JOIN BorrowedBooks bb ON m.MemberID = bb.MemberID;

--8 Retrieve all books and members, including those without borrowing information.
SELECT c.*,b.Title 
FROM BorrowedBooks c 
LEFT JOIN Books b ON c.ISBN = b.ISBN ;

--9 Retrieve the titles of all books containing the word "Harry" in their title.
SELECT *
FROM Books
WHERE Title LIKE '%Harry%';

--10 Retrieve the distinct AuthorIDs from the Books table.
SELECT DISTINCT AuthorID
FROM Books;

--11 Retrieve all members who joined on or after January 1st, 2023.
SELECT *
FROM Members
WHERE JoinDate >= '2023-01-01';

--12 List the titles of the books borrowed by members who joined after January 1, 2023
SELECT b.Title
FROM Books b
JOIN BorrowedBooks bb ON b.ISBN = bb.ISBN
JOIN Members m ON bb.MemberID = m.MemberID
WHERE m.JoinDate >= '2023-01-01';

--13 Retrieve the names of members along with the total number of books each member has borrowed
SELECT m.Name, COUNT(bb.BorrowingID) AS TotalBorrowedBooks
FROM Members m
LEFT JOIN BorrowedBooks bb ON m.MemberID = bb.MemberID
GROUP BY m.Name;

--14 Using Aggregate Function COUNT:Calculate the total number of books in the library.
SELECT COUNT(*) AS TotalBooks
FROM Books ;

--15 Using GROUP BY with COUNT: Count the number of books written by each author
SELECT a.AuthorName, COUNT(b.ISBN) AS TotalBooksWritten
FROM Authors a
LEFT JOIN Books b ON a.AuthorID = b.AuthorID
GROUP BY a.AuthorName;

--16 Using ORDER BY with ASC: List all books sorted in ascending order by title
SELECT *
FROM Books
ORDER BY Title ASC;

/*17 Using DISTINCT with ORDER BY: Find unique member IDs from the BorrowedBooks table, sorted in
ascending order.*/
SELECT DISTINCT MemberID
FROM BorrowedBooks
ORDER BY MemberID ASC;

/*18 Using GROUP BY with HAVING: Count the number of borrowings for each member and display only
those who have borrowed more than 3 books.*/
SELECT MemberID, COUNT(*) AS TotalBorrowings
FROM BorrowedBooks
GROUP BY MemberID
HAVING COUNT(*) > 3;

--19  Using JOIN and ORDER BY: List all books along with their borrowing details sorted by borrow date.
SELECT b.Title, bb.*
FROM Books b
JOIN BorrowedBooks bb ON b.ISBN = bb.ISBN
ORDER BY bb.BorrowingDate;

SELECT count(ReturnDate)  FROM BorrowedBooks;

/*20 Using GROUP BY with WHERE and HAVING: Count the number of borrowings for each member who
has returned at least one book and has borrowed more than 2 books in total.*/
SELECT MemberID,count(BorrowingDate)as total 
FROM BorrowedBooks 
WHERE  exists
(SELECT * FROM BorrowedBooks 
WHERE ReturnDate IS NOT NULL )GROUP BY MemberID 
HAVING COUNT(BorrowingDate) >= 1;

/*21 Using ORDER BY with Aggregate Function: List authors along with the count of books they have
written, sorted in descending order by the count of books.*/
SELECT a.AuthorName, COUNT(b.ISBN) AS TotalBooksWritten
FROM Authors a
LEFT JOIN Books b ON a.AuthorID = b.AuthorID
GROUP BY a.AuthorName
ORDER BY TotalBooksWritten DESC;

/*22 Using JOIN with WHERE and ORDER BY: List books along with borrower names and borrowing
details for members who joined after January 1st, 2023, sorted by borrow date.*/
SELECT m.Name AS BorrowerName, bb.*
FROM Members m
JOIN BorrowedBooks bb ON  bb.MemberID = m.MemberID
WHERE m.JoinDate > '2023-01-01'
ORDER BY bb.BorrowingDate;



# Create database
CREATE DATABASE Library;
USE Library;

-- Category Table
create table category (category_id int auto_increment primary key,category_name varchar(50) not null);
 

-- Author Table
create table author(author_id int auto_increment primary key,author_name varchar(50) not null);


-- Book Table
create table book (
    book_id int auto_increment primary key,
    title varchar(550) not null,
   
    published_year int,
    category_id int 
    
);

-- Book_Author Table (Many-to-Many)
create table  book_author (
    book_id int ,
    author_id int ,
  primary key (book_id, author_id),
    foreign key  (book_id) REFERENCES book(book_id),
      foreign key (author_id) REFERENCES author(author_id)on update cascade on delete cascade
);

-- Member Table
create table  member (
    member_id int auto_increment primary key,
    fullname varchar(100) not null,
    email varchar(100) unique,
    membership_date date
);

-- Loan Table
create table loan(
    loan_id int auto_increment primary key,
    book_id INT,
    member_id INT,
    loan_date date not null,
    return_date date,
   foreign key(book_id) references book(book_id)on update cascade on delete cascade,
     foreign key(member_id) references member(member_id)on update cascade on delete cascade
);


-- entries
INSERT INTO category (category_name) VALUES 
('Science Fiction'),
('Romance'),
('History'),
('Programming'),
('Mystery');

-- Authors
INSERT INTO author (author_name) VALUES 
('Isaac Asimov'),
('Jane Austen'),
('Yuval Noah Harari'),
('Robert C. Martin'),
('Agatha Christie');
-- Books
INSERT INTO Book (title,  published_year, category_id) VALUES 
('Foundation',  1951, 1),
('Pride and Prejudice', 1813, 2),
('Sapiens', 2011, 3),
('Clean Code', 2008, 4),
('Murder on the Orient Express',  1934, 5);

-- Book-Author relationships
INSERT INTO book_author (book_id, author_id) VALUES 
(1, 1),  -- Foundation by Isaac Asimov
(2, 2),  -- Pride and Prejudice by Jane Austen
(3, 3),  -- Sapiens by Yuval Noah Harari
(4, 4),  -- Clean Code by Robert C. Martin
(5, 5);  -- Murder on the Orient Express by Agatha Christie

-- Members
INSERT INTO member (fullname, email, membership_date) VALUES 
('Alice Johnson', 'alice.johnson@example.com', '2023-01-15'),
('Bob Smith', 'bob.smith@example.com', '2023-03-22'),
('Carol Davis', 'carol.davis@example.com', '2023-05-10');

-- Loans
INSERT INTO loan (book_id, member_id, loan_date, return_date) VALUES 
(1, 1, '2024-05-01', '2024-05-15'),
(2, 2, '2024-06-05',null), 
(4, 3, '2024-06-10', '2024-06-20');


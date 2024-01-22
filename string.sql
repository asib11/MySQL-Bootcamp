use asib;
-- combaine substring and concat
SELECT 
    CONCAT(SUBSTR(author_fname, 1, 1),
            '.',
            SUBSTR(author_lname, 1, 1),
            '.') AS nameing
FROM
    books;
-- replace 
select replace(title, ' ', '_') from books;
-- character length
select char_length(title) as len, title from books;
-- upper= ucase and lower= lcase
select concat('I LOVE ', ucase(title), ' !!!') from books;

-- exercise 
select reverse(ucase('Why does my cat look at me with such hatred?'));
select replace(concat('I', ' ', 'like',' ', 'cats'),' ','_');
select replace(title,' ','->') as title from books;
select author_lname as forwards, reverse(author_lname) as backwards from books;
select ucase(concat(author_fname,' ', author_lname)) from books;
select concat(title,' was released in ', released_year ) as blurb from books;
desc books;
select title, char_length(title) as 'character count' from books;
select concat(substr(title,1,10),'...') as 'short title',
 concat(author_lname,',', author_fname) as author,
 concat(stock_quantity, ' in stock') as quantity from books;
 -- refining selection
 INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
select * from books;
    -- distinct
select distinct author_fname, author_lname from books;
-- order by
select title, pages from books order by released_year desc;
select author_lname,released_year,title, pages from books order by 1, 2 desc; -- 1 and 2 are selected column number
select author_lname,released_year,title, pages from books order by author_lname, released_year desc; -- desc work only relesed_year
-- limit
select author_lname,released_year,title, pages from books 
order by author_lname, released_year desc limit 3, 7; -- 3 where from start, 7 how many data give
-- like
select * from books where author_fname like '____'; -- author_fname find only 4 character
select * from books where author_fname like 'da%'; -- Finds any values that start with da
select * from books where author_fname like 'd%n'; -- Finds any values that start with "d" and ends with "n"
-- exercise
select title from books where title like '%stories';
select title, pages from books order by 2 desc limit 1;
SELECT 
    CONCAT(title, ' - ', released_year) AS summary
FROM
    books
ORDER BY released_year DESC
LIMIT 3;

SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname LIKE '% %';

SELECT 
    title, released_year, stock_quantity
FROM
    books
ORDER BY 3 , 1
LIMIT 3;

select title, author_lname from books order by 2,1;
SELECT 
    UCASE(CONCAT('my favorite author is ',
                    author_fname,
                    ' ',
                    author_lname,'!')) AS yell
FROM
    books
ORDER BY author_lname; 

-- aggregate Function
-- count 
select count(*) from books where title like '%the%'; -- n.b. count does not calculate null value/ ignore null value
-- group by
select author_lname, count(*) from books group by author_lname; -- its mean count all rows of each group;
-- min and max
-- without group by
select min(author_fname), max(author_fname) from books;
-- with group by
-- select min(author_lname), title form books // this gives us aggregate error
select author_fname, author_lname, count(*) from books group by author_fname, author_lname;
select concat(author_fname,' ', author_lname) as author, count(*) from books group by author;
-- group by min max
select author_fname, author_lname, min(released_year), max(released_year), count(*) from books group by author_lname, author_fname;
-- subquery
select title, released_year from books where pages = (select max(pages) from books);
-- sum
select sum(pages) from books;
select author_lname, sum(pages) from books group by author_lname;
select 3+2;
-- exercise
select count(*) from books ; -- group by released_year;
select sum(stock_quantity) from books;
select released_year, count(*) from books group by released_year;
select concat(author_fname,' ', author_lname) as author,avg(released_year) from books group by author;
select concat(author_fname,' ', author_lname) as author from books where pages=(select max(pages) from books);
select released_year as year, count(*) as books, avg(pages) from books  group by released_year order by released_year;
-- date & time
create table birthinfo (name varchar(50), bithdate date, birthtime time, birthdt datetime);
insert into birthinfo (name, bithdate, birthtime, birthdt) values ('asib','1998-07-11', '4:10:20','1998-07-11 4:10:20');
select * from birthinfo;
insert into birthinfo (name, birthdate, birthtime, birthdt) values('ahmed', curdate(), curtime(), now());
alter table birthinfo rename column bithdate to birthdate;
select birthdate , day(birthdate), dayofweek(birthdate), monthname(birthdt), dayname(birthdt) from birthinfo;
select birthdt, date_format(birthdt, '%r') from birthinfo;
-- timestamp
create table captions (text varchar(150), created_at timestamp default current_timestamp,
updated_at timestamp on update current_timestamp);
insert into captions (text) value('i can set captions');
update captions SET text='i can set caption update' where text='i can set captions';
select * from captions;
-- exercise
create table inventory (item_name varchar(20), price decimal(6.2), quantity tinyint);
desc inventory;
select curtime(), curdate(), dayofweek(curdate()), dayname(curdate());
select date_format(curdate(),'%m/%d/%Y');
select date_format(now(),'%M %D at %k:%i');
create table tweets (content varchar(100), username varchar(20), 
create_at timestamp default now());
insert into tweets (content, username) values('my first tweet','asib');
select * from tweets;

-- logical and comparison
-- not equal !=
select author_fname, title from books where released_year != 2017;
-- not like 
select title from books where title not like '%a%';
-- greater than
select 40> 20; -- its returned actually boolean value, bt sql return 0 or 1
-- between
select title from books where released_year >= 2004 and released_year<= 2014; -- without between operator
select title from books where released_year between 2004 and 2014;
select title from books where released_year not between 2004 and 2014;
select * from birthinfo where birthtime between cast('4:00:00' as time) and cast('6:00:00' as time); -- same
select * from birthinfo where hour(birthtime) between 4 and 6; -- same

-- exercise
SELECT * FROM books WHERE released_year < 1980;

SELECT * FROM books 
WHERE author_lname = 'Eggers'
OR author_lname = 'Chabon';

SELECT * FROM books
WHERE author_lname = 'Lahiri'
AND released_year > 2000;

SELECT * FROM books
WHERE pages >= 100 
AND pages <= 200;

SELECT * FROM books
WHERE pages BETWEEN 100 and 200;

SELECT title, author_lname FROM books
WHERE author_lname LIKE 'C%'
OR author_lname LIKE 'S%';

SELECT title, author_lname
FROM books WHERE SUBSTR(author_lname, 1, 1) in ('C', 'S');

SELECT title, author_lname,
CASE
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title = 'Just Kids' THEN 'Memoir' 
    WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memior'
    ELSE 'Novel'
END AS type
FROM books;


SELECT author_fname, author_lname,
	CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
	END AS count
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;

-- constraints and alter
-- unique
create table user (name varchar(50) not null, phone int not null unique);
insert into user (name, phone) values ('asib', 01753249719);
insert into user (name, phone) values ('ahmed', 01753249719); -- its get error because phone is unique

-- check
create table info (name varchar(50) not null, age int check(age<0));
insert into info (name, age) values ('ahmed', 25); -- get error because age is less than 0
insert into info (name, age) values ('ahmed', -25); 

-- constraint
create table companies (name varchar(50) not null, address varchar(50) not null, constraint name_address unique(name, address));
insert into companies (name,address) values('coderize', 'ksuhtia');
insert into companies (name,address) values('coderize', 'dhaka');
insert into companies (name,address) values('other_name', 'ksuhtia');
insert into companies (name,address) values('coderize', 'ksuhtia'); -- get error because its multiple constraints

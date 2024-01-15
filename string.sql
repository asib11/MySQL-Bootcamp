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
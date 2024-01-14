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
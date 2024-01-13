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
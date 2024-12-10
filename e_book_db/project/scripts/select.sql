--жанры со средним рейтингом выше 9.5
select genre, avg(rating)  as rating
from e_book_library.book
group by genre
having avg(rating) > 9.5;


--средняя стоимость книг по годам
select avg(cost) as avg_cost, year_issue
from e_book_library.qualitative_characteristics
group by year_issue
order by year_issue;


--лучшая и худшая книги в данном жанре
select
    distinct genre,
    first_value(title) over (partition by genre order by rating) as top,
    first_value(title) over (partition by genre order by rating desc ) as worst
from e_book_library.book join e_book_library.qualitative_characteristics
    on book.book_id = qualitative_characteristics.book_id;


--лучшая и худшая книги в библиотеке
select
    first_value(title) over (order by rating) as top,
    first_value(title) over (order by rating desc ) as worst
from e_book_library.book join e_book_library.qualitative_characteristics
    on book.book_id = qualitative_characteristics.book_id
limit 1;


--сравнение рейтинга книги со средним внутри жанра
select avg(rating)  over (partition by genre) as avg_rating, rating, genre
from e_book_library.book join e_book_library.qualitative_characteristics
    on book.book_id = qualitative_characteristics.book_id
order by genre, rating;


-- ранжировка книг по популярности
select dense_rank() over (order by rating) as rank, genre, title
from e_book_library.book join e_book_library.qualitative_characteristics
    on book.book_id = qualitative_characteristics.book_id;

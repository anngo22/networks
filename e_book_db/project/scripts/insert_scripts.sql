insert into e_book_library.book (title, rating, genre, age_limit)
    values ('Тьма после рассвета', 9.0, 'современные детективы', 16),
           ('На рандеву с тенью', 9.2, 'криминальные боевики', 16),
           ('Жизнь – сапожок непарный', 9.0, 'биографии и мемуары', 16),
           ('Киберканикулы', 9.8, 'боевая фантастика', 16),
           ('Кризис и Власть. Том II. Люди Власти. Диалоги о великих сюзеренах и властных группировках', 9.8, 'политология', 16),
           ('Времени нет', 9.6, 'боевая фантастика', 18),
           ('Семь разгневанных богинь', 9.6, 'современные детективы', 16),
           ('Информатор', 10, 'зарубежные детективы', 16);

insert into e_book_library.author (author, orig_language, country, birth_date)
    values ('Александра Маринина', 'ru', 'Ukraine', '1957-06-16'),
           ('Татьяна Степанова', 'ru', 'Russia', '1966-04-23'),
           ('Тамара Петкевич', 'ru', 'Russia', '1920-03-29'),
           ('Ольга Громыко', 'ru', 'Belarus', '1978-09-14'),
           ('Сергей Щеглов', 'ru', 'Russia', '1965-06-08'),
           ('Алексей Брусницын', 'ru', 'Russia', '1972-11-22'),
           ('Наталья Андреева', 'ru', 'Russia', '1969-06-11'),
           ('Джон Гришэм', 'eng', 'USA', '1955-02-08');


--select book_id from e_book_library.book where title = 'Тьма после рассвета';

insert into e_book_library.qualitative_characteristics(book_id, language, year_issue, audio, format)
    values ((select book_id from e_book_library.book where title = 'Тьма после рассвета'),
            'ru', 2022, false, 'pdf'),
            ((select book_id from e_book_library.book where title = 'На рандеву с тенью'),
             'ru', 2003, true, 'epub'),
            ((select book_id from e_book_library.book where title = 'Жизнь – сапожок непарный'),
            'ru', 2000, false, 'fb2'),
            ((select book_id from e_book_library.book where title = 'Киберканикулы'),
            'ru', 2000, false, 'fb2'),
            ((select book_id from e_book_library.book where title = 'Кризис и Власть. Том II. Люди Власти. Диалоги о великих сюзеренах и властных группировках'),
            'ru', 2000, false, 'fb2'),
            ((select book_id from e_book_library.book where title = 'Времени нет'),
            'ru', 2000, false, 'fb2'),
            ((select book_id from e_book_library.book where title = 'Семь разгневанных богинь'),
            'ru', 2000, false, 'fb2'),
            ((select book_id from e_book_library.book where title = 'Информатор'),
            'ru', 2000, false, 'fb2');

insert into e_book_library.author_x_book(book_id, author_id)
    values ((select book_id from e_book_library.book where title = 'Тьма после рассвета'),
            (select author_id from e_book_library.author where author = 'Александра Маринина')),
            ((select book_id from e_book_library.book where title = 'На рандеву с тенью'),
            (select author_id from e_book_library.author where author = 'Татьяна Степанова')),
            ((select book_id from e_book_library.book where title = 'Жизнь – сапожок непарный'),
            (select author_id from e_book_library.author where author = 'Тамара Петкевич')),
            ((select book_id from e_book_library.book where title = 'Киберканикулы'),
            (select author_id from e_book_library.author where author = 'Ольга Громыко')),
            ((select book_id from e_book_library.book where title = 'Кризис и Власть. Том II. Люди Власти. Диалоги о великих сюзеренах и властных группировках'),
            (select author_id from e_book_library.author where author = 'Сергей Щеглов')),
            ((select book_id from e_book_library.book where title = 'Времени нет'),
            (select author_id from e_book_library.author where author = 'Алексей Брусницын')),
            ((select book_id from e_book_library.book where title = 'Семь разгневанных богинь'),
            (select author_id from e_book_library.author where author = 'Наталья Андреева')),
            ((select book_id from e_book_library.book where title = 'Информатор'),
            (select author_id from e_book_library.author where author = 'Джон Гришэм'));

insert into e_book_library.translator(translator, tr_language)
    values ('Аркадий Кабалкин', 'ru');

insert into e_book_library.translator_x_book(book_id, translator_id)
    values ((select book_id from e_book_library.book where title = 'Информатор'),
            (select translator_id from e_book_library.translator where translator = 'Аркадий Кабалкин'));

insert into e_book_library.category(book_id, category)
    values ((select book_id from e_book_library.book where title = 'Тьма после рассвета'),
            'выбор редакции'),
            ((select book_id from e_book_library.book where title = 'На рандеву с тенью'),
            'выбор редакции'),
            ((select book_id from e_book_library.book where title = 'Жизнь – сапожок непарный'),
            'выбор редакции'),
            ((select book_id from e_book_library.book where title = 'Киберканикулы'),
            'выбор редакции'),
            ((select book_id from e_book_library.book where title = 'Кризис и Власть. Том II. Люди Власти. Диалоги о великих сюзеренах и властных группировках'),
            'выбор редакции'),
            ((select book_id from e_book_library.book where title = 'Времени нет'),
            'выбор редакции'),
            ((select book_id from e_book_library.book where title = 'Семь разгневанных богинь'),
            'выбор редакции'),
            ((select book_id from e_book_library.book where title = 'Информатор'),
            'выбор редакции');

insert into e_book_library.user(user_name, age, balance)
    values ('ann_go', 19, 250),
           ('globgogabgala', 16, 10000),
           ('mmm228', 10, 70);

insert into e_book_library.user_x_book(book_id, user_id, mark)
    values ((select book_id from e_book_library.book where title = 'Тьма после рассвета'),
            (select user_id from e_book_library.user where user_name = 'ann_go'), 5),
            ((select book_id from e_book_library.book where title = 'Информатор'),
             (select user_id from e_book_library.user where user_name = 'globgogabgala'), 8);


--Запросы:
select title
from e_book_library.book
where rating > 9.5;

insert into e_book_library.user(user_name, age, balance)
    values ('jon_snow', 23, 17777);

update e_book_library.user
set user_name = 'aegon_targaryen'
where user_name = 'jon_snow';

select book_id
from e_book_library.qualitative_characteristics
where format = 'pdf';

insert into e_book_library.book(title, rating, genre, age_limit)
    values ('delete', 0, 'test', 0);

update e_book_library.book
set title = 'low_rating'
where rating = 0;

delete from e_book_library.book where genre = 'test';

insert into e_book_library.user_x_book(book_id, user_id, mark)
    values ((select book_id from e_book_library.book where title = 'Тьма после рассвета'),
            (select user_id from e_book_library.user where user_name = 'aegon_targaryen'),
            8);

update e_book_library.book
set rating = (rating + 8) / 2
where title = 'Тьма после рассвета';

select rating
from e_book_library.book
where title = 'Тьма после рассвета';

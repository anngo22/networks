--Индекс для поиска книги по названию и их сортировки
create index if not exists book_title_idx on e_book_library.book using btree(title);

--Индекс для сортировки книг по рейтингу
create index if not exists book_rating_idx on e_book_library.book using btree(rating);

--Индекс для поиска аторов
create index if not exists author_idx on e_book_library.author using btree(author);

--Индекс для сортировки по жанру внутри возрастной группы
create index if not exists genre_x_age_idx on e_book_library.book using btree(age_limit, genre);

--Индекс для сортировки по названию внутри возрастной группы
create index if not exists title_x_age_idx on e_book_library.book using btree(age_limit, title);


--Функции и тригеры:

--Функция, пересчитывающая рейтинг книги по оценкам пользоватлей
create or replace function set_rating()
returns trigger
as $$begin
    update e_book_library.book
    set rating = (select avg(mark)
    from e_book_library.user_x_book
    where book_id = new.book_id)
    where book_id = new.book_id;
    return new;
    end$$
    language plpgsql;

--Тригеры соответственно для выставления и обновления рейтинга книги пользователем:
create or replace trigger book_rating after insert
    on e_book_library.user_x_book
    for each statement
    execute procedure set_rating();

create or replace trigger update_book_rating after update
    on e_book_library.user_x_book
    for each statement
    execute procedure set_rating();

--Функция для выставления и обновления оценки пользователя
create or replace function upsert_mark(new_book_id integer, new_user_id integer, new_mark integer)
returns void
as $$begin
    update e_book_library.user_x_book
    set mark = new_mark
    where book_id = new_book_id and user_id = new_user_id;
    return;
    exception when others
    then insert into e_book_library.user_x_book(book_id, user_id, mark)
    values(new_book_id, new_user_id, new_mark);
    return;
end;
$$
language plpgsql;

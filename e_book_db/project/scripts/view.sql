create or replace view impersonal_user_data as
select user_id, balance from e_book_library.user;

create or replace view all_user_info as
select
    u.*,
    b.*,
    ub.mark
from
    e_book_library.user as u
     join
    e_book_library.user_x_book as ub
    on
    u.user_id = ub.user_id
    join
    e_book_library.book as b
    on ub.book_id = b.book_id
;


create or replace view all_book_info as
select
    b.*,
    t.*
from
    e_book_library.translator as t
    full join
    e_book_library.translator_x_book as tb
    on
    t.translator_id = tb.translator_id
    full join
    e_book_library.book as b
    on tb.book_id = b.book_id
    full join
    e_book_library.author_x_book as ab
    on ab.book_id = b.book_id
    full join
    e_book_library.author as a
    on ab.author_id = a.author_id
;

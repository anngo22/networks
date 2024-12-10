drop schema if exists e_book_library cascade;
create schema e_book_library;

create table e_book_library.book
(
    book_id   serial,
    title     varchar not null,
    rating    decimal,
    genre     varchar not null,
    age_limit integer default 0,

    constraint t_books_pk_book_id primary key (book_id),

    check (rating >= 0 and rating <= 10 )
);


create table e_book_library.user
(
    user_id   serial,
    user_name varchar not null,
    age       integer not null,
    balance   decimal default 0,

    constraint t_user_pk_user_id primary key (user_id),

    check (balance >= 0)
);

create table e_book_library.qualitative_characteristics
(
    book_id    integer,
    language   varchar not null,
    year_issue integer,
    audio      boolean not null,
    format     varchar,
    cost       decimal default 0,

    constraint t_qualitative_characteristics_pk_book_id primary key (book_id),
    constraint t_qualitative_fk_book_id foreign key (book_id) references e_book_library.book (book_id) on delete cascade,

    check (cost >= 0),
    check (audio in (True, FALSE)),
    check (format in ('pdf', 'djvu', 'fb2', 'epub', 'mobi', 'txt')),
    check (language in ('ru', 'eng', 'spa', 'fre', 'ger', 'ita', 'uk', 'chi', 'be')
        )
);

create table e_book_library.author
(
    author_id     serial,
    author        varchar not null,
    orig_language varchar not null,
    country       varchar not null,
    birth_date    date,

    constraint t_author_pk_author_id primary key (author_id),

    check (orig_language in ('ru', 'eng', 'spa', 'fre', 'ger', 'ita', 'uk', 'chi', 'be')),
    check (country in ('Russia', 'UK', 'USA', 'Germany', 'Spain', 'France', 'Italy', 'Ukraine', 'Belarus', 'China'))

);

create table e_book_library.translator
(
    translator_id serial,
    translator    varchar not null,
    tr_language   varchar not null,

    constraint t_translator_pk_translator_id primary key (translator_id),

    check (tr_language in ('ru', 'eng', 'spa', 'fre', 'ger', 'ita', 'uk', 'chi', 'be'))
);

----


create table e_book_library.author_x_book
(
    book_id   integer,
    author_id integer,

    constraint t_author_x_book_pk_book_id primary key (book_id),
    constraint t_author_x_book_fk_book_id foreign key (book_id) references e_book_library.qualitative_characteristics (book_id) on delete cascade,
    constraint t_author_x_book_fk_author_id foreign key (author_id) references e_book_library.author (author_id) on delete cascade
);

create table e_book_library.translator_x_book
(
    book_id       integer,
    translator_id integer,

    constraint t_translator_x_book_pk_book_id primary key (book_id),
    constraint t_translator_x_book_fk_book_id foreign key (book_id) references e_book_library.qualitative_characteristics (book_id) on delete cascade,
    constraint t_translator_x_book_fk_translator_id foreign key (translator_id) references e_book_library.translator (translator_id) on delete cascade
);

create table e_book_library.category
(
    book_id  integer,
    category varchar,

    constraint t_category_pk_category primary key (category, book_id),
    constraint t_category_fk_book_id foreign key (book_id) references e_book_library.qualitative_characteristics (book_id) on delete cascade
);

create table e_book_library.user_x_book
(
    book_id integer,
    user_id integer,
    mark    decimal,

    constraint t_user_x_book_pk_book_id primary key (book_id, user_id),
    constraint t_user_x_book_fk_book_id foreign key (book_id) references e_book_library.qualitative_characteristics (book_id) on delete cascade,
    constraint t_user_x_book_fk_user_id foreign key (user_id) references e_book_library.user (user_id) on delete cascade,

    check (mark > 0)
);

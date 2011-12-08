CREATE TABLE IF NOT EXISTS articles
(
             id integer primary key autoincrement,
             id_rubrique integer,
             title string not null,
             date string not null,
             text string not null
);
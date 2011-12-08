CREATE TABLE IF NOT EXISTS rubriques
(
             id integer primary key autoincrement,
             id_parent integer,
             title string not null,
             text string not null
);

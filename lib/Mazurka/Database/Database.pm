# connection à la base donnée
sub connect_db {
    my $dbh = DBI->connect("dbi:SQLite:dbname=".setting('database')) or die $DBI::errstr;
    return $dbh;
}

#initialisation de la base de donnée
sub init_db {
    my $db = connect_db();
    my $init_rubriques = read_file('schema_rubriques.sql');
    my $init_articles = read_file('schema_articles.sql');
    my $init_racine = read_file('schema_racine.sql');
    $db->do($init_rubriques) or die $db->errstr;
    $db->do($init_articles) or die $db->errstr;
    $db->do($init_racine) or die $db->errstr;
}

1;
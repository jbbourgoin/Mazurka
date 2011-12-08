# Mazurka::Articles::Show
# affiche les articles du blog

# 'route handler' type GET de l'affichage des entrées du blog 
get '/' => sub {
    my $db = connect_db();
    my $sql = 'select id, title, date, text from articles order by id desc';
    my $sth = $db->prepare($sql) or die $db->errstr;
    $sth->execute or die $sth->errstr;
    template 'show_articles.tt', {
        'msg' => get_flash(), # affiche quelque chose quand un événement arrive
        'articles' => $sth->fetchall_hashref('id'), # ce que doit rendre le template show_entrie.tt
    };
};

1;

# Mazurka::Articles::Show
# affiche les articles du blog

# 'route handler' type GET de l'affichage des rubriques du blog

# POUR LA SELECTION DE LA RUBRIQUE D'UN ARTICLE
get '/' => sub {
    my $db = connect_db();
    my $sql = 'select id, title from rubriques order by title desc';
    my $sth = $db->prepare($sql) or die $db->errstr;
    $sth->execute or die $sth->errstr;
    template 'show_rubriques.tt', {
        'msg' => get_flash(), # affiche quelque chose quand un événement arrive
        'rubriques' => $sth->fetchall_hashref('id'), # ce que doit rendre le template
    };
};

# POUR LA SELECTION DE LA RUBRIQUE PARENTES D'UNE RUBRIQUE
get '/admin/addrub' => sub {
    my $db = connect_db();
    my $sql = 'select id, title from rubriques order by id desc';
    my $sth = $db->prepare($sql) or die $db->errstr;
    $sth->execute or die $sth->errstr;
    template 'addrub.tt', {
        'msg' => get_flash(), # affiche quelque chose quand un événement arrive
        'rubPar' => $sth->fetchall_hashref('id'), # ce que doit rendre le template
    };
};

# POUR LA SELECTION DE LA RUBRIQUE D'UN ARTICLE
get '/admin/addart' => sub {
    my $db = connect_db();
    my $sql = 'select id, title from rubriques order by title desc';
    my $sth = $db->prepare($sql) or die $db->errstr;
    $sth->execute or die $sth->errstr;
    template 'addart.tt', {
        'msg' => get_flash(), # affiche quelque chose quand un événement arrive
        'rubPar' => $sth->fetchall_hashref('id'), # ce que doit rendre le template
    };
};

1;
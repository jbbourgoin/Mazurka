# 'route handler' type POST de l'ajout de contenu
any ['get', 'post'] => '/admin/addart' => sub {
    if (not session('logged_in')) {
        send_error("Vous n'êtes pas connecté", 401);
    }

    my $db = connect_db();
    my $sql = 'insert into articles ( id_rubrique, title, date, text) values ( ?, ?, ?, ?)';
    my $sth = $db->prepare($sql) or die $db->errstr;

    # s'il y a un submit, écrire dans la base de donnée, informer l'utilisateur et rediriger vers la page d'accueil
    if (request->method() eq "POST") {
        $sth->execute(params->{'id_rubrique'}, params->{'title'}, params->{'date'}, params->{'text'}) or die $sth->errstr;
        set_flash('Nouveau billet publié !');
        redirect '/';
    }

    template 'addart', {
        'msg' => get_flash(), # affiche quelque chose quand un événement arrive
    };
};

1;
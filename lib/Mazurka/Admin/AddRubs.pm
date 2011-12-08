# 'route handler' type POST de l'ajout de rubriques
any ['get', 'post'] => '/admin/addrub' => sub {
    if (not session('logged_in')) {
        send_error("Vous n'êtes pas connecté", 401);
    }

    my $db = connect_db();
    my $sql = 'insert into rubriques (id, id_parent, title, text) values (?, ?, ?, ?)';
    my $sth = $db->prepare($sql) or die $db->errstr;

    # s'il y a un submit, écrire dans la base de donnée, informer l'utilisateur et rediriger vers la page d'admin
    if (request->method() eq "POST") {
        $sth->execute(params->{'id'}, params->{'id_parent'}, params->{'title'}, params->{'text'}) or die $sth->errstr;
        set_flash('Nouvelle rubrique !');
        redirect '/admin';
    }

    template 'addrub', {
        'msg' => get_flash(), # affiche quelque chose quand un événement arrive
    };
};

1;
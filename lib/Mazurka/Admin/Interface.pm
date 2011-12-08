# interface d'admin
get '/admin' => sub {
    if (not session('logged_in')) {
        send_error("Vous n'êtes pas connecté", 401);
    }

    template 'admin', {
        'msg' => get_flash(), # affiche quelque chose quand un événement arrive
        'add_rubrique_url' => uri_for('/admin/addrub'), # route vers la page d'ajout de contenu
        'add_article_url' => uri_for('/admin/addart'), # route vers la page d'ajout d'article
    };
};

1;
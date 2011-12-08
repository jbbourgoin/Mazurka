# 'route handler' type GET | POST pour le login
any ['get', 'post'] => '/login' => sub {
    my $err;

    if (request->method() eq "POST") {
        # evaluation du formulaire
        if (params->{'username'} ne setting('username')) {
            $err = "Invalid username";
        }
        elsif ( params->{'password'} ne setting('password')) {
            $err = "Invalid password";
        }
        else {
            session 'logged_in' => true;
            set_flash('You are logged in.');
            redirect '/';
        }
    }

    # afficher le formulaire de login
    template 'login.tt', {
        'err' => $err,
    };
};

1;
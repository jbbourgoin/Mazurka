# 'route handler' de déconnexion
get '/logout' => sub {
   session->destroy;
   set_flash('You are logged out.');
   redirect '/';
};

1;
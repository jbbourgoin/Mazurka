package Mazurka;

use warnings;
use strict;

use Dancer ':syntax';

use Dancer::Plugin::MobileDevice;
use Dancer::Plugin::Feed;
use DBI;
use File::Spec;
use File::Slurp;
use Template;

use Mazurka::Database::Database;
use Mazurka::Show::Articles;
use Mazurka::Show::Rubriques;
use Mazurka::Admin::Interface;
use Mazurka::Admin::AddContents;
use Mazurka::Admin::AddRubs;
use Mazurka::Admin::Login;
use Mazurka::Admin::Logout;
use Mazurka::Flash;

our $VERSION = '0.1';

# configuration
set 'database' => File::Spec->catfile(File::Spec->curdir(), 'Mazurka.db');

# cela permet d'évaluer les paramètres des modèles avant avant qu'ils soient passés au moteur pour être évalués.
# TODO : passer à "hook"
before_template sub {
    my $tokens = shift;

    $tokens->{'start_url'} = uri_for('/');
    $tokens->{'css_normal_url'} = request->base . 'css/style_normal.css';
    $tokens->{'css_mobile_url'} = request->base . 'css/style_mobile.css';
    $tokens->{'css_jqueryui_url'} = request->base . 'css/smoothness/jquery-ui.css';
    $tokens->{'login_url'} = uri_for('/login');
    $tokens->{'logout_url'} = uri_for('/logout');
    $tokens->{'admin_url'} = uri_for('/admin');
};

# TODO if jbblog.db not exists do :
#init_db(); # initialisation de la base de donnée
true;

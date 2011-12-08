# messages flash
my $flash;

sub set_flash {
    my $message = shift;

    $flash = $message;
}

sub get_flash {

    my $msg = $flash;
    $flash = "";

    return $msg;
}

1;
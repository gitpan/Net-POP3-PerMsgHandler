#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

use Data::Dumper;
use IO::All;
use Net::POP3::PerMsgHandler;
use YAML::Syck;
use Perl6::Say;

my $cfg = LoadFile('config.yml');

my $count = per_message(
    username => $cfg->{username},
    password => $cfg->{password},
    host     => $cfg->{host},
    handler  => sub {
        my ($msg, $ctl) = @_;

        my $email = $msg->email_mime;
        say "Subject: ".$email->header('Subject');

        $ctl->quit(1) if $email->header('Subject') =~ m/お問い合わせ/;
    },
);

print "count: ".int($count)."\n";

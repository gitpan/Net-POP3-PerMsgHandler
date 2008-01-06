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

        #say $msg->email_mime->header('Subject');

#        my $email = Email::MIME->new($msg);
#        return unless $email->body =~ m/\AUUID: 12345/sm;
#
#        for my $part ($email->parts) {
#            next unless defined $part->filename;
#            $part->body > io( $part->filename );
#        }
    },
);

print "count: ".int($count)."\n";

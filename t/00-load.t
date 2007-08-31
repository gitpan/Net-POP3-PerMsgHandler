#!perl -T

use Test::More tests => 3;

BEGIN {
	use_ok( 'Net::POP3::PerMessage' );
	use_ok( 'Net::POP3::PerMessage::Control' );
	use_ok( 'Net::POP3::PerMessage::Message' );
}

diag( "Testing Net::POP3::PerMessage $Net::POP3::PerMessage::VERSION, Perl $], $^X" );

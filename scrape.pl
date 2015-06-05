#!/usr/bin/perl
use WWW::Mechanize;

my ($user,$pass)=getuserpass();
print "user=$user\npass=$pass\n";

#init mechanize
my $mech=WWW::Mechanize->new(autocheck=>0);

$mech->get('https://www.synergysportstech.com/synergy/');

print $mech->content;
exit;

sub getuserpass {
	my $user='';
	my $pass='';
	my $filename="pass.txt";
	open(my $fh, "<$filename") or die "Could not open file $!";

	if (<$fh>) {
		chomp;
		($user,$pass)=split(/ /);
	}
	return $user,$pass;
}
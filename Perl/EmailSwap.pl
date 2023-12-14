#!/usr/bin/perl

use strict;
use warnings;

# Prompt for email input
print "Enter an email address: ";
my $email = <STDIN>;
chomp($email);

# Regular expression for email validation
my $emailPattern = qr/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

if ($email =~ $emailPattern) {
    # Convert the email to lowercase
    $email = lc($email);
    print "Valid Email (Lowercase): $email\n";
} else {
    print "Invalid Email\n";
}

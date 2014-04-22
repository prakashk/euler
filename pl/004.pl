#!/usr/bin/perl

# Project Euler -- problem 4

# A palindromic number reads the same both ways. The largest
# palindrome made from the product of two 2-digit numbers is
# 9009 = 91 × 99.

# Find the largest palindrome made from the product of two
# 3-digit numbers.

use 5.10.0;
use strict;
use warnings;

my @n = reverse 100 .. 999;

my %products;
for my $a (@n) {
    for my $b (@n) {
        $products{ $a * $b }++;
    }
}

sub is_palindrome {
    my $n = shift;
    $n eq reverse $n;
}

use List::Util qw(max);

say max grep { is_palindrome($_) } keys %products;

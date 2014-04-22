#!/usr/bin/perl

# Project Euler -- Problem 15

# Starting in the top left corner of a 2×2 grid, there are 6 routes
# (without backtracking) to the bottom right corner.

# How many routes are there through a 20×20 grid?

use 5.10.0;
use warnings;
use strict;
no strict 'vars';

use Math::BigInt;

sub fact{
    my $n = shift;
    no warnings;
    return reduce { $a * $b } 1 .. $n;
}

my $size = shift || 20;
my $sfac = Math::BigInt->new($size)->bfac;
my $sfac2 = Math::BigInt->new($size * 2)->bfac;

say $sfac2 / ($sfac * $sfac);

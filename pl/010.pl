#!/usr/bin/perl

# Project Euler -- Problem 10

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

use 5.10.0;
use strict;
use warnings;

use List::Util qw< sum >;
# use Math::Prime::XS qw< :all >;
use Math::Prime::TiedArray;

my @primes;
tie @primes, "Math::Prime::TiedArray", precompute => 2_000_000;

say sum @primes;

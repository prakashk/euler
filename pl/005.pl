# Project Euler -- Problem 5

# 2520 is the smallest number that can be divided by each of the
# numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all
# of the numbers from 1 to 20?

use 5.10.0;
use strict;
use warnings;
use List::Util qw<reduce>;

sub gcd {
    my ($a, $b) = @_;
    $b == 0 ? $a : gcd($b, $a % $b);
}

sub lcm {
    my ($a, $b) = @_;
    $a * $b / gcd($a, $b);
}

say reduce { lcm($a, $b) } 2 .. 20;

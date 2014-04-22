#!/usr/bin/perl

use 5.10.0;

# Project Euler -- Problem 9

# A Pythagorean triplet is a set of three natural numbers, a < b < c,
# for which, a2 + b2 = c2

# For example, 32 + 42 = 9 + 16 = 25 = 52.

# There exists exactly one Pythagorean triplet for which a + b + c =
# 1000.  Find the product abc.

sub square { $_[0] * $_[0] }
sub is_py_triple {
    my ($a, $b, $c) = @_;
    square($a) + square($b) == square($c)
}

for my $a (1..500) {
    for my $b (1..500) {
        for my $c (1..500) {
            if ($a + $b + $c == 1000 and is_py_triple($a, $b, $c)) {
                say "$a * $b * $c = ", $a * $b * $c;
            }
        }
    }
}

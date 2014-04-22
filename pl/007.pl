#!/usr/bin/perl

# Project Euler -- Problem 7

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
# can see that the 6th prime is 13.

# What is the 10001st prime number?

use 5.10.0;
use strict;
use warnings;

my @PRIMES = (2, 3);

sub is_prime {
    my $n = shift;

    if ($n <= $PRIMES[-1]) {
        return 1
            if @PRIMES ~~ $n;
    }

    my $limit = int sqrt $n;
    for my $p (@PRIMES) {
        last if $p > $limit;
        return 0
            if $n % $p == 0;
    }

    return 1;
}

sub next_prime {
    my $last_prime = $PRIMES[-1];
    my $n = $last_prime + 1;
    while (1) {
        if (is_prime($n)) {
            return $n;
        }
        $n++;
    }
}

my $number = shift || 100;
my $limit = $number;

while (my $np = next_prime()) {
    push @PRIMES, $np;
    say scalar @PRIMES, ": $np" if @PRIMES % 1000 == 00;
    last if @PRIMES >= $limit;
}

say $PRIMES[-1];

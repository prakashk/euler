# Project Euler -- Problem 3

# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?

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

sub factorize {
    my $n = shift;

    my %factors;

    while ($n > 2) {
        if (@PRIMES ~~ $n) {
            $factors{$n}++;
            $n = 1;
            next;
        }

        my $limit = 1 + int sqrt $n;

        for my $p (@PRIMES) {
            if ($p <= $limit) {
                if ($n % $p == 0) {
                    $n /= $p;
                    $factors{$p}++;
                    last;
                }
            }
            else {
                $factors{$n}++;
                $n = 1;
                last;
            }
        }
    }

    return sort {$a <=> $b} keys %factors;
}

my $number = shift || 100;
my $limit = 1 + int sqrt $number;

while (my $np = next_prime()) {
    push @PRIMES, $np;
    last if $np >= $limit;
}

my @prime_factors = factorize($number);

say "@prime_factors";
say $prime_factors[-1];

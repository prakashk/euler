#!/usr/bin/perl

# Project Euler -- Problem 21

# Let d(n) be defined as the sum of proper divisors of n (numbers less
# than n which divide evenly into n).  If d(a) = b and d(b) = a, where
# a ≠ b, then a and b are an amicable pair and each of a and b are
# called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20,
# 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of
# 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

use 5.10.0;
use strict;
use warnings;

use Math::Big::Factors qw< factors_wheel >;
use Math::Subsets::List;
use List::AllUtils qw< reduce sum uniq >;

sub product {
    no strict 'vars'; no warnings;
    return reduce { $a * $b } @_;
}

sub divisor_sum {
    my $n = shift;

    my @divisors;
    subsets { push @divisors, product(@_) if @_ } factors_wheel($n);
    @divisors = sort {$a <=> $b} uniq grep {$_ != $n} @divisors;
    say STDERR "$n [", join(", ", grep {$_//'?'} @divisors), "]";
    return @divisors ? 1 + sum @divisors : 1;
}

my @sum_of_divisors = (0, 1, map { divisor_sum($_) } 2 .. shift || 10000);

my @amicable;
for my $i (2 .. $#sum_of_divisors) {
    my $divisor_sum = $sum_of_divisors[$i];
    say STDERR "[$i, $divisor_sum]";
    if ($i != $divisor_sum && defined $sum_of_divisors[$divisor_sum] && $sum_of_divisors[$divisor_sum] == $i) {
        push @amicable, $i, $divisor_sum;
        say STDERR "$i, $divisor_sum";
    }
}

say STDERR "{@amicable}";
say sum uniq @amicable;

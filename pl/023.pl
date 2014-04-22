#!/usr/bin/perl

# Project Euler -- Problem 23

# A perfect number is a number for which the sum of its proper
# divisors is exactly equal to the number. For example, the sum of the
# proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means
# that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is
# less than n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
# smallest number that can be written as the sum of two abundant
# numbers is 24. By mathematical analysis, it can be shown that all
# integers greater than 28123 can be written as the sum of two
# abundant numbers. However, this upper limit cannot be reduced any
# further by analysis even though it is known that the greatest number
# that cannot be expressed as the sum of two abundant numbers is less
# than this limit.

# Find the sum of all the positive integers which cannot be written as
# the sum of two abundant numbers.

use 5.10.0;
use strict;
use warnings;

use List::AllUtils qw< reduce sum uniq >;

sub divisors {
    my $n = shift;
    return (1, grep { $n % $_ == 0 } 2 .. $n/2);
}

sub divisor_sum {
    my $n = shift;
    sum uniq divisors($n);
}

sub is_abundant {
    my $n = shift;

    return divisor_sum($n) > $n;
}

my $n_max = shift || 28123;

my @ABUNDANT = grep is_abundant($_), 1 .. $n_max;
say "# of abundant numbers up to $n_max = ", scalar @ABUNDANT;
say "{@ABUNDANT}";

my %ABUNDANT = map {$_ => 1} @ABUNDANT;

sub is_sum_of_two_abundant_numbers {
    my $n = shift;

    for (1 .. int($n/2)) {
        if (exists $ABUNDANT{ $_ } and exists $ABUNDANT{ $n - $_ }) {
            return 1;
        }
    }

    return 0;
}

my @my_numbers = grep { not is_sum_of_two_abundant_numbers($_) } 1 .. $n_max;
say "[@my_numbers]";
say sum @my_numbers;

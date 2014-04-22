#!/usr/bin/perl

# Project Euler -- Problem 14

# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

# It can be seen that this sequence (starting at 13 and finishing at
# 1) contains 10 terms. Although it has not been proved yet (Collatz
# Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

use 5.10.0;
use strict;
use warnings;
no warnings 'recursion';

use Data::Dump qw< ddx pp >;

my @SEQUENCE_CACHE = ( undef, 1 );

sub is_even { $_[0] % 2 == 0 }

sub collatz_sequence {
    my $n = shift;

    unless ($SEQUENCE_CACHE[$n]) {
        my $tmp_n = $n;
        my $len = 1;
        while ($tmp_n > 1) {
            $tmp_n = is_even($tmp_n) ? $tmp_n / 2 : 3 * $tmp_n + 1;
            if ($SEQUENCE_CACHE[$tmp_n]) {
                $len += $SEQUENCE_CACHE[$tmp_n];
                last;
            }
            else {
                $len++;
            }
        }
        $SEQUENCE_CACHE[$n] = $len;
    }
    return $SEQUENCE_CACHE[$n];
}

my $max_seq_len = 1;
my $max_start = 1;

my $begin = shift || 2;
my $end   = shift || 10;

$end = $begin if $end < $begin;
for ($begin .. $end) {
    my $seq_len = collatz_sequence($_);
    if ($max_seq_len < $seq_len) {
        $max_seq_len = $seq_len;
        $max_start = $_;
    }
    # say STDERR "$_, $seq_len";
}

# pp \@SEQUENCE_CACHE;

say '- ', scalar @SEQUENCE_CACHE;
say "= $max_start, $max_seq_len";


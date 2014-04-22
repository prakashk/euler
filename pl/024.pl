#!/usr/bin/perl

# Project Euler -- Problem 24

# A permutation is an ordered arrangement of objects. For example,
# 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all
# of the permutations are listed numerically or alphabetically, we
# call it lexicographic order. The lexicographic permutations of 0, 1
# and 2 are:

# 012 021 102 120 201 210

# What is the millionth lexicographic permutation of the digits 0, 1,
# 2, 3, 4, 5, 6, 7, 8 and 9?

use 5.10.0;
use strict;
use warnings;

use Algorithm::Permute qw< permute >;

# # from perlfaq4
# sub permute(&@) {
#     my $code = shift;
#     my @idx  = 0 .. $#_;
#     while ($code->(@_[@idx])) {
#         my $p = $#idx;
#         --$p while $idx[ $p - 1 ] > $idx[$p];
#         my $q = $p or return;
#         push @idx, reverse splice @idx, $p;
#         ++$q while $idx[ $p - 1 ] > $idx[$q];
#         @idx[ $p - 1, $q ] = @idx[ $q, $p - 1 ];
#     }
# }

my $start = shift // 0;
my $end   = shift // 9;
my $limit = shift // 1_000_000;

my @list = $start .. $end;
my $counter = 0;

# my $max = '';
# my $number_at_limit = '';

# permute { say "@list" } @list;

# permute {
#     my $number = join "", @list;
#     say $number;
#     $max = $number if $max le $number;
#     $counter++;
#     if ($counter == $limit) {
#         $number_at_limit = $max;
#     }
#     1;
# } @list;

# say "== $number_at_limit ==";

my @permutes;
permute {
    push @permutes, join "", @list;
    $counter++;
    if ($counter == $limit) {
        say '-- ', (sort @permutes)[-1], ' --';
        # 0;
    }
    # else {
        1;
    # }
} @list;

# say for @permutes;

say scalar @permutes;

say '-- ', (sort @permutes)[$limit - 1], ' --';

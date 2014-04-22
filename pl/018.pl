#!/usr/bin/perl

# Project Euler -- Problem 18

# By starting at the top of the triangle below and moving to adjacent
# numbers on the row below, the maximum total from top to bottom is
# 23.

#    3
#   7 4
#  2 4 6
# 8 5 9 3

# That is, 3 + 7 + 4 + 9 = 23.

# Find the maximum total from top to bottom of the triangle below:

#               75
#              95 64
#             17 47 82
#            18 35 87 10
#           20 04 82 47 65
#          19 01 23 75 03 34
#         88 02 77 73 07 63 67
#        99 65 04 28 06 16 70 92
#       41 41 26 56 83 40 80 70 33
#      41 48 72 33 47 32 37 16 94 29
#     53 71 44 65 25 43 91 52 97 51 14
#    70 11 33 28 77 73 17 78 39 68 17 57
#   91 71 52 38 17 14 91 43 58 50 27 29 48
#  63 66 04 68 89 53 67 30 73 16 69 87 40 31
# 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

# NOTE: As there are only 16384 routes, it is possible to solve this
# problem by trying every route. However, Problem 67, is the same
# challenge with a triangle containing one-hundred rows; it cannot be
# solved by brute force, and requires a clever method! ;o)

use 5.10.0;
use strict;
use warnings;
use List::Util qw< max >;

my @triangle = (
    [ qw<                              75                              > ],
    [ qw<                            95  64                            > ],
    [ qw<                          17  47  82                          > ],
    [ qw<                        18  35  87  10                        > ],
    [ qw<                      20  04  82  47  65                      > ],
    [ qw<                    19  01  23  75  03  34                    > ],
    [ qw<                  88  02  77  73  07  63  67                  > ],
    [ qw<                99  65  04  28  06  16  70  92                > ],
    [ qw<              41  41  26  56  83  40  80  70  33              > ],
    [ qw<            41  48  72  33  47  32  37  16  94  29            > ],
    [ qw<          53  71  44  65  25  43  91  52  97  51  14          > ],
    [ qw<        70  11  33  28  77  73  17  78  39  68  17  57        > ],
    [ qw<      91  71  52  38  17  14  91  43  58  50  27  29  48      > ],
    [ qw<    63  66  04  68  89  53  67  30  73  16  69  87  40  31    > ],
    [ qw<  04  62  98  27  23  09  70  98  73  93  38  53  60  04  23  > ],
);

my @lengths = @{$triangle[0]};
my $count = 0;
for my $row (@triangle[1..$#triangle]) {
    say "@lengths";
    my @max_lengths;
    for my $i (0 .. $#$row) {
        if ($i == 0) {
            push @max_lengths, $lengths[$i];
        }
        elsif ($i == $#$row) {
            push @max_lengths, $lengths[$i-1];
        }
        else {
            push @max_lengths, max($lengths[$i-1], $lengths[$i]);
        }
$count++;
    }
say "max_lengths < @max_lengths >";
    @lengths = map { $max_lengths[$_] + $row->[$_] } 0 .. $#$row;
}

say $count;
say "@lengths";
say max @lengths;

#!/usr/bin/perl

# Project Euler -- Problem 22

# Using names.txt (right click and 'Save Link/Target As...'), a 46K
# text file containing over five-thousand first names, begin by
# sorting it into alphabetical order. Then working out the
# alphabetical value for each name, multiply this value by its
# alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN,
# which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the
# list. So, COLIN would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?

use 5.10.0;
use strict;
use warnings;

use File::Slurp qw< slurp >;
use List::AllUtils qw< sum uniq >;

sub name_value {
    my $seq = shift;
    my $name = shift;

    return $seq * (sum map ord($_)-ord('A')+1, split '', $name);
}

my $names = slurp("names.txt");
my @names = sort map {s/"//g; $_} split ",", $names;
say sum map {name_value($_+1, $names[$_])} 0 .. $#names;

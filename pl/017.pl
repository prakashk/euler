#!/usr/bin/perl

# Project Euler -- Problem 17

# If the numbers 1 to 5 are written out in words: one, two, three,
# four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in
# total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were
# written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three
# hundred and forty-two) contains 23 letters and 115 (one hundred and
# fifteen) contains 20 letters. The use of "and" when writing out
# numbers is in compliance with British usage.

use 5.10.0;
use strict;
use warnings;
use Number::Spell;

my ($start, $end) = @ARGV;

$start ||= 1;
$end ||= 1000;

say scalar map { s/hundred /hundred and /; /([a-z])/g } map { spell_number($_) } $start .. $end;

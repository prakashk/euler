#!/usr/bin/perl

# Project Euler -- Problem 16

# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2^1000?

use 5.10.0;
use warnings;
use strict;

use List::Util qw< sum >;
use bigint;
say sum split //, 2**1000;

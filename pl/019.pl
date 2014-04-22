#!/usr/bin/perl

# Project Euler -- Problem 19

# You are given the following information, but you may prefer to do
# some research for yourself.

#     * 1 Jan 1900 was a Monday.
#     * Thirty days has September,
#       April, June and November.
#       All the rest have thirty-one,
#       Saving February alone,
#       Which has twenty-eight, rain or shine.
#       And on leap years, twenty-nine.
#     * A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

# How many Sundays fell on the first of the month during the twentieth
# century (1 Jan 1901 to 31 Dec 2000)?

use 5.10.0;
use strict;
use warnings;

sub is_leap {
    $_[0] % 4 == 0 && ($_[0] % 100 != 0 || $_[0] % 400 == 0)
}

my @days_in_months      = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
my @days_in_months_leap = (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

my $x = 0;
my @month_firsts      = (0, map { $x += $_ } @days_in_months);
$x = 0;
my @month_firsts_leap = (0, map { $x += $_ } @days_in_months_leap);

my @month_first_days      = map { $_ % 7 } @month_firsts;
my @month_first_days_leap = map { $_ % 7 } @month_firsts_leap;

say "days_in_months   = [@days_in_months]";
say "month_firsts     = [@month_firsts]";
say "month_first_days = [@month_first_days]";

say "days_in_months_leap   = [@days_in_months_leap]";
say "month_firsts_leap     = [@month_firsts_leap]";
say "month_first_days_leap = [@month_first_days_leap]";

sub count_sundays {
    my $year = shift;
    my $first_days = shift;
    my $year_start_day = shift;

    my $leap_adj = is_leap($year) ? 1 : 0;
    my @first_days = map { ($_ + $year_start_day) % 7 } @$first_days;
    my $num_sundays = scalar grep { $_ == 0 } @first_days[0..11];
    say "$year\[$year_start_day]: $num_sundays [@first_days]";
    return ($num_sundays, $first_days[-1]);
}

my $year_start_day_1900 = 1;	# monday
my (undef, $wday_adj) = count_sundays( 1900, is_leap(1900) ? \@month_first_days_leap : \@month_first_days, $year_start_day_1900 );

my $num_all_sundays = 0;
for my $year (1901 .. shift || 2000) {
    my ($num_sundays, $next_year_start_day) = count_sundays($year, is_leap($year) ? \@month_first_days_leap : \@month_first_days, $wday_adj);
    $num_all_sundays += $num_sundays;
    $wday_adj = $next_year_start_day;
}

say $num_all_sundays;

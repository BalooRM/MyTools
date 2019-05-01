#!\perl
use strict;
# R. Ballew, 01-May-2019
# Perform case-insensitive match one or more search terms to lines read 
# from STDIN
my $usage =
    "Usage: \n" .
    " > perl srchor.pl first second < file.txt\n" . 
    " > perl srchor.pl first second third < file.txt\n" .
    " > perl srchor.pl \"first term\" second < file.txt\n";

#my $numARGV = $#ARGV;
#++$numARGV;
#if ($numARGV == 1) {
#    print "There is $numARGV command line argument.\n";
#} else {
#    print "There are $numARGV command line arguments.\n";
#}
#for (my $i = 0; $i <= $#ARGV; $i++) {
#    print "$ARGV[$i]\n";
#}

if ($#ARGV == -1) {
    print "$usage\n";
    die;
}

my $myMatchFlag;
my $myMatch; # assume no match; we will add 1 for each match

# Read input data from STDIN. 
while (my $text = <STDIN>) {
    chomp ($text);
    $myMatch = 0;   # assume no match
    
    for (my $i = 0; $i <= $#ARGV; $i++) {
	if ($text =~ m/$ARGV[$i]/i) {
	    #print "$ARGV[$i] - $text\n";
	    $myMatch += 1;    # increment if match found
	} 
    }
    if ($myMatch > 0) {
	print "$text\n";
    }
}

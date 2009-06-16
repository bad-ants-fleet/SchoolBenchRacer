#!usr/local/bin/perl

use strict;
use warnings;
use Data::Dumper;
use vars qw/@RaceTrack %CARS/;


@RaceTrack = readin_textfile();
#   print Dumper(@RaceTrack);

%CARS = ( Fab => undef,
	  Stef => undef,
	  Test => undef,);

# Find possible Start Positions, find End positions
my @CurrentTrack = process_matrix(\@RaceTrack, \%CARS);


sub process_matrix {
    my @newtrack = @{shift()};
    my %cars = %{shift()};

    foreach my $car (keys %cars) { 
       if (defined($cars{$car})) {
          print "strange\n";
       } else {
          my $count=0;
          foreach (@{$newtrack[-1]}) {
             if ($_ eq 1) {
                 $newtrack[-1]->[$count] = substr($car, 0, 1);
                 last;
             }
             $count++;
          }
       }
    }

 print "@{$newtrack[-1]}\n";
 return @newtrack;
}



#-------- Subroutines --------#

sub readin_textfile {
    my @track;
    while (<>) {
          next if /^\# /;
          push(@track, [split()]);
    }
 return @track;
}

sub car {
    my @matrix = @{shift()};
    my ($pos, $kmh) = @_;
 # Process position and kmh to generate the new value
 return $pos, $kmh;
}


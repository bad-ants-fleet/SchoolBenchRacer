#!usr/local/bin/perl

use strict;
use warnings;
use Data::Dumper;
use vars qw/@RaceTrack %CARS @CurrentTrack/;


@RaceTrack = readin_textfile();
# print Dumper(@RaceTrack);

%CARS = ( Fab => undef,
	  Stef => undef,
	  Test => undef,);

# Find possible Start Positions, find End positions

for (0..3) {
   @CurrentTrack = update_car_positions(\@RaceTrack, \%CARS);

 print Dumper(%CARS);

}



sub update_car_positions {
    my @newtrack = @{shift()};
    my %cars = %{shift()};
    my $height = $#newtrack;

    foreach my $car (keys %cars) { 
       if (defined($cars{$car})) { 	# Main Position update
          print "CHECK\n";
          foreach my $car (keys %cars) {
             print Dumper($cars{$car})."\n";
          }
          
       } else { 			# Only for initialization!
          my $count=0;
          foreach (@{$newtrack[$height]}) {
             if ($_ eq 1) {
                 $newtrack[$height]->[$count] = substr($car, 0, 1);
                 $CARS{$car}=["$height","$count","0","0"];			# MAIN!!!
                 last;
             }
             $count++;
          }
          print "@{$newtrack[-1]}\n";
       }
    }
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


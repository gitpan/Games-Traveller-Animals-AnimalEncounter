package Games::Traveller::Animals::AnimalEncounter;             
                                                       
use 5.008003;
use strict;
use warnings;

our $VERSION = '0.50';

sub new { bless {}, shift }                            
                                                       
my (%index,
    %attrib,                                           
    %category,                                         
    %mass,                                             
    %hits,                                             
    %dead,                                             
    %weapon,                                           
    %damageMod,                                        
    %armor,                                            
    %behavior);                                        

sub index     :lvalue { $index{+shift}           }                                                   
sub attribute :lvalue { $attrib{+shift}          }     
sub category  :lvalue { $category{+shift}        }     
sub mass      :lvalue { $mass{+shift}            }     
sub hits      :lvalue { $hits{+shift}            }     
sub dead      :lvalue { $dead{+shift}            }     
sub weapon    :lvalue { $weapon{+shift}          }     
sub damageMod :lvalue { $damageMod{+shift}       }     
sub armor     :lvalue { $armor{+shift}           }     
sub behaviour :lvalue { $behavior{+shift}        }     
sub behavior  :lvalue { $behavior{+shift}        }     
                                                       
sub isEvent           { $attrib{+shift} eq 'Event' }   

sub toString
{
   my $self = shift;
   
   if ( $self->isEvent )
   {
      sprintf( "%2d   Event: %s\n", $self->index, $self->category );
   }
   else
   {
      sprintf ("%2d%2s %-14s %4s %3.3s/%-2.2s %9.9s %3.3s %-7s %s\n", 
         $self->index,
         $self->attribute || '',
         $self->category, 
         $self->mass,
         $self->hits,
         $self->dead,
         $self->weapon,
         $self->damageMod,
         $self->armor,
         $self->behaviour);
   }
}
                                        
sub DESTROY                                            
{                                                      
  my $sref = 0 + shift;                                
  delete $index{$sref},
         $attrib{$sref},                               
         $category{$sref},                             
         $size{$sref},                                 
         $hits{$sref},                                 
         $dead{$sref},                                 
         $weapon{$sref},                               
         $damageMod{$sref},                            
         $behavior{$sref};                             
}                                                      

1;

__END__

=head1 NAME

   Games::Traveller::Animals::AnimalEncounter -- a row in an Animal Encounters table

=head1 DESCRIPTION

This package is used by Games::Traveller::Animals to construct the animal encounter tables.  The user can access the individual fields of this package through some handy-dandy methods:

=head1 ACCESSORS

=over 3

   $enc->index      : returns the entry number for this encounter (2-12).
   $enc->attribute  : returns one of:
      ''      - no attribute
      'f'     - flying
      'a'     - ampbhibian
      't'     - triphibian
      's'     - swimmer
      'Event' - event
   $enc->category   : returns the type of animal or event.
   $enc->mass       : returns the animal's mass.
   $enc->hits       : returns the number of wounding hits for this animal.
   $enc->dead       : returns the number of mortal hits for this animal.
   $enc->weapon     : returns the animal's weapon type ('attacks as...').
   $enc->damageMod  : returns the damage modifier for this animal.
   $enc->armor      : returns the animal's armor rating.
   $enc->behavior   : returns the animal's behavior string (eg "F5 A4 S1").

=back

=head1 AUTHOR

  Pasuuli Immuguna

=head1 COPYRIGHT

This library is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=head1 AVAILABILITY

The latest version of this library is likely to be available from CPAN.

=cut


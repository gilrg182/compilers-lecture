#Gilberto Rogel Garcia A01630171
use feature 'say';


my $file = 'log'; 
open(FH, $file) or die("File $file not found"); 
      
my $count_instructions = 0;
my $count_functions = 0;

print "Hi, this is the output of the analysis: \n";

while(my $String = <FH>) { 

    if($String =~ /(<main>:)/ || $String =~ /(<foo>:)/ ) { 
           
            #say substr $1, 1 , 4 ; 
            print "$String \n"; 
            
            $count_functions++;
     } 
     next unless $String =~ /(mov) / || $String =~ /(movss)/ || $String =~ /(movd)/ || $String =~ /(movb)/; 
           
            print "$1 \n"; 
            
            $count_instructions++;
     
} 

print "You have $count_functions functions \n";
print "You have $count_instructions  instructions in this object file ";

close(FH); 
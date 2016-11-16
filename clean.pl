use strict;
use File::Copy;

die "clean.pl <directory>" if scalar(@ARGV) != 1;
chdir($ARGV[0]) || die "Unable to change directory to $ARGV[0]";
opendir(DIR,"./") || die "Unable to open local directory";

while (my $file = readdir(DIR)) {
	#print "$file\n";
	if (-d $file) { next; }
	if ($file =~ /\(J\)/i) { move($file,"j/$file"); }
	elsif ($file =~ /\(E\)/i) { move($file,"e/$file"); }
	elsif ($file =~ /\(G\)/i) { move($file,"g/$file"); }
	elsif ($file =~ /\(Ch\)/i) { move($file,"ch/$file"); }
	elsif ($file =~ /\(VS\)/i) { move($file,"vs/$file"); }
	elsif ($file =~ /\(PC/i) { move($file,"pc/$file"); }
	elsif ($file =~ /\(PRG/i) { move($file,"prg/$file"); }
	elsif ($file =~ /\(PAL/i) { move($file,"pal/$file"); }
	elsif ($file =~ /\[b\d*\]/i) { move($file,"b/$file"); }
	elsif ($file =~ /\[p\d*\]/i) { move($file,"p/$file"); }
	elsif ($file =~ /\[a\d*\]/i) { move($file,"a/$file"); }
	elsif ($file =~ /\[o\d*\]/i) { move($file,"o/$file"); }
	elsif ($file =~ /\[t\d*/i) { move($file,"t/$file"); }
	elsif ($file =~ /prototype/i) { move($file,"proto/$file"); }
	elsif ($file =~ /hack/i) { move($file,"hack/$file"); }
	elsif ($file !~ /\!/) { move($file,"nobang/$file"); }
}

closedir(DIR);


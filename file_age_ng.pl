#!/usr/bin/perl
use File::stat;
use File::Basename;

$filePrefix = "FileAge_";

%check = ("/var/log/nate.log", 30,
	  "/var/log/caddy.log", 90,
	  "/var/log/syslog", 30);

while (($file, $timeout) = each(%check)) {
	my $filename = basename($file);
	my $mtime = stat($file)->mtime;
	my $diff = time() - $mtime;

	if($diff < $timeout) {
		print("0 " . $filePrefix . $filename . " seconds=$diff - All okay: File refreshed $diff seconds ago (timeout at $timeout).\n");
	} else {
		print("2 " . $filePrefix . $filename . " seconds=$diff - Expired: File refreshed $diff seconds ago (timeout at $timeout).\n");
	}
}

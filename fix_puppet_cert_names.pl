#!/usr/bin/perl -w
use strict;
use Data::Dumper;
use Sys::Hostname;

my $host = hostname;
chdir "/var/lib/puppet/ssl" or
  die "Could not change working directory to /var/lib/puppet/ssl. Check to make sure puppet is installed.";

print "Hostname: $host\n";
use File::Find;
find( {
   wanted => sub {
      # PATTERN: ./ca/signed/master1.pem
      if ( $host =~ /master1/) {
        #print "$host \n";
        if ( $File::Find::name =~ /\.\/(.*)\/(master2)\.pem/ ) {
           my @files = `ls`;
           foreach my $file (@files) {
              chomp $file;
              if ( $file =~ /master/ ) {
                 print "Changing name of $file \n";
                 rename($file, ($host . '.pem'));
              }
           }
        }
        if ( $File::Find::name =~ /\.\/(.*)\/(cobblerpuppetmaster)\.pem/ ) {
           my @files = `ls`;
           foreach my $file (@files) {
              chomp $file;
              if ( $file =~ /master/ ) {
                 print "Changing name of $file \n";
                 rename($file, ($host . '.pem'));
              }
           }
        }
      }
      if ( $host =~ /master2/) {
        #print "$host \n";
        if ( $File::Find::name =~ /\.\/(.*)\/(master1)\.pem/ ) {
           my @files = `ls`;
           foreach my $file (@files) {
              chomp $file;
              if ( $file =~ /master/ ) {
                 print "Changing name of $file \n";
                 rename($file, ($host . '.pem'));
              }
           }
        }
        if ( $File::Find::name =~ /\.\/(.*)\/(cobblerpuppetmaster)\.pem/ ) {
           my @files = `ls`;
           foreach my $file (@files) {
              chomp $file;
              if ( $file =~ /master/ ) {
                 print "Changing name of $file \n";
                 rename($file, ($host . '.pem'));
              }
           }
        }
      }
   }
}, ".");

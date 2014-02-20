#!/usr/bin/env python

import os
import socket
import fnmatch

pattern     = 'cobblerpuppetmaster.pem'

directory   = '/var/lib/puppet/ssl'
new_pattern = socket.gethostname() + '.pem'
count       = 0

for root, dirs, files in os.walk(directory):
   for basename in files:
      if fnmatch.fnmatch(basename, pattern):
         count += 1
         filename = os.path.join(root, basename)
         os.rename(os.path.join(root, basename), os.path.join(root, new_pattern))
         print "Renamed ", os.path.join(root, basename), "to", os.path.join(root, new_pattern)

if count == 0:

  print "Nothing renamed..."

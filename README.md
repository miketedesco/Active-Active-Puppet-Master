### Overview
I wanted to get two puppet masters to work in active state.

#### fix_puppet_cert_names.pl
This renames the puppet master certs in /var/lib/puppet/ssl

#### fix_my_cert_file_name.py
This does the same thing as fix_puppet_cert_names.pl but it is easier to work with.
In the file change "cobblerpuppetmaster.pem" to whatever your certs file names are.

#### Hurdles:
 1. understanding puppetc erts
 2. two masters and an agent to run puppet without any faulures.

#### To Do:
More Detail

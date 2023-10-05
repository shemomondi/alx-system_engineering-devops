#!/usr/bin/env bash
#using Puppet to make changes to our configuration file
class { 'stdlib':
  before => File_line['Declare identity file'],
}

file_line { 'Declare identity file':
  path   => '/etc/ssh/ssh_config',  # Absolute path
  line   => '    IdentityFile ~/.ssh/school',
  match  => '    IdentityFile.*',
  ensure => present,
}

file_line { 'Turn off passwd auth':
  path   => '/etc/ssh/ssh_config',  # Absolute path
  line   => '    PasswordAuthentication no',
  match  => '    PasswordAuthentication.*',
  ensure => present,
}

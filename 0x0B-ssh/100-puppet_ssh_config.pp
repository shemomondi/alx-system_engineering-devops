# Ensure SSH client uses the specified private key
class { 'stdlib':
  before => File_line['Declare identity file'],
}

file_line { 'Declare identity file':
  path   => '/etc/ssh/ssh_config',  # Absolute path
  line   => '    IdentityFile ~/.ssh/school',
  match  => '    IdentityFile.*',
  ensure => present,
}

# Ensure SSH client refuses to authenticate using a password
file_line { 'Turn off passwd auth':
  path   => '/etc/ssh/ssh_config',  # Absolute path
  line   => '    PasswordAuthentication no',
  match  => '    PasswordAuthentication.*',
  ensure => present,
}

# == Class pig::config
#
# Configure environment for pig.
#
class pig::config {
  $mapred_home = $::pig::mapred_home
  if $mapred_home {
    file{'/etc/profile.d/hadoop-pig.csh':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('pig/hadoop-pig.csh.erb'),
    }
    file{'/etc/profile.d/hadoop-pig.sh':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('pig/hadoop-pig.sh.erb'),
    }
  } else {
    file{'/etc/profile.d/hadoop-pig.csh':
      ensure => 'absent',
    }
    file{'/etc/profile.d/hadoop-pig.sh':
      ensure => 'absent',
    }
  }
}

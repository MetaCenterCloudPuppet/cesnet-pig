# == Class pig::config
#
# Configure environment for pig.
#
class pig::config {
  file{'/etc/profile.d/hadoop-pig.csh':
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/pig/hadoop-pig.csh',
  }

  file{'/etc/profile.d/hadoop-pig.sh':
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/pig/hadoop-pig.sh',
  }
}

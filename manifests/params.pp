# == Class pig::params
#
# This class is meant to be called from pig
# It sets variables according to platform
#
class pig::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'pig'
      $package_datafu = 'pig-udf-datafu'
    }
    'RedHat': {
      $package_name = 'pig'
      $package_datafu = 'pig-udf-datafu'
    }
    default: {
      fail("${::osfamily}/${::operatingsystem} not supported")
    }
  }

  $datafu_enabled = $::osfamily ? {
    'Debian' => true,
    'RedHat' => $::operatingsystem ? {
      'Fedora' => false,
      default => true
    },
    default => false,
  }

  $mapred_home = $::osfamily ? {
    'RedHat' => $::operatingsystem ? {
      'Fedora' => undef,
      default => '/usr/lib/hadoop-mapreduce',
    },
    default => '/usr/lib/hadoop-mapreduce',
  }
}

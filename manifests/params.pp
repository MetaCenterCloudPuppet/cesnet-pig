# == Class pig::params
#
# This class is meant to be called from pig
# It sets variables according to platform
#
class pig::params {
  case "${::osfamily}-${::operatingsystem}" {
    /RedHat-Fedora/: {
      $package = {
        pig => 'pig',
        datafu => undef,
      }
    }
    /Debian|RedHat/: {
      $package = {
        pig => 'pig',
        datafu => 'pig-udf-datafu',
      }
    }
    default: {
      fail("${::osfamily}/${::operatingsystem} not supported")
    }
  }

  $datafu_enabled = "${::osfamily}-${::operatingsystem}" ? {
    /RedHat-Fedora/ => false,
    /Debian|RedHat/ => true,
    default         => false,
  }

  $mapred_home = "${::osfamily}-${::operatingsystem}" ? {
    /RedHat-Fedora/ => undef,
    /Debian|RedHat/ => '/usr/lib/hadoop-mapreduce',
    default         => '/usr/lib/hadoop-mapreduce',
  }
}

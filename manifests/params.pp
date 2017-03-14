# == Class pig::params
#
# This class is meant to be called from pig
# It sets variables according to platform
#
class pig::params {
  case "${::osfamily}-${::operatingsystem}" {
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
    /Debian|RedHat/ => true,
    default         => false,
  }

  $mapred_home = "${::osfamily}-${::operatingsystem}" ? {
    /Debian|RedHat/ => '/usr/lib/hadoop-mapreduce',
    default         => '/usr/lib/hadoop-mapreduce',
  }
}

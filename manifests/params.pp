# == Class pig::params
#
# This class is meant to be called from pig
# It sets variables according to platform
#
class pig::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'pig'
    }
    'RedHat': {
      $package_name = 'pig'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}

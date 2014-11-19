# == Class: pig
#
# Pig setup.
#
class pig () inherits pig::params {
  class { 'pig::install': } ->
  class { 'pig::config': } ~>
  class { 'pig::service': } ->
  Class['pig']
}

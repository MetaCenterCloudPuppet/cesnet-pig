# == Class: pig
#
# Pig setup.
#
class pig (
  $datafu_enabled = $params::datafu_enabled,
) inherits pig::params {
  class { '::pig::install': } ->
  class { '::pig::config': } ->
  Class['pig']
}

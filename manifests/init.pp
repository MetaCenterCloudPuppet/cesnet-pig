# == Class: pig
#
# Pig setup.
#
# === Parameters
#
# ####`datafu_enabled` true
#
# Install also Pig User-Defined Functions collection.
#
class pig (
  $datafu_enabled = $params::datafu_enabled,
) inherits pig::params {
  class { 'pig::install': } ->
  class { 'pig::config': } ->
  Class['pig']
}

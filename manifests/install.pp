# == Class pig::install
#
class pig::install {
  include ::stdlib

  ensure_packages($pig::package['pig'])

  if $pig::datafu_enabled == true and $pig::package['datafu'] {
    ensure_packages($pig::package['datafu'])
  }
}

# == Class pig::install
#
class pig::install {
  include stdlib

  ensure_packages($pig::package_name)

  if $::osfamily == 'RedHat' and $::operatingsystem == 'Fedora' {
    # buggy pig on Fedora
    file { '/usr/share/pig/bin/pig':
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
      alias  => 'bin-pig',
      source => 'puppet:///modules/pig/fedora-pig',
    }

    Package[$pig::package_name] -> File['/usr/share/pig/bin/pig']
  }
}

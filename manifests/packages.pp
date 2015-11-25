# == Class: php::packages
#
class php::packages (
  $ensure   = $::php::ensure,
  $packages = $::php::packages,
)
{

  package { $packages:
    ensure => installed,
  }

}

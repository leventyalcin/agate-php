# documentation
class php (
  $ensure       = $::php::params::ensure,
  $prefix       = $::php::params::prefix,
  $packages     = $::php::params::packages,
  $config_files = $::php::params::config_files,
  $fpm_enabled  = $::php::params::fpm_enabled,
  $fpm_configs  = $::php::params::fpm_configs,

) inherits ::php::params {

  $package_list = prefix( $packages, $prefix )

  class { '::php::packages':
    ensure   => $ensure,
    packages => $package_list,
  }

  class { 'php::config': }

  class { 'php::fpm': }


  if ( $fpm_enabled and ! empty( $fpm_configs ) ) {
    $fpm_service_ensure = 'running'
    $fpm_service_enable = true
  } else {
    $fpm_service_ensure = 'stopped'
    $fpm_service_enable = false
  }
  service { 'php-fpm':
    ensure     => $fpm_service_ensure,
    enable     => $fpm_service_enable,
    hasrestart => true,
    hasstatus  => true,
    require    => Package[$package_list],
  }

  Class['::php::packages'] ->
  Class['::php::config'] ->
  Class['::php::fpm'] ->
  Service['php-fpm']

}

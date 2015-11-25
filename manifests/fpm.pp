# == Class: php::fpm
#
class php::fpm (
  $files       = $::php::fpm_configs,
  $fpm_enabled = $::php::fpm_enabled,
) inherits php::params {

  if ( $files and $fpm_enabled ){
    info('Creating PHP-FPM configs')
    create_resources( 'php::config::files', $files )
  }

}

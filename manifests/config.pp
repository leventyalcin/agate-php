# == Class: php::config
#
class php::config (
    $files = $::php::config_files,
) inherits php::params {

  if ( ! empty( $files ) ){
    info('Creating PHP configs')
    create_resources('::php::config::files', $files )
  }

}

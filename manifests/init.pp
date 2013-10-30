class mapserver {

  validate_re(
    $::osfamily,
    ['^Debian$', '^RedHat$'],
    "Unsupported OS family ${::osfamily}"
  )

  $packages = $::osfamily ? {
    Debian => [
      'cgi-mapserver',
      'mapserver-bin',
      'php5-mapscript',
      'python-mapscript',
      'gdal-bin',
      'python-gdal',
      'proj-data',
    ],
    RedHat => [
      'mapserver-python',
      'php-mapserver',
      'gdal',
      'gdal-python',
      'proj-epsg',
    ],
  }

  ensure_packages( $packages )

}

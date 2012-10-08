class mapserver::redhat {

  case $lsbmajdistrelease {
    '6': {
      package {
        [
          "mapserver-python",
          "php-mapserver",
          "gdal",
          "gdal-python",
          "proj-epsg",
        ]:
        ensure => present,
      }
    }

    default: {
      fail "This release is not supported by mapserver::redhat"
    }
  }

}

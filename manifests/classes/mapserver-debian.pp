class mapserver::debian {

  case $lsbdistcodename {
    lenny, squeeze: {

      package {
        [
          "cgi-mapserver",
          "mapserver-bin",
          "perl-mapscript",
          "php5-mapscript",
          "python-mapscript",
          "gdal-bin",
          "libecw",
          "python-gdal",
          "proj-bin",
          "proj-data",
          "libgeos-dev",
          "libgeos-c1",
        ]:
        ensure => present,
      }
    }

    default: {
      fail "This release is not supported by mapserver::debian"
    }
  }

}

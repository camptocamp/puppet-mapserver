class mapserver::debian {

  case $lsbdistcodename {
    lenny, squeeze: {

      package {
        [
          "cgi-mapserver",
          "mapserver-bin",
          "php5-mapscript",
          "python-mapscript",
          "gdal-bin",
          "python-gdal",
          "proj-data",
        ]:
        ensure => present,
      }
    }

    default: {
      fail "This release is not supported by mapserver::debian"
    }
  }

}

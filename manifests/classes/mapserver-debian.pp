class mapserver::debian {

  case $lsbdistcodename {
    lenny, squeeze: {

      file {"/usr/share/proj/epsg":
        ensure => present,
        require => Package["proj-data"],
        source  => $mapserver_epsg ? {
          'minimal' => "puppet:///mapserver/epsg.minimal",
          default   => undef,
        },
      }

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

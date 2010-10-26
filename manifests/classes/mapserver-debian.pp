class mapserver::debian {

  case $lsbdistcodename {
    lenny: {

      file {"/usr/share/proj/epsg":
        ensure => present,
        require => Package["proj-data"],
        source  => $mapserver_epsg ? {
          'minimal' => "puppet:///mapserver/epsg.minimal",
          'legacy'  => "puppet:///mapserver/epsg.legacy",
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
  }
}

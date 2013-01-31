class mapserver {
  case $operatingsystem {
    Debian:          { include mapserver::debian }
    /RedHat|CentOS/: { include mapserver::redhat }
    default:         { notice "Unsupported operatingsystem ${operatingsystem}" }
  }
}

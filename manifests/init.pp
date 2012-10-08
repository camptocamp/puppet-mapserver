class mapserver {
  case $operatingsystem {
    Debian:  { include mapserver::debian }
    RedHat:  { include mapserver::redhat }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }
}

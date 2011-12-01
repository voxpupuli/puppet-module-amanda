class amanda::client::xinetd {
  include amanda::params
  include xinetd

  xinetd::service {
    "amanda_udp":
      servicename => "amanda",
      socket_type => "dgram",
      protocol    => "udp",
      port        => "10080",
      user        => $amanda::params::user,
      group       => $amanda::params::group,
      server      => $amanda::params::amandadpath,
      server_args => "-auth=bsd amdump";
    "amanda_tcp":
      servicename => "amanda",
      socket_type => "stream",
      protocol    => "tcp",
      port        => "10080",
      user        => $amanda::params::user,
      group       => $amanda::params::group,
      server      => $amanda::params::amandadpath,
      server_args => "-auth=bsdtcp amdump";
  }

}

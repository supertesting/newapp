node default {
    include hosts
}


node "clone3.mydomain.org"
{
	include cassandra
	class { 'cassandra':
  		cluster_name => 'YourCassandraCluster',
  		seeds        => [ '192.0.2.5', '192.0.2.23', '192.0.2.42', ],
	}
}

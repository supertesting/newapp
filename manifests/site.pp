node default {
    include hosts
}


node "clone3.mydomain.org"
{
	include cassandra
	class { 'cassandra':
  		cluster_name => 'YourCassandraCluster',
  		seeds        => [ 'clone2' ],
	}
}

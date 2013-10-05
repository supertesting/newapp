node default {
    include hosts
}

node "clone3.mydomain.org"
{
	include apt
	class { 'cassandra':
  		cluster_name => 'YourCassandraCluster',
  		seeds        => [ 'clone2','puppet', ],
	}
}

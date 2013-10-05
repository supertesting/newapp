node default {
    include hosts
}


node "clone3.mydomain.org"
{
	include cassandra
}

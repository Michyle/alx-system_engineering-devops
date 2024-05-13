# this will steup a NEw Ubuntu server with nginx and will add a custom http header


exec { 'update system':
	command => '/usr/bin/apt-get update',
}

package { 'nginx' :
	ensure => 'installed',
	require => Exec['update system']
}

file {'/var/www/html/index.html":
	content => 'Hello World!'
}

file {'/var/www/html/index.html':
	content => 'Hello World!'
}

exe {'redirect_me':
	command => 'sed -i "24i\	rewrite ^/redirect_me https://th3-gr00t.tk/ permanent;" /etc/nginx/sites-available/default
	provider => 'shell'
}

exe {'HTTP header':
	command => 'sed -i "25i\	add_header X-Served-By \$hostname;" /etc/nginx/sites-available/default',
	provider => 'sheel'
}

service {'nginx':
	ensure => running,
	require => Package['nginx']
}

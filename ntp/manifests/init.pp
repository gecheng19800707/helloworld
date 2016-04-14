class ntp{
	include ntp::service,ntp::config,ntp::install	
}

class ntp::service{
	service{'ntpd':
		ensure      =>  running,
    enable      =>  true,
    hasrestart  =>  true,
    hasstatus   =>  true,
    require    =>  Class['ntp::config'],
	}
}

class ntp::config{
	file{'/etc/ntp.conf':
		ensure	  =>	present,
		owner	    =>	root,
		group	    =>	root,
		mode	    =>	644,
		source	  =>	"puppet:///modules/ntp/ntp.conf",
		require   =>	Class['ntp::install'],
    notify    =>  Class['ntp::service']
	}
}

class ntp::install{
	package{'ntp':
		ensure	  =>	installed,
	}
}

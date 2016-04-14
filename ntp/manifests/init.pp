class ntp{
	include ntp::service,ntp::config,ntp::install	
}

class ntp::service{
	service{"ntpd":
		ensure      =>  running,
    enable      =>  true,
    hasrestart  =>  true,
    hasstatus   =>  true,
    requires    =>  Class["ntp::config"],
	}
}

class ntp::config{
	file{"/etc/ntp.conf"
		ensure	  =>	present,
		owner	    =>	root,
		group	    =>	root,
		mode	    =>	644,
		source	  =>	"puppet:///modules/ntp/files/ntp.conf"
		requires  =>	Class["ntp::install"],
	}
}

class ntp::install{
	packet{"ntp":
		ensure	  =>	installed,
	}
}

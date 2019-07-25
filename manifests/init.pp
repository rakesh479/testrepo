class testrepo {
      if $environment == 'production' {
              notify { 'default-message' :
                         message => "This is production environment"
                     }
      } else {
              notify { 'default-message' :
                         message => "This is not Production environment"
                     }
      }
}

class ntp {
     package { "ntp":
        ensure => "installed"
        }
        
     file { "/etc/ntp.conf" :
        ensure => "present",
        content => "server 0.centos.pool.ntp.org iburst\n"
        }
        
      service { "ntpd" :
       ensure => "running",
       enable => "true"
       }
     }

class base {
  exec { "apt-update":
    command => "/usr/bin/apt-get update",   
  }
  Exec["apt-update"] -> Package <| |>
  package { "git":
    ensure => present
  }
  package { "lynx":
    ensure => present
  }
  package { "nano":
    ensure => present
  }
  package { "vim":
    ensure  => present,
  }
  package { "telnet":
    ensure  => present,
  }
  package { "wget":
    ensure => present,
  }
}

#class jenkins {
#  exec { "jenkins-key":
#    path    => '/home/vagrant',
#    command => "wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -",
#    alias   => "jenkins-key",
#    require => Package["wget"],
#  }      
#  exec { "jenkins-sources":
#    path => '/home/vagrant',
#    command => "sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'",
#    alias => "jenkins-sources",
#    require => Exec["jenkins-key"],
#  }
#  exec { "jenkins-apt-update":
#    path => '/home/vagrant',
#    command => "sudo apt-get update",
#    alias   => "jenkins-apt-update",   
#  }  
#  package { "jenkins":
#    ensure => present,
#    require => Exec["jenkins-apt-update"],
#  }
#}

class php {
  package { "php5-cli":
    ensure => present
  }
}


class extras {
  package { "htop":
    ensure => present,
  }    
  package { "pv":
    ensure => present,
  } 
}

include base
include php
# include jenkins
include extras

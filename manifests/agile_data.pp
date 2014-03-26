node default {

  $basic_packages = ["vim","python-pip"]

  package { $packages:
      ensure   => installed,
  }

  # Install python virtualenv
  exec { "pip install virtualenv":
    path      => ["/usr/bin"],
    subscribe => Package["python-pip"],
  }

  # Get the repo with the code
  vcsrepo { "/opt/agile_data_code":
    ensure   => present,
    provider => git,
    source   => 'https://github.com/jorgeng87/Agile_Data_Code.git',
    revision => 'master'
  }

  # Setup the environment
  exec { "virtualenv -p `which python2.7` venv --distribute":
    path => ["/usr/local/bin"],
    cwd  => "/opt/agile_data_code",
    require => vcsrepo["/opt/agile_data_code"],
  }

}

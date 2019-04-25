# Class: environment_local_facts
# ===========================
#
# Full description of class environment_local_facts here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'environment_local_facts':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2019 Your name here, unless otherwise noted.
#
class environment_local_facts (
    $organization = $::organization,
    $description = $::description,
    $deployment = $::deployment,
    $location = $::location,
    $hostgroup = $::hostgroup,
    $contact = $::contact,
    $home = $::home,
    $user = $::user,
) {

    file { '/etc/ansible/':
	ensure => directory,
	owner => root,
	group => root,
    }

    file { '/etc/facter/':
	ensure => directory,
	owner => root,
	group => root,
    }

    file { '/etc/ansible/facts.d':
	ensure => directory,
	owner => root,
	group => root,
    }

    file { '/etc/facter/facts.d':
	ensure => directory,
	owner => root,
	group => root,
    }

    file { '/etc/environment':
	ensure => file,
	owner => root,
	group => root,
	content => template("environment_local_facts/environment.erb"),
    }
    
    # This is loaded by facter and the puppet agent.
    file { '/etc/facter/facts.d/environment.txt':
	ensure => file,
	owner => root,
	group => root,
	content => template("environment_local_facts/environment.txt.erb"),
    }
    
    # The FACTER_ values in here will override stuff in static facts
    file { '/etc/profile.d/environment-local-facts.sh':
	ensure => file,
	owner => root,
	group => root,
	source => "puppet:///modules/environment_local_facts/environment-local-facts.sh",
    }

    file { '/etc/ansible/facts.d/contact.fact':
	ensure => file,
	owner => root,
	group => root,
	mode => '0755',
	source => "puppet:///modules/environment_local_facts/contact.fact",
    }

    file { '/etc/ansible/facts.d/description.fact':
	ensure => file,
	owner => root,
	group => root,
	mode => '0755',
	source => "puppet:///modules/environment_local_facts/description.fact",
    }


    file { '/etc/ansible/facts.d/deployment.fact':
	ensure => file,
	owner => root,
	group => root,
	mode => '0755',
	source => "puppet:///modules/environment_local_facts/deployment.fact",
    }

    file { '/etc/ansible/facts.d/hostgroup.fact':
	ensure => file,
	owner => root,
	group => root,
	mode => '0755',
	source => "puppet:///modules/environment_local_facts/hostgroup.fact",
    }

    file { '/etc/ansible/facts.d/location.fact':
	ensure => file,
	owner => root,
	group => root,
	mode => '0755',
	source => "puppet:///modules/environment_local_facts/location.fact",
    }

    file { '/etc/ansible/facts.d/organization.fact':
	ensure => file,
	owner => root,
	group => root,
	mode => '0755',
	source => "puppet:///modules/environment_local_facts/organization.fact",
    }
}

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

    file { '/etc/environment':
	ensure => file,
	owner => root,
	group => root,
	content => template("environment_local_facts/environment.erb"),
    }
    
    # This is the file loaded by the Puppet Agent systemd service.
    file { '/etc/sysconfig/puppetagent':
	ensure => file,
	owner => root,
	group => root,
	content => template("environment_local_facts/puppetagent.erb"),
    }
    

    file { '/etc/profile.d/environment-local-facts.sh':
	ensure => file,
	owner => root,
	group => root,
	source => "puppet:///modules/environment_local_facts/environment-local-facts.sh",
    }

}

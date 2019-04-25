# environment_local_facts

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with environment_local_facts](#setup)
    * [What environment_local_facts affects](#what-environment_local_facts-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with environment_local_facts](#beginning-with-environment_local_facts)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module manages the /etc/environment file to create a consistent set of
environmental variables that will be available to all scripts and applications.
The values in /etc/environment are typically overwritten by other scripts, so
this just ensures default values. The goal is to have a consistent set of
facts about the local system to allow instances to self-configure.

In addition, every environmental variable has two instances. One prefixed
with ```FACTER_``` which will automatically become a simple custom fact for
facter. The goal is to allow Puppet modules to run locally with a custom
set of universal facts that are automatically set by user-data or other scripts.
Alternatively, they can be set by applying this module from an ENC.

The end goal is higher interoperability between different configuration systems
and scripts. 

## Setup

### What environment_local_facts affects

This module manages the ```/etc/environment``` file. The same values are written
to /etc/sysconfig/puppetagent, which is typically run by puppet systemd services.

### Setup Requirements

It's highly advisable to set the default values by passing parameters to the module
somehow. This can be done by parameters, by setting the facts in a script, hiera, or
an ENC. Otherwise, dependencies are as minimal as possible.

### Beginning with environment_local_facts

The module should be able to run without parameters to create a default setup.

## Usage

This section is where you describe how to customize, configure, and do the
fancy stuff with your module here. It's especially helpful if you include usage
examples and code samples for doing things with your module.

## Reference

Users need a complete list of your module's classes, types, defined types providers, facts, and functions, along with the parameters for each. You can provide this list either via Puppet Strings code comments or as a complete list in this Reference section.

* If you are using Puppet Strings code comments, this Reference section should include Strings information so that your users know how to access your documentation.

* If you are not using Puppet Strings, include a list of all of your classes, defined types, and so on, along with their parameters. Each element in this listing should include:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

## Limitations

This is where you list OS compatibility, version compatibility, etc. If there
are Known Issues, you might want to include them under their own heading here.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.

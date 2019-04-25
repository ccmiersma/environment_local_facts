#!/bin/bash



# Set default values to configured values if possible, or the constant defaults if not.
export FACTER_DESCRIPTION=${FACTER_DESCRIPTION:-"Default Description"}
export FACTER_ORGANIZATION=${FACTER_ORGANIZATION:-"Default Organization"}
export FACTER_DEPLOYMENT=${FACTER_DEPLOYMENT:-"Default"}
export FACTER_LOCATION=${FACTER_LOCATION:-"Default"}
export FACTER_HOSTGROUP=${FACTER_HOSTGROUP:-"all"}
export FACTER_CONTACT=${FACTER_CONTACT:-"root"}
export FACTER_USER=${USER:-$FACTER_USER}
export FACTER_HOME=${HOME:-$FACTER_HOME}

# If this has been set already, it will carry through. If not, make sure it matches
# the facter variable. Don't touch USER and HOME, as these are bash variables.
export DESCRIPTION=$FACTER_DESCRIPTION
export ORGANIZATION=$FACTER_ORGANIZATION
export DEPLOYMENT=$FACTER_DEPLOYMENT
export LOCATION=$FACTER_LOCATION
export HOSTGROUP=$FACTER_HOSTGROUP
export CONTACT=$FACTER_CONTACT

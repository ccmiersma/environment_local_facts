Name:		environment_local_facts	
Version:	0.1.0
Release:	1%{?dist}
Summary:	Puppet module for system environment and local facts

License:	Apache-2.0
URL:            https://github.com/ccmiersma/environment_local_facts 		
Source0:	%{name}-%{version}.tar.gz

BuildRequires:  puppet make rpm-build findutils	
Requires:	puppet	

%define debug_package %{nil}

%description 
The module sets a unified set of environment variables and local facts
for use by shell scripts, Ansible, facter, etc.

%prep
%setup -q


%build

make %{?_smp_mflags}


%install
%make_install


%files
%defattr(-,root,root)
/opt/local/share/puppet/modules/%{name}

%doc
%license



%changelog
* Sat Apr 27 2019 ccmiersma <ccmiersma@gmail.com> 0.1.0-1
- new package built with tito


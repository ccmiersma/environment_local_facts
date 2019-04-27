all: build

build: 
	puppet module build
	mv pkg build

.PHONY: check
check:  build
	make install DESTDIR=build/test
	puppet module list --modulepath=build/test/opt/local/share/puppet/modules
	puppet apply --test --noop --modulepath=build/test/opt/local/share/puppet/modules examples/init.pp
	
install: build
	install -dv $(DESTDIR)/opt/local/share/puppet/modules/
	puppet module install -f -i $(DESTDIR)/opt/local/share/puppet/modules/ build/*.tar.gz


clean:
	rm -rf build


all: build

build: 
	puppet module build
	mv pkg build

.PHONY: check
check:  build
	make install DESTDIR=build/test

install: build
	install -dv $(DESTDIR)/opt/local/share/puppet/modules/
	puppet module install -f -i $(DESTDIR)/opt/local/share/puppet/modules/ build/*.tar.gz


clean:
	rm -rf build


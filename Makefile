PREFIX = /usr/local

install :: scaffold scaffold.1
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f scaffold ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/scaffold
	mkdir -p ${DESTDIR}${PREFIX}/man/man1
	cp -f scaffold.1 ${DESTDIR}${PREFIX}/man/man1
	chmod 644 ${DESTDIR}${PREFIX}/man/man1/scaffold.1
	mkdir -p ${DESTDIR}${PREFIX}/etc/scaffold
	cp -f etc/* ${DESTDIR}${PREFIX}/etc/scaffold
	chmod 644 ${DESTDIR}${PREFIX}/etc/scaffold/*

remove ::
	rm -f ${DESTDIR}${PREFIX}/bin/scaffold
	rm -f ${DESTDIR}${PREFIX}/man/man1/scaffold.1
	rm -rf ${DESTDIR}${PREFIX}/etc/scaffold

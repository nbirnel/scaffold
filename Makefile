PROG = scaffold
PREFIX = /usr/local

install : $(PROG) $(PROG).1
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f $(PROG) ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/$(PROG)
	mkdir -p ${DESTDIR}${PREFIX}/man/man1
	cp -f $(PROG).1 ${DESTDIR}${PREFIX}/man/man1
	chmod 644 ${DESTDIR}${PREFIX}/man/man1/$(PROG).1
	mkdir -p ${DESTDIR}${PREFIX}/etc/${PROG}
	cp -f etc/* ${DESTDIR}${PREFIX}/etc/${PROG}
	chmod 644 ${DESTDIR}${PREFIX}/etc/${PROG}/*

uninstall ::
	rm -f ${DESTDIR}${PREFIX}/bin/$(PROG)
	rm -f ${DESTDIR}${PREFIX}/man/man1/$(PROG).1
	rm -rf ${DESTDIR}${PREFIX}/etc/${PROG}

clean ::
	rm -r $(PROG).ps

clean-all ::
	rm -r $(PROG).pdf

push :
	git push origin master

pull :
	git pull origin master

readme :: README.md
	git commit -m'update $?' $?

README.md :: ${PROG}.1
	groff -tman -Thtml $? | sed '/<html/,$$!d; /<style/,/<\/style>/d' >$@

.PHONY : install uninstall clean clean-all push pull readme

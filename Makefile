# vim: ts=8 sw=8

PREFIX	=${HOME}/opt
BINDIR	=${PREFIX}/bin

TARGETS	=all check clean distclean clobber install uninstall

.PHONY:	${TARGETS}

all::

${TARGETS}::

all::	lfv lfv.awk

check::	lfv lfv.awk sample.log
	./lfv sample.log

clean::

distclean clobber:: clean

install:: lfv lfv.awk
	install -d ${BINDIR}
	install -c lfv lfv.awk ${BINDIR}/

uninstall::
	cd ${BINDIR} && ${RM} lfv lfv.awk

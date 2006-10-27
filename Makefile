# vim: ts=8 sw=8

PREFIX	=${HOME}/opt
BINDIR	=${PREFIX}/bin

TARGETS	=all check clean distclean clobber install uninstall

.PHONY:	${TARGETS}

all::

${TARGETS}::

all::	lfv

check::	lfv sample.log
	./lfv sample.log

clean::

distclean clobber:: clean

install:: lfv
	install -d ${BINDIR}
	install -c lfv ${BINDIR}/

uninstall::
	${RM} ${BINDIR}/lfv

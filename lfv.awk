#!/bin/awk -f
# vim: ts=8 sw=8
# 10/19/06 17:44:22.802,[18963] <hb163c> "SrvOutputData" - Server started: /usr/tdrs/sw/exec/SrvOutputData, debug level=0, noDaemonFlag=0
BEGIN	{
	if( fields == "" )	{
		fields = "tdpusm"
	}
	Lfields = length( fields )
}
/./	{
	date = $1
	# Field 2 has time, a ',', and then the PID enclosed in []'s
	time = $2
	sub( /,.*$/, "", time )
	pid = $2
	sub( /^[^\[]*\[/, "", pid )
	sub( /\].*$/, "", pid )
	# Field 3 has UID, but enclosed in <>
	uid  = substr( $3, 2, length( $3 ) - 2 )
	# Take stuff between first double quotes as the server name
	srv  = $0
	sub( /^[^"]*"/, "", srv )
	sub( /".*$/,    "", srv )
	# Stuff after first "- " is message text
	msg = $0
	sub( /^[^-]*-[[:space:]]*/, "", msg )
	# Show our work
	for( i = 1; i <= Lfields; ++i )	{
		c = substr( fields, i, 1 )
		if(        c == "d" )	{
			printf "%s ", date
		} else if( c == "t" )	{
			printf "%s ", time
		} else if( c == "p" )	{
			printf "%s ", pid
		} else if( c == "u" )	{
			printf "%s ", uid
		} else if( c == "s" )	{
			printf "%s ", srv
		} else if( c == "m" )	{
			printf "%s ", msg
		} else	{
			printf "[%s] ", c
		}
	}
	printf "\n"
}
END	{
}

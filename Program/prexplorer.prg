procedure prexplorer
	param proguse,oper
*oper=1
	if oper=1
		if !used("conectcare")
			use tmppath+"conectcare"
		else
			select conectcare
		endif
		
		if !file(tmppath+(usrname)+".dbf")
			set safety off
				copy structure to tmppath+(usrname)
			set safety on
		else
			set safety off
				copy file exppath+(usrname)+".*" to tmppath+(usrname)+".*"
			set safety on
		endif

		if !used((usrname))
			use tmppath+(usrname)
		else
			select (usrname)
		endif

		locate for alltrim(prog)==alltrim(proguse)
		if !found()
			append blank
			replace prog with proguse
		endif
		use

		set safety off
			copy file tmppath+(usrname)+".*" to exppath+(usrname)+".*"
		set safety on
	else
		set safety off
			copy file exppath+(usrname)+".*" to tmppath+(usrname)+".*"
		set safety on

		use tmppath+(usrname)
		delete for alltrim(prog)==alltrim(proguse)
		pack
		use
		
		if alltrim(proguse)=="Programma principala"
			delete file tmppath+(usrname)+".*"
			delete file exppath+(usrname)+".*"
		else
			set safety off
				copy file tmppath+(usrname)+".*" to exppath+(usrname)+".*"
			set safety on
		endif
	endif
endpro
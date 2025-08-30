procedure prddbftosrv
	param atables

	srvstat="yes"
	on error do gresala
		copy file srvpath+"edituri.dbf" to tmppath+"edituri.dbf"
		delete file tmppath+"edituri.dbf"
	on error

	if srvstat=="yes"
		do form frmpath+"fupdate.scx" with atables,2
	endif
endpro
*****************************************************
procedure gresala
	messagebox("Server cu baza de data ocupat la moment!",48,"Server -> Baza")
	srvstat="no"
	on error
endpro

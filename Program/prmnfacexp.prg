procedure prmnfacexp
	close tables

	dime atables(6)
	lenatables=alen(atables,1)
	atables[1]= "facexp"
	atables[2]= "faclist"
	atables[3]= "deplm"
	atables[4]= "firma"
	atables[5]= "furn"
	atables[6]= "drepturi"

	do prgpath+"prdsrvtodbf" with atables
	do prgpath+"prexplorer" with "Factura de expeditie",1
	*******************************

	if srvstat=="yes"
		select bf from drepturi into array ausrdrp where util==usrname 
		if ausrdrp
			do form frmpath+"ffacexp.scx"

			*******************************
			if usrstat="admin"
				close tables

				dime atbl(2)
				lenatbl=alen(atbl,1)
				atbl[1]= "facexp"
				atbl[2]= "faclist"
				do prgpath+"prddbftosrv" with atbl
			endif
		else
			messagebox("Voi nu aveti drept !!!",16,"Drepturi")
		endif
	endif
	do prgpath+"prexplorer" with "Factura de expeditie",2
endpro
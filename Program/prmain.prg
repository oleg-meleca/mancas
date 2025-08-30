procedure prmain
	public wrkpath,dbfpath,frmpath,rptpath,prgpath,tmppath,pstpath,usrstat,usrname,srvstat
	CLEAR

	set date dmy
	set century to 20
	SET POINT TO '.'
	
	set default to D:\ManCas\Data\
	set path to D:\ManCas\

	open database dcasa

	select drumcompl from drumuri into array adrum
	
	wrkpath=alltrim(adrum[1,1])
	dbfpath=wrkpath + alltrim(adrum[2,1])
	frmpath=wrkpath + alltrim(adrum[3,1])
	rptpath=wrkpath + alltrim(adrum[4,1])
	prgpath=wrkpath + alltrim(adrum[5,1])
	tmppath=wrkpath + alltrim(adrum[6,1])
	pstpath=wrkpath + alltrim(adrum[7,1])
	
	usrstat=alltrim(adrum[8,1])
	usrname=alltrim(adrum[9,1])
		
	IBANcod=alltrim(adrum[10,1])
	libcod =alltrim(adrum[11,1])
	fiscod =alltrim(adrum[12,1])
	namecom=alltrim(adrum[13,1])
	adrscom=alltrim(adrum[14,1])
	namelib=alltrim(adrum[15,1])
	combank=alltrim(adrum[16,1])
	citycom=alltrim(adrum[17,1])
	tvacom =alltrim(adrum[18,1])
	
	srvstat="yes"

	do form frmpath+"formmain.scx"
	formmain.caption="ManCas"+" - "+usrname

	read events
	cancel
endpro

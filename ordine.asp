<!--#include file="inc_strConn.asp"-->
<!--#include file="cStripeFunctions.asp"-->
<%
	Call Visualizzazione("",0,"ordine.asp")

	mode=request("mode")
	if mode="" then mode=0

	IdOrdine=session("ordine_shop")

	if IdOrdine="" then IdOrdine=0
	if idOrdine=0 then response.redirect("/carrello1.asp")

	'if idsession=1 then response.redirect("/ordine-test.asp")

	if idsession=0 then response.redirect("/iscrizione.asp?prov=1")

	'******* DA COMMENTARE QUANDO SI METTE IN TEST
	session("ordine_shop")=""
	'******* DA COMMENTARE QUANDO SI METTE IN TEST

	Set stripeFunc = New cStripeFunctions
	guid=stripeFunc.createWindowsGUID()

	Set ss = Server.CreateObject("ADODB.Recordset")
	sql = "SELECT * FROM Ordini WHERE Dominio LIKE '"&dominio&"' AND pkid="&idOrdine
	ss.Open sql, conn, 3, 3

	if ss.recordcount>0 then
		TotaleCarrello=ss("TotaleCarrello")
		Sconto=ss("Sconto")
		CostoSpedizioneTotale=ss("CostoSpedizione")
		TipoTrasporto=ss("TipoTrasporto")
		FkSpedizione=ss("FkSpedizione")
		Nominativo_sp=ss("Nominativo_sp")
		Telefono_sp=ss("Telefono_sp")
		Indirizzo_sp=ss("Indirizzo_sp")
		CAP_sp=ss("CAP_sp")
		Citta_sp=ss("Citta_sp")
		Provincia_sp=ss("Provincia_sp")
		Nazione_sp=ss("Nazione_sp")
		NoteCliente=ss("NoteCliente")

		FkPagamento=ss("FkPagamento")
		TipoPagamento=ss("TipoPagamento")
		CostoPagamento=ss("CostoPagamento")

		Nominativo=ss("Nominativo")
		Rag_Soc=ss("Rag_Soc")
		Cod_Fisc=ss("Cod_Fisc")
		PartitaIVA=ss("PartitaIVA")
		Indirizzo=ss("Indirizzo")
		Citta=ss("Citta")
		Provincia=ss("Provincia")
		CAP=ss("CAP")
		Codice_SDI=ss("Codice_SDI")
		Email_PEC=ss("Email_PEC")

		TotaleGenerale=ss("TotaleGenerale")

		DataAggiornamento=ss("DataAggiornamento")

		ss("stato")=6
		ss("DataAggiornamento")=now()
		ss("IpOrdine")=Request.ServerVariables("REMOTE_ADDR")
		ss.update
	end if

	ss.close

	if FkPagamento>0 then
		Set trasp_rs = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM CostiPagamento where PkId="&FkPagamento
		trasp_rs.Open sql, conn, 1, 1
		if trasp_rs.recordcount>0 then
			TipoCosto=trasp_rs("TipoCosto")
		end if
		trasp_rs.close
	end if

	if FkPagamento=1 or FkPagamento=5 then
		Set rs=Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * From Clienti WHERE Dominio LIKE '"&dominio&"' AND pkid="&idsession
		rs.Open sql, conn, 1, 1

		nominativo_email=rs("nome")&" "&rs("nominativo")
		email=rs("email")

		rs.close

			HTML1 = ""
			HTML1 = HTML1 & "<html>"
			HTML1 = HTML1 & "<head>"
			HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
			HTML1 = HTML1 & "<title>Cristalensi</title>"
			HTML1 = HTML1 & "</head>"
			HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
			HTML1 = HTML1 & "<table width='553' border='0' cellspacing='0' cellpadding='0'>"
			HTML1 = HTML1 & "<tr>"
			HTML1 = HTML1 & "<td>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Thank you "&nominativo_email&" for having chosen our products!<br>This e-mail confirms the completion of order n. "&idordine&"/COM.<br><br><b>TOTAL ORDER: <u>"&TotaleGenerale&"&#8364;</u></b><br><br> To complete the order you must make a bank transfer with the following details:<br><u>BANCA DI CREDITO COOPERATIVO DI CAMBIANO AG. MONTELUPO FIORENTINO</u><br>IBAN: <u>IT33E0842537960000030277941</u><br>Code BIC/SWIFT: <u>CRACIT33</u><br>As the cause of payment please indicate: Order from web site n. "&idordine&"<br><br>Beneficiary: Cristalensi Snc di Lensi Massimiliano & C. (P.Iva e C.Fiscale 05305820481)<br>Via arti e mestieri, 1 - 50056 Montelupo F.no (FI)<br><br><br>Our staff will send the merchandise as soon as the bank is notified of the bank transfer or, to speed-up the consignment, send an e-mail with the bank transfer reciept (in the case of home banking a bank transfer receipt is often provided by the bank, or you could scan the receipt left by the bank).</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000><br><br>Best wishes from the staff of Cristalensi</font>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = email
			Oggetto = "Confirmation dispatch order n "&idordine&"/COM to Cristalensi.com with payment by bank transfer"
			Testo = HTML1

			Set eMail_cdo = CreateObject("CDO.Message")

			' Imposta le configurazioni
			Set myConfig = Server.createObject("CDO.Configuration")
			With myConfig
				'autentication
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
				' Porta CDO
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				' Timeout
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
				' Server SMTP di uscita
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = msg_smtpserver
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = msg_sendusername
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = msg_sendpassword

				.Fields.update
			End With
			Set eMail_cdo.Configuration = myConfig

			eMail_cdo.From = Mittente
			eMail_cdo.To = Destinatario
			eMail_cdo.Subject = Oggetto

			eMail_cdo.HTMLBody = Testo

			eMail_cdo.Send()

			Set myConfig = Nothing
			Set eMail_cdo = Nothing

			'fine invio email

			'invio l'email all'amministratore
			HTML1 = ""
			HTML1 = HTML1 & "<html>"
			HTML1 = HTML1 & "<head>"
			HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
			HTML1 = HTML1 & "<title>Cristalensi</title>"
			HTML1 = HTML1 & "</head>"
			HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
			HTML1 = HTML1 & "<table width='553' border='0' cellspacing='0' cellpadding='0'>"
			HTML1 = HTML1 & "<tr>"
			HTML1 = HTML1 & "<td>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Nuovo ordine con pagamento con bonifico dal sito internet.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti del nuovo ordine:<br>Nominativo: <b>"&nominativo_email&"</b><br>Email: <b>"&email&"</b><br>Codice cliente: <b>"&idsession&"</b><br>Codice ordine: <b>"&idordine&"/COM</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = "info@cristalensi.it"
			Oggetto = "Conferma invio ordine n "&idordine&"/COM a Cristalensi.com (inglese) con pagamento con bonifico bancario"
			Testo = HTML1

			Set eMail_cdo = CreateObject("CDO.Message")

			' Imposta le configurazioni
			Set myConfig = Server.createObject("CDO.Configuration")
			With myConfig
				'autentication
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
				' Porta CDO
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				' Timeout
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
				' Server SMTP di uscita
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = msg_smtpserver
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = msg_sendusername
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = msg_sendpassword

				.Fields.update
			End With
			Set eMail_cdo.Configuration = myConfig

			eMail_cdo.From = Mittente
			eMail_cdo.To = Destinatario
			eMail_cdo.Subject = Oggetto

			eMail_cdo.HTMLBody = Testo

			eMail_cdo.Send()

			Set myConfig = Nothing
			Set eMail_cdo = Nothing

			'invio al webmaster

			Mittente = "info@cristalensi.it"
			Destinatario = "viadeimedici@gmail.com"
			Oggetto = "Conferma invio ordine n "&idordine&"/COM a Cristalensi.com (inglese) con pagamento con bonifico bancario"
			Testo = HTML1

			Set eMail_cdo = CreateObject("CDO.Message")

			' Imposta le configurazioni
			Set myConfig = Server.createObject("CDO.Configuration")
			With myConfig
				'autentication
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
				' Porta CDO
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				' Timeout
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
				' Server SMTP di uscita
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = msg_smtpserver
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = msg_sendusername
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = msg_sendpassword

				.Fields.update
			End With
			Set eMail_cdo.Configuration = myConfig

			eMail_cdo.From = Mittente
			eMail_cdo.To = Destinatario
			eMail_cdo.Subject = Oggetto

			eMail_cdo.HTMLBody = Testo

			eMail_cdo.Send()

			Set myConfig = Nothing
			Set eMail_cdo = Nothing

			'fine invio email
	end if

	if FkPagamento=3 then
		Set rs=Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * From Clienti WHERE Dominio LIKE '"&dominio&"' AND pkid="&idsession
		rs.Open sql, conn, 1, 1

		nominativo_email=rs("nome")&" "&rs("nominativo")
		email=rs("email")

		rs.close

			HTML1 = ""
			HTML1 = HTML1 & "<html>"
			HTML1 = HTML1 & "<head>"
			HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
			HTML1 = HTML1 & "<title>Cristalensi</title>"
			HTML1 = HTML1 & "</head>"
			HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
			HTML1 = HTML1 & "<table width='553' border='0' cellspacing='0' cellpadding='0'>"
			HTML1 = HTML1 & "<tr>"
			HTML1 = HTML1 & "<td>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Thank you "&nominativo_email&" for having chosen our products!<br>This e-mail is confirmation of the completion of order n. "&idordine&"/COM.<br><br><br>.  It will be the care of our staff to send you the merchandise as soon as it is available in our stock room.<br>We remind you that in the case of payment on receipt of goods, the courier will consign the merchandise only if paid in cash, other types of payment will not be accepted (even checks will not be accepted).</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000><br><br>Best wishes from the staff of Cristalensi</font>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = email
			Oggetto = "Confirmation dispatch order n "&idordine&"/COM a Cristalensi.com with payment on receipt of goods"
			Testo = HTML1

			Set eMail_cdo = CreateObject("CDO.Message")

			' Imposta le configurazioni
			Set myConfig = Server.createObject("CDO.Configuration")
			With myConfig
				'autentication
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
				' Porta CDO
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				' Timeout
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
				' Server SMTP di uscita
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = msg_smtpserver
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = msg_sendusername
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = msg_sendpassword

				.Fields.update
			End With
			Set eMail_cdo.Configuration = myConfig

			eMail_cdo.From = Mittente
			eMail_cdo.To = Destinatario
			eMail_cdo.Subject = Oggetto

			eMail_cdo.HTMLBody = Testo

			eMail_cdo.Send()

			Set myConfig = Nothing
			Set eMail_cdo = Nothing

			'fine invio email

			'invio l'email all'amministratore
			HTML1 = ""
			HTML1 = HTML1 & "<html>"
			HTML1 = HTML1 & "<head>"
			HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
			HTML1 = HTML1 & "<title>Cristalensi</title>"
			HTML1 = HTML1 & "</head>"
			HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
			HTML1 = HTML1 & "<table width='553' border='0' cellspacing='0' cellpadding='0'>"
			HTML1 = HTML1 & "<tr>"
			HTML1 = HTML1 & "<td>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Nuovo ordine con pagamento in contrassegno dal sito internet.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti del nuovo ordine:<br>Nominativo: <b>"&nominativo_email&"</b><br>Email: <b>"&email&"</b><br>Codice cliente: <b>"&idsession&"</b><br>Codice ordine: <b>"&idordine&"/COM</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = "info@cristalensi.it"
			Oggetto = "Conferma invio ordine n "&idordine&"/COM (inglese) a Cristalensi.com con pagamento in contrassegno"
			Testo = HTML1

			Set eMail_cdo = CreateObject("CDO.Message")

			' Imposta le configurazioni
			Set myConfig = Server.createObject("CDO.Configuration")
			With myConfig
				'autentication
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
				' Porta CDO
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				' Timeout
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
				' Server SMTP di uscita
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = msg_smtpserver
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = msg_sendusername
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = msg_sendpassword

				.Fields.update
			End With
			Set eMail_cdo.Configuration = myConfig

			eMail_cdo.From = Mittente
			eMail_cdo.To = Destinatario
			eMail_cdo.Subject = Oggetto

			eMail_cdo.HTMLBody = Testo

			eMail_cdo.Send()

			Set myConfig = Nothing
			Set eMail_cdo = Nothing

			'invio al webmaster

			Mittente = "info@cristalensi.it"
			Destinatario = "viadeimedici@gmail.com"

			Oggetto = "Conferma invio ordine n "&idordine&"/COM (inglese) a Cristalensi.com con pagamento in contrassegno"
			Testo = HTML1

			Set eMail_cdo = CreateObject("CDO.Message")

			' Imposta le configurazioni
			Set myConfig = Server.createObject("CDO.Configuration")
			With myConfig
				'autentication
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
				' Porta CDO
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				' Timeout
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
				' Server SMTP di uscita
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = msg_smtpserver
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = msg_sendusername
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = msg_sendpassword

				.Fields.update
			End With
			Set eMail_cdo.Configuration = myConfig

			eMail_cdo.From = Mittente
			eMail_cdo.To = Destinatario
			eMail_cdo.Subject = Oggetto

			eMail_cdo.HTMLBody = Testo

			eMail_cdo.Send()

			Set myConfig = Nothing
			Set eMail_cdo = Nothing

			'fine invio email
	end if

	if FkPagamento=4 then
		Set rs=Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * From Clienti WHERE Dominio LIKE '"&dominio&"' AND pkid="&idsession
		rs.Open sql, conn, 1, 1

		nominativo_email=rs("nome")&" "&rs("nominativo")
		email=rs("email")

		rs.close

			HTML1 = ""
			HTML1 = HTML1 & "<html>"
			HTML1 = HTML1 & "<head>"
			HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
			HTML1 = HTML1 & "<title>Cristalensi</title>"
			HTML1 = HTML1 & "</head>"
			HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
			HTML1 = HTML1 & "<table width='553' border='0' cellspacing='0' cellpadding='0'>"
			HTML1 = HTML1 & "<tr>"
			HTML1 = HTML1 & "<td>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Thank you "&nominativo_email&" for having chosen our products!<br>This e-mail confirms the completion of order n. "&idordine&"/COM.<br><br><b>TOTAL ORDER: <u>"&TotaleGenerale&"&#8364;</u></b><br><br> To complete the order you must make a card PostePay transfer with the following details:<br><u><strong>Beneficiary: LENSI GIULIANO - c.f. LNS GLN 42A30 D403J<br>Card Number: 5333 1710 7681 8950</strong><br><br>As the cause of payment please indicate: Order from Cristalensi web site n. "&idordine&"<br><br>Our staff will send the merchandise as soon as the bank is notified of the bank transfer or, to speed-up the consignment, send an e-mail with the bank transfer reciept.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000><br><br>Best wishes from the staff of Cristalensi</font>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = email
			Oggetto = "Confirmation dispatch order n "&idordine&"/COM to Cristalensi.com with payment by PostePay card"
			Testo = HTML1

			Set eMail_cdo = CreateObject("CDO.Message")

			' Imposta le configurazioni
			Set myConfig = Server.createObject("CDO.Configuration")
			With myConfig
				'autentication
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
				' Porta CDO
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				' Timeout
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
				' Server SMTP di uscita
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = msg_smtpserver
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = msg_sendusername
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = msg_sendpassword

				.Fields.update
			End With
			Set eMail_cdo.Configuration = myConfig

			eMail_cdo.From = Mittente
			eMail_cdo.To = Destinatario
			eMail_cdo.Subject = Oggetto

			eMail_cdo.HTMLBody = Testo

			eMail_cdo.Send()

			Set myConfig = Nothing
			Set eMail_cdo = Nothing

			'fine invio email

			'invio l'email all'amministratore
			HTML1 = ""
			HTML1 = HTML1 & "<html>"
			HTML1 = HTML1 & "<head>"
			HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
			HTML1 = HTML1 & "<title>Cristalensi</title>"
			HTML1 = HTML1 & "</head>"
			HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
			HTML1 = HTML1 & "<table width='553' border='0' cellspacing='0' cellpadding='0'>"
			HTML1 = HTML1 & "<tr>"
			HTML1 = HTML1 & "<td>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Nuovo ordine con pagamento con POSTEPAY dal sito internet.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti del nuovo ordine:<br>Nominativo: <b>"&nominativo_email&"</b><br>Email: <b>"&email&"</b><br>Codice cliente: <b>"&idsession&"</b><br>Codice ordine: <b>"&idordine&"/COM</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = "info@cristalensi.it"
			Oggetto = "Conferma invio ordine n "&idordine&"/COM (inglese) a Cristalensi.com con pagamento con POSTEPAY"
			Testo = HTML1

			Set eMail_cdo = CreateObject("CDO.Message")

			' Imposta le configurazioni
			Set myConfig = Server.createObject("CDO.Configuration")
			With myConfig
				'autentication
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
				' Porta CDO
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				' Timeout
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
				' Server SMTP di uscita
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = msg_smtpserver
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = msg_sendusername
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = msg_sendpassword

				.Fields.update
			End With
			Set eMail_cdo.Configuration = myConfig

			eMail_cdo.From = Mittente
			eMail_cdo.To = Destinatario
			eMail_cdo.Subject = Oggetto

			eMail_cdo.HTMLBody = Testo

			eMail_cdo.Send()

			Set myConfig = Nothing
			Set eMail_cdo = Nothing

			'invio al webmaster

			Mittente = "info@cristalensi.it"
			Destinatario = "viadeimedici@gmail.com"
			Oggetto = "Conferma invio ordine n "&idordine&"/COM (inglese) a Cristalensi.com con pagamento con POSTEPAY"
			Testo = HTML1

			Set eMail_cdo = CreateObject("CDO.Message")

			' Imposta le configurazioni
			Set myConfig = Server.createObject("CDO.Configuration")
			With myConfig
				'autentication
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
				' Porta CDO
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				' Timeout
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
				' Server SMTP di uscita
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = msg_smtpserver
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = msg_sendusername
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = msg_sendpassword

				.Fields.update
			End With
			Set eMail_cdo.Configuration = myConfig

			eMail_cdo.From = Mittente
			eMail_cdo.To = Destinatario
			eMail_cdo.Subject = Oggetto

			eMail_cdo.HTMLBody = Testo

			eMail_cdo.Send()

			Set myConfig = Nothing
			Set eMail_cdo = Nothing

			'fine invio email
	end if
%>
<%'**********************PAYPAL**********************%>
<%
if FkPagamento = 2 then

	TotalePaypal=TotaleGenerale
	Payment_Amount=Replace(TotalePaypal, ",", ".")
	currencyCodeType = "EUR"
	paymentType = "Sale"
	returnURL = "https://www.cristalensi.it/pagamento_paypal_ok.asp"
	cancelURL = "https://www.cristalensi.it/pagamento_paypal_ko.asp"
	if FkSpedizione=2 then
		shipToName = nominativo_email
		shipToStreet = "Via arti e mestieri, 1"
		shipToStreet2 = "" 'Leave it blank if there is no value
		shipToCity = "Montelupo Fiorentino"
		shipToState = "FI"
		'shipToCountryCode = "<<ShipToCountryCode>>" ' Please refer to the PayPal country codes in the API documentation
		shipToCountryCode = "IT"
		shipToZip = "50056"
		phoneNum = "0571.911163"
		INVNUM = IdOrdine 'valore aggiunto alla funzione
	else
		shipToName = Nominativo_sp
		shipToStreet = Indirizzo_sp
		shipToStreet2 = "" 'Leave it blank if there is no value
		shipToCity = Citta_sp
		shipToState = Provincia_sp
		'shipToCountryCode = "<<ShipToCountryCode>>" ' Please refer to the PayPal country codes in the API documentation
		shipToCountryCode = Nazione_sp
		shipToZip = CAP_sp
		phoneNum = Telefono_sp
		INVNUM = IdOrdine 'valore aggiunto alla funzione
	end if

End If
%>
<%'**********************PAYPAL**********************%>
<!DOCTYPE html>
<html>

<head>
    <title>Cristalensi</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Cristalensi.">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Cristalensi.">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
    <link rel="icon" type="image/png" href="/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="/android-chrome-192x192.png" sizes="192x192">
    <link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16">
    <link rel="manifest" href="/manifest.json">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#2790cf">
    <meta name="msapplication-TileColor" content="#2790cf">
    <meta name="msapplication-TileImage" content="/mstile-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link href="stylesheets/styles.css" media="screen" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]><script src="javascripts/html5shiv.js"></script><![endif]-->
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,400i,500,600,700" rel="stylesheet">
    <style type="text/css">
        .clearfix:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
    </style>
		<script language="JavaScript" type="text/JavaScript">
		<!--
		function MM_openBrWindow(theURL,winName,features) { //v2.0
			window.open(theURL,winName,features);
		}
		//-->
		</script>
		<!--#include virtual="/inc_funzioni_head.asp"-->
</head>

<body>
  <!--#include file="inc_header_1.asp"-->
  <!--#include file="inc_header_2.asp"-->
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-sm-12 hidden-xs">
            <div class="row bs-wizard">

                <div class="col-sm-5 bs-wizard-step complete">
                    <div class="text-center bs-wizard-stepnum">1</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="/carrello1.asp" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Cart</div>
                </div>
                <div class="col-sm-5 bs-wizard-step complete">
                    <div class="text-center bs-wizard-stepnum">2</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="/iscrizione.asp" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Autentication / Registration</div>
                </div>
                <div class="col-sm-5 bs-wizard-step complete">
                    <div class="text-center bs-wizard-stepnum">3</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="/carrello2.asp" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Shipping address</div>
                </div>
								<div class="col-sm-5 bs-wizard-step complete">
										<div class="text-center bs-wizard-stepnum">4</div>
										<div class="progress">
												<div class="progress-bar"></div>
										</div>
										<a href="/carrello3.asp" class="bs-wizard-dot"></a>
										<div class="bs-wizard-info text-center">Payment &amp; Invoicing</div>
								</div>
								<div class="col-sm-5 bs-wizard-step active">
										<div class="text-center bs-wizard-stepnum">5</div>
										<div class="progress">
												<div class="progress-bar"></div>
										</div>
										<a href="#" class="bs-wizard-dot"></a>
										<div class="bs-wizard-info text-center">Order confirmation</div>
								</div>
            </div>
        </div>
        <div class="col-md-12">
						<div class="title">
								<h4>Order n. <%=idordine%> - Date <%=Left(DataAggiornamento, 10)%></h4>
						</div>
						<div class="col-md-12 hidden-print">
						<%if FkPagamento=1 or FkPagamento=5 then%>
								<p class="description">
									Thank you for having chosen our products,<br>
                                    to complete the order you must make out a bank transfer to the following address:<br>
										<br>
										<strong>BANCA DI CREDITO COOPERATIVO DI CAMBIANO AG. MONTELUPO FIORENTINO<br>IBAN: IT33E0842537960000030277941<br>
										Codice BIC/SWIFT: CRACIT33</strong>
										<br><br>As the cause of payment please indicate: "<strong>Order from web site n&deg; <%=idordine%></strong>"<br><br>
                                    Beneficiary: <strong>Cristalensi Snc di Lensi Massimiliano & C. (P.Iva e C.Fiscale 05305820481)<br>
                             Via arti e mestieri, 1 - 50056 Montelupo F.no (Florence) Italy</strong>
										<br><br>
										The merchandise will be sent when our bank recieves payment, or to speed-up the consignment, you can send by e-mail the receipt of payment by bank transfer (in the case of home banking a receipt is usually provided by the bank, or you can scan the receipt left by the bank).<br>
										<br>
										By paying, and thereby completing the order, you have accepted the conditions of sale.<br>Save or print the conditions of sale (consultable on the appropriate page of the internet site) from this file (.pdf):<br>
                                  <a href="condizioni_di_vendita.pdf" target="_blank">sales conditions</a>
										<br><br>
										<strong>WE WILL SENT ALSO BY EMAIL ALL DATA FOR PAYMENT</strong>
										<br>
										<br>
										Best regards from the staff of Cristalensi
										<br>
										<br>
								</p>
						<%end if%>
						<%if FkPagamento=4 then%>
								<p class="description">
										<br><br>Thank you for having chosen our products,<br>
                                    to complete the order you must make out a POSTEPAY card transfer to the following address:<br>
											<br><br>
											<strong>Beneficiary: LENSI GIULIANO - c.f. LNS GLN 42A30 D403J<br>
											Carn number: 5333 1710 7681 8950</strong>
											<br><br>Nella causale indicare: "<strong>Ordine da sito internet n&deg; <%=idordine%></strong>"<br><br>
											As the cause of payment please indicate: "<strong>Order from web site n&deg; <%=idordine%></strong>"<br><br>
                                    The merchandise will be sent when our bank recieves payment, or to speed-up the consignment, you can send by e-mail the receipt of payment by bank transfer.
                                  <br><br>
                                   By paying, and thereby completing the order, you have accepted the conditions of sale.  Save or stamp the conditions of sale (consultable on the appropriate page of the internet site) from this file (.pdf):<br><a href="condizioni_di_vendita.pdf" target="_blank">conditions of sale</a>
										<br /><br />
										<strong>WE WILL SENT ALSO BY EMAIL ALL DATA FOR PAYMENT</strong>
										<br>
										<br>
										Best regards from the staff of Cristalensi
										<br>
										<br>
								</p>
						<%end if%>
						<%if FkPagamento=3 then%>
								<p class="description">
									<br><br>Thank you for having chosen our products,<br>
                    the merchandise will be sent to you as soon as we have it available in our warehouse.<br>
                    We remind you that for payment on delivery, the courier will give you the merchandise only if paid in cash, no other method of payment (not even checks) will be accepted in this case<br>
                    <br>
                  By paying, and thereby completing the order, you have accepted the conditions of sale.  Save or stamp the conditions of sale (consultable on the appropriate page of the internet site) from this file (.pdf) using Adobe Acrobat Reader:<br>
                  <a href="condizioni_di_vendita.pdf" target="_blank">sales conditions</a>
                  <br>
                  <br>
                  Best regards from the staff of Cristalensi
                  <br>
                  <br>
								</p>
						<%end if%>
						<%if FkPagamento=2 then%>

						<%end if%>
						<%if FkPagamento=6 then%>
							<div class="col-md-12">
							<p class="description">
								Thank you for having chosen our products,<br>
							    To complete the order it is necessary to pay with the secure system Stripe which can be used with many types of credit card and prepaid cards:

								<br><br>
							</p>
							<div class="col-md-8">
								<form action="stripe.asp" method="post" id="payment-form" class="form-horizontal">
									<input type="hidden" name="orderId" id="orderId" value="<%=IdOrdine%>" />
									<input type="hidden" name="paymentId" id="paymentId" value="<%=guid%>" />
									<%
									TotaleGenerale_STR=Replace(FormatNumber(TotaleGenerale,2), ",", "")
									TotaleGenerale_STR=Replace(TotaleGenerale_STR, ".", "")
									%>
									<input type="hidden" name="totale_da_pagare" id="totale_da_pagare" value="<%=TotaleGenerale_STR%>" />

	                    <div class="title">
	                        <h4>Credit Card</h4>
	                    </div>
	                    <div class="col-md-12" style="padding-top: 20px;">
													<div class="form-group clearfix">
															<label for="nominativo" class="col-sm-6 control-label">Card Number</label>
															<div class="col-sm-6">
																	<input type="text" class="form-control" name="card-number" id="card-number" value="">
															</div>
													</div>
													<div class="form-group clearfix">
															<label for="cod_fisc" class="col-sm-6 control-label">CVC</label>
															<div class="col-sm-6">
																	<input type="text" class="form-control" name="card-cvc" id="card-cvc" value="" size="5" maxlength="3" style="width: 50px; text-align: left;">
															</div>
													</div>
													<div class="form-group clearfix">
															<label for="cod_fisc" class="col-sm-6 control-label">Expiration date (MM/YY)</label>
															<div class="col-sm-6">
																	<input type="text" class="form-control" name="card-month" id="card-month" value="" maxlength="2" style="width: 50px; text-align: left; display: inline;">&nbsp&nbsp/&nbsp&nbsp<input type="text" class="form-control" name="card-year" id="card-year" value="" maxlength="2" style="width: 50px; text-align: left; display: inline;">
															</div>
													</div>
													<div class="form-group clearfix">
															<div class="col-sm-12">
																	<input type="submit" name="METHOD" value=" &raquo; PAY now with Credit Card! " class="btn btn-danger pull-right">
															</div>
													</div>
											</div>
										</form>
								</div>
							</div>
								<br><br>
						<%end if%>


						</div>
            <div class="col-md-12">
                <div class="top-buffer">
                    <table id="cart" class="table table-hover table-condensed table-cart">
                        <thead>
													<tr>
															<th style="width:60%">Product</th>
															<th style="width:10%" class="text-center">Quantity</th>
															<th style="width:15%" class="text-right">Price</th>
															<th style="width:15%" class="text-right hidden-xs">Total Pr.</th>
													</tr>
                        </thead>
												<%
													Set rs = Server.CreateObject("ADODB.Recordset")
													sql = "SELECT * FROM RigheOrdine WHERE Dominio LIKE '"&dominio&"' AND FkOrdine="&idOrdine&""
													rs.Open sql, conn, 1, 1
													num_prodotti_carrello=rs.recordcount

												%>
                        <%if rs.recordcount>0 then%>
												<tbody>
														<%
														Do while not rs.EOF

														Set url_prodotto_rs = Server.CreateObject("ADODB.Recordset")
														sql = "SELECT PkId, NomePagina, FkProduttore FROM Prodotti WHERE PkId="&rs("FkProdotto")&""
														url_prodotto_rs.Open sql, conn, 1, 1

														NomePagina=url_prodotto_rs("NomePagina")
														if Len(NomePagina)>0 then
															NomePagina="/public/pagine/"&NomePagina
														else
															NomePagina="#"
														end if
														FkProduttore=url_prodotto_rs("FkProduttore")

														url_prodotto_rs.close
														%>
														<%
														quantita=rs("quantita")
														if quantita="" then quantita=1
														%>
														<tr>
                                <td data-th="Product" class="cart-product">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5 class="nomargin"><%=rs("titolo")%></h5>
																						<p>
																							<strong>Code: <%=rs("codicearticolo")%></strong>
																							<%if Len(rs("colore"))>0 or Len(rs("lampadina"))>0 then%><br /><%if Len(rs("colore"))>0 then%>Col.: <%=rs("colore")%><%end if%><%if Len(rs("lampadina"))>0 then%> - Light: <%=rs("lampadina")%><%end if%><%end if%>
																							<%if FkProduttore=59 then%><br /><span style="color:#a01010;"><strong><em>Extra discounts not applicable</em></strong></span><%end if%>
																						</p>
                                        </div>
                                    </div>
                                </td>
																<td data-th="Quantity" class="text-center"><%=quantita%></td>
                                <td data-th="Price" class="text-right"><%=FormatNumber(rs("PrezzoProdotto"),2)%>&nbsp&euro;</td>
                                <td data-th="Subtotal" class="text-right hidden-xs"><%=FormatNumber(rs("TotaleRiga"),2)%>&nbsp&euro;</td>
                            </tr>
														<%
														rs.movenext
														loop
														%>
                        </tbody>
												<%end if%>
												<%rs.close%>
												<tfoot>
														<tr>
																<td class="hidden-xs"></td>
																<td class="text-right" colspan="2">Total Cart</td>
																<td class="text-right"><%if TotaleCarrello<>0 then%>
																<%=FormatNumber(TotaleCarrello,2)%><%else%>0<%end if%>&nbsp&euro;</td>
														</tr>
														<tr>
																<td class="hidden-xs"></td>
																<td class="text-right" colspan="2"><strong>Extra Discount</strong></td>
																<td class="text-right"><strong><%if Sconto<>0 then%>
																-<%=FormatNumber(Sconto,2)%><%else%>0,00<%end if%>&nbsp&euro;</strong></td>
														</tr>
	                          <tr>
	                              <td colspan="4">
	                                  <h5>Any notes</h5>
	                                  <textarea class="form-control" rows="3" readonly style="font-size: 12px;"><%=NoteCliente%></textarea>
	                              </td>
	                          </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="row top-buffer">
                <div class="col-md-6">
                    <div class="title">
                        <h4>Shipping</h4>
                    </div>
                    <div class="col-md-12 top-buffer">
                        <table id="cart" class="table table-hover table-condensed table-cart">
                            <thead>
                                <tr>
                                    <th style="width:75%">Shipping method</th>
                                    <th style="width:25%" class="text-center">Shipping cost:</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <p><%=TipoTrasporto%></p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Quantity" class="text-center">
                                        <%=FormatNumber(CostoSpedizioneTotale,2)%>&nbsp&euro;
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="title">
                        <h4>Shipping address</h4>
                    </div>
                    <div class="col-md-12 top-buffer">
                        <p><%=Nominativo_sp%>&nbsp;-&nbsp;Telefono:&nbsp;<%=Telefono_sp%><br /><%=Indirizzo_sp%>&nbsp;-&nbsp;<%=CAP_sp%>&nbsp;-&nbsp;<%=Citta_sp%><%if Provincia_sp<>"" then%>&nbsp;(<%=Provincia_sp%>)<%end if%>&nbsp;-&nbsp;<%=Nazione_sp%></p>
                    </div>
                </div>
            </div>
						<div class="clearfix"></div>
            <div class="row top-buffer">
                <div class="col-md-6">
                    <div class="title">
                        <h4>Payment</h4>
                    </div>
                    <div class="col-md-12 top-buffer">
                        <table id="cart" class="table table-hover table-condensed table-cart">
                            <thead>
                                <tr>
                                    <th style="width:75%">Payment method</th>
                                    <th style="width:25%" class="text-center">Payment cost</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <p><%=TipoPagamento%></p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Quantity" class="text-center">
                                        <%if TipoCosto=4 or TipoCosto=5 then%>-<%end if%><%=FormatNumber(CostoPagamento,2)%>&nbsp&#8364;
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="title">
                        <h4>Billing details:</h4>
                    </div>
                    <div class="col-md-12 top-buffer">
                        <p>
													<%if Rag_Soc<>"" then%><%=Rag_Soc%>&nbsp;&nbsp;<%end if%><%if nominativo<>"" then%><%=nominativo%><%end if%><br />
													<%if Cod_Fisc<>"" then%>Codice fiscale: <%=Cod_Fisc%>&nbsp;&nbsp;<%end if%><%if PartitaIVA<>"" then%>Partita IVA: <%=PartitaIVA%><%end if%><br />
													<%if Codice_SDI<>"" then%>Codice SDI: <%=Codice_SDI%>&nbsp;&nbsp;<%end if%><%if Email_PEC<>"" then%>PEC: <%=Email_PEC%><%end if%><br />
													<%if Len(indirizzo)>0 then%><%=indirizzo%>&nbsp;<%end if%>
													<%=cap%>&nbsp;&nbsp;<%=citta%><%if provincia<>"" then%>&nbsp;(<%=provincia%>)&nbsp;<%end if%>
												</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
						<div class="col-md-12">
								<div class="bg-primary">
		                <p style="font-size: 1.2em; text-align: right; padding: 10px 15px; color: #000;">Total Order: <b>
										<%if TotaleGenerale<>0 then%>
											<%=FormatNumber(TotaleGenerale,2)%>
										<%else%>
											0,00
										<%end if%>
										&nbsp&#8364;
										</b></p>
		            </div>
		            <%if FkPagamento=1 or FkPagamento=3 or FkPagamento=4 or FkPagamento=5 then%>
		            <a href="#" onClick="MM_openBrWindow('stampa_ordine.asp?idordine=<%=IdOrdine%>&mode=1','','width=760,height=900,scrollbars=yes')" class="btn btn-danger pull-right hidden-print"><i class="glyphicon glyphicon-print"></i> Print order</a>
								<%end if%>
		        </div>
				</div>
    </div>
    <!--#include file="inc_footer.asp"-->
</body>

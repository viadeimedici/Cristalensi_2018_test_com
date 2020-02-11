<!--#include virtual="/inc_strConn.asp"-->
<%
prov=request("prov")
if prov="" then prov=0
'se = 0 proviene dal sito
'se = 1 proviene dal negozio

	pkid = Session("idCliente")
	if pkid = "" then pkid = 0
	'response.write("pkid:"&pkid)

	mode = request("mode")
	if mode = "" then mode = 0

	errore=0

	if prov=3 and mode=0 THEN
		session("url_prodotto")=fromURL_preferiti
		'response.write(fromURL_preferiti)
	end if

	'iscrizione prima volta
	if mode=1 then
		nome=LTrim(request("nome"))
		nominativo=LTrim(request("nominativo"))
		email=LTrim(request("email"))
		aut_email=request("aut_email")
		password=LTrim(request("password"))
		data=now()
		ip=Request.ServerVariables("REMOTE_ADDR")

		lg1=InStr(email, "'")
		if lg1>0 then
			email=Replace(email, "'", " ")
			'response.End()
		end if
		lg2=InStr(email, "&")
		if lg2>0 then
			email=Replace(email, "&", " ")
			'response.End()
		end if
		lg3=InStr(email, "=")
		if lg3>0 then
			email=Replace(email, "=", " ")
			'response.End()
		end if
		lg4=InStr(email, " or ")
		if lg4>0 then
			email=Replace(email, " or ", " ")
			'response.End()
		end if
		email=Trim(email)

		if email="" or password="" or nome="" or nominativo="" then
			errore=1
			mode=3
		end if
	end if

	if mode=1 and pkid=0 then
		Set rs=Server.CreateObject("ADODB.Recordset")
		sql = "Select email, dominio From Clienti WHERE Dominio LIKE '"&dominio&"' AND email='"&email&"'"
		rs.Open sql, conn, 1, 1
		if rs.recordcount>0 then
			errore=1
			mode=3
		end if
		rs.close
	end if

	if mode=1 and pkid>0 then
		Set rs=Server.CreateObject("ADODB.Recordset")
		sql = "Select email, pkid, dominio From Clienti WHERE Dominio LIKE '"&dominio&"' AND email='"&email&"'"
		rs.Open sql, conn, 1, 1
		if rs.recordcount>0 then
			if rs("pkid")=pkid then
				errore=0
			else
				errore=1
				mode=3
			end if
		end if
		rs.close
	end if

if mode=1 then
	if pkid=0 then
		Set rs=Server.CreateObject("ADODB.Recordset")
		sql = "Select Top 1 PkId, Dominio From Clienti Order by PkId DESC"
		rs.Open sql, conn, 1, 1
		PkId_Prec=rs("PkId")
		rs.close
		pkid_iscritto=PkId_Prec+1
		'response.write("pkid_iscritto:"&pkid_iscritto)
	end if

	Set rs=Server.CreateObject("ADODB.Recordset")
	sql = "Select * From Clienti"
	if pkid > 0 then sql = "Select * From Clienti WHERE Dominio LIKE '"&dominio&"' AND pkid="&pkid
	rs.Open sql, conn, 3, 3

		if pkid = 0 then
			rs.addnew
			rs("pkid")=pkid_iscritto
		end if

		rs("nome")=nome
		rs("nominativo")=nominativo
		rs("email")=email
		rs("aut_email")=aut_email
		rs("password")=password
		rs("data")=data
		rs("ip")=ip
		rs("aut_privacy")=True
		rs("dominio")=dominio

		rs.update
		rs.close

		if pkid=0 then

			'invio l'email di benvenuto al cliente
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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Congratulations "&nome&" "&nominativo&"! Your subscription to Cristalensi.com was successful. <br> From now you can order our products without having to re-enter your information.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Sensitive data and determining access to services Cristalensi.com:<br>Name and Surname: <b>"&nome&" "&nominativo&"</b><br>Login: <b>"&email&"</b><br>Password: <b>"&password&"</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = email
			Oggetto = "Subscription to site Cristalensi.com"
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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Nuova registrazione al sito internet.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti per l'accesso ai servizi di Cristalensi.com (inglese):<br>Nome e Cognome: <b>"&nome&" "&nominativo&"</b><br>Login: <b>"&email&"</b><br>Password: <b>"&password&"</b><br>Codice cliente: <b>"&pkid_iscritto&"</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = "info@cristalensi.it"
			Oggetto = "Nuova iscrizione al sito Cristalensi.com (inglse)"
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

			'invio al webmaster


			Mittente = "info@cristalensi.it"
			Destinatario = "viadeimedici@gmail.com"
			Oggetto = "Nuova iscrizione al sito Cristalensi.it"
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



		nome_log=nome&" "&nominativo
		session("nome_log")=nome&" "&nominativo
		idsession=pkid_iscritto
		session("idCliente")=pkid_iscritto
		'italia_log=italia
'		if italia_log="" then italia_log="Si"
'		if italia_log="S�" then italia_log="Si"
'		if italia_log="S&igrave;" then italia_log="Si"
'		session("italia_log")=italia_log

		end if

		if prov=0 and errore=0 then response.redirect("/de/areaprivata.asp")
		if prov=1 and errore=0 then response.redirect("/de/carrello2.asp")
		if prov=2 and errore=0 then response.redirect("/de/preferiti.asp")
		if prov=3 and errore=0 then
			url_prodotto=session("url_prodotto")
			response.redirect(url_prodotto)
		end if
end if

	'if mode=2 and pkid=0 then response.Redirect("iscrizione.asp")


'login
  if mode=2 then
  	login = Request.form("login")
  	lg1=InStr(login, "'")
  	if lg1>0 then
  		login=Replace(login, "'", " ")
  		'response.End()
  	end if
  	lg2=InStr(login, "&")
  	if lg2>0 then
  		login=Replace(login, "&", " ")
  		'response.End()
  	end if
  	lg3=InStr(login, "=")
  	if lg3>0 then
  		login=Replace(login, "=", " ")
  		'response.End()
  	end if
  	lg4=InStr(login, " or ")
  	if lg4>0 then
  		login=Replace(login, " or ", " ")
  		'response.End()
  	end if
  	login=Trim(login)

  	password = Request.form("Password")
  	pw1=InStr(password, "'")
  	if pw1>0 then
  		password=Replace(password, "'", " ")
  		'response.End()
  	end if
  	pw2=InStr(password, "&")
  	if pw2>0 then
  		password=Replace(password, "&", " ")
  		'response.End()
  	end if
  	pw3=InStr(password, "=")
  	if pw3>0 then
  		password=Replace(password, "=", " ")
  		'response.End()
  	end if
  	pw4=InStr(password, " or ")
  	if pw4>0 then
  		password=Replace(password, " or ", " ")
  		'response.End()
  	end if
  	password=Trim(password)


  	Set log_rs = Server.CreateObject("ADODB.Recordset")
  	sql = "SELECT * FROM Clienti WHERE Dominio LIKE '"&dominio&"' AND Email='" & login & "' AND Password='" & password & "'"
  	log_rs.open sql,conn

  	if not log_rs.eof then
  		idsession=log_rs("PkId")
  		nome_log=log_rs("Nome")
  		cognome_log=log_rs("Nominativo")
  		if nome_log="" and cognome_log="" then
  			nome_log="Cliente Anonimo"
  		else
  			nome_log=nome_log&" "&cognome_log
  		end if
  		'italia_log=log_rs("Italia")
  		'if italia_log="" then italia_log="Si"
  		'if italia_log="S�" then italia_log="Si"
  		'if italia_log="S&igrave;" then italia_log="Si"

  		Session("idCliente") = idsession
  		Session("nome_log") = nome_log
  		'Session("italia_log") = italia_log
      errore=0
  	else
  		errore=2
  	end if
  	log_rs.close
  	set log_rs = nothing

    if prov=0 and errore=0 then response.redirect("/de/areaprivata.asp")
    if prov=1 and errore=0 then response.redirect("/de/carrello2.asp")
		if prov=2 and errore=0 then response.redirect("/de/preferiti.asp")
		if prov=3 and errore=0 then
			url_prodotto=session("url_prodotto")
			response.redirect(url_prodotto)
		end if
  'else
  	'nome_log=Session("nome_log")
  	'idsession=Session("idCliente")
  	'if idsession="" then idsession=0
  end if


'recupero password
	if mode=4 then
		email=request("email")

		lg1=InStr(email, "'")
		if lg1>0 then
			email=Replace(email, "'", " ")
			'response.End()
		end if
		lg2=InStr(email, "&")
		if lg2>0 then
			email=Replace(email, "&", " ")
			'response.End()
		end if
		lg3=InStr(email, "=")
		if lg3>0 then
			email=Replace(email, "=", " ")
			'response.End()
		end if
		lg4=InStr(email, " or ")
		if lg4>0 then
			email=Replace(email, " or ", " ")
			'response.End()
		end if
		email=Trim(email)
	end if

	if mode=4 then
		if Len(email)>0 then
			Set rs=Server.CreateObject("ADODB.Recordset")
			sql = "SELECT email,password,nominativo,nome,dominio From Clienti WHERE Dominio LIKE '"&dominio&"' AND email='"&email&"'"
			rs.Open sql, conn, 1, 1
			if rs.recordcount=0 then
				mode=5
				errore=5
			else
				nominativo=rs("nominativo")
				nome=rs("nome")
				password=rs("password")
			end if
			rs.close
		Else
				mode=5
				errore=5
		end if
	end if

	if mode = 4 then


			'invio l'email di recupero pw al cliente
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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dear "&nome&" "&nominativo&", the password entered when registering for Cristalensi.com is the following:<br><br></font>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Password: <b>"&password&"</b><br>Login: <b>"&email&"</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = email
			Oggetto = "Password recovery for Cristalensi.com"
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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>E' stata fatta una richiesta di recupero password dal seguente cliente: "&nome&" "&nominativo&"<br> La password inserita al momento dell'iscrizione a Cristalensi.com (inglese) &egrave; la seguente:<br></font>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Password: <b>"&password&"</b><br>Login: <b>"&email&"</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = "info@cristalensi.it"
			Oggetto = "Richiesta recupero password dal sito Cristalensi.com (inglese)"
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
<!DOCTYPE html>
<html>

<head>
		<meta charset="utf-8">
		<title>CRISTALENSI Registrierung des Kunden - Online Shop Lampen</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta charset="utf-8">
    <meta name="description" content="CRISTALENSI Registrierung des Kunden - Online Shop Lampen">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="CRISTALENSI Registrierung des Kunden - Online Shop Lampen">
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
    <SCRIPT language="JavaScript">

    function verifica() {

      nome=document.newsform.nome.value;
      nominativo=document.newsform.nominativo.value;
      email=document.newsform.email.value;
      conferma=document.newsform.conferma.value;
      password=document.newsform.password.value;

      if (nome==""){
        alert("\"Vorname\" Pflichtfeld.");
        return false;
      }
      if (nominativo==""){
        alert("\"Nachname\" Pflichtfeld.");
        return false;
      }
      if (email==""){
        alert("\"Email\" Pflichtfeld.");
        return false;
      }
      if (email.indexOf("@")==-1 || email.indexOf(".")==-1){
      alert("Achtung! Die eingegebene e-mail Adresse kann nicht akzeptiert werden.");
      return false;
      }
      if (email!=conferma){
        alert("\"E-mail\" and \"Bestatigung E-mail\" muss gleich sein.");
        return false;
      }
      if (password==""){
        alert("\"Password\" Pflichtfeld.");
        return false;
      }
			if (password.indexOf("ì")!=-1 || password.indexOf("é")!=-1 || password.indexOf("è")!=-1 || password.indexOf("ò")!=-1 || password.indexOf("à")!=-1 || password.indexOf("ù")!=-1){
      alert("ATTENTION! \"Password\" must not contain accented characters.");
      return false;
      }

      else
    return true

    }

    function accetta(el){
    checkobj=el
      if (document.all||document.getElementById){
        for (i=0;i<checkobj.form.length;i++){
    var tempobj=checkobj.form.elements[i]
      if(tempobj.type.toLowerCase()=="submit")
    tempobj.disabled=!checkobj.checked
                  }
                }
              }
    </SCRIPT>
		<!--#include virtual="/inc_funzioni_head.asp"-->
</head>

<body>
    <!--#include virtual="/de/inc_header_1.asp"-->
    <!--#include virtual="/de/inc_header_2.asp"-->
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
				<%if prov=1 then%>
        <div class="col-sm-12">
            <div class="row bs-wizard">
                <div class="col-sm-5 bs-wizard-step complete">
                    <div class="text-center bs-wizard-stepnum">1</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="/carrello1.asp" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Warenkorb</div>
                </div>
                <div class="col-sm-5 bs-wizard-step active">
                    <div class="text-center bs-wizard-stepnum">2</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Wiedererkennung / Registrierung</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">3</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Spedition Adresse</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">4</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Zahlungsweisen &amp; Fakturierung</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">5</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Bestellbestatigung</div>
                </div>
            </div>
        </div>
				<%else%>
				<div class="col-xl-12">
            <ol class="breadcrumb">
                <li><a href="/"><i class="fa fa-home"></i></a></li>
                <li class="active">Wiedererkennung &amp; Registrierung</li>
            </ol>
        </div>
				<%end if%>
        <div class="col-sm-12">
            <div class="row vdivide is-table-row">
                <div class="col-lg-6">
                    <div class="title">
                        <h4>Wiedererkennung des Kunden</h4>
                    </div>
                    <div class="col-md-12">
                        <p class="description">Wenn Sie sich schon eingeschrieben haben, und von daher auch im Besitz des Login (E-mail) und des Passwortes sind, brauchen Sie sich nicht nochmals einzuschreiben, es reicht, wenn Sie Ihre Logindaten hier unten eingeben und Sie werden automatisch erkannt werden.
                        </p>
												<%if errore=2 then%><p><strong>Achtung! E-Mail oder Passwort ist nicht korrekt.</strong></p><%end if%>
                        <form class="form-horizontal" method="post" action="/de/iscrizione.asp?mode=2" name="newsform2">
												<input type="hidden" name="prov" value="<%=prov%>">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Login</label>
                                <div class="col-sm-8">

																		<input type="email" class="form-control" id="inputEmail3" name="login">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-4 control-label">Passwort</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="inputPassword3" name="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <button type="submit" class="btn btn-danger">Anmelden</button>
                                </div>
                            </div>
                        </form>
                    </div>
										<p>&nbsp;<br>&nbsp;</p>
										<div class="title">
                        <h4>Password Recovery</h4>
                    </div>
                    <div class="col-md-12">
											<%if mode=4 then%>
												<p class="description"><strong>The access password to Cristalensi.com has been successfully sent your e-mail address: <br><%=email%><br>checking it you will be able to recovery the access data for the internet site.</strong>
												</p>
											<%else%>
												<p class="description">Auf dieser Seite konnen Sie Ihr vergessenes Passwort, dass Sie bei der Registrierung auf cristalensi.it erhalten haben, wiedererlangen.
Wichtige Information: die e-mail Adresse muss die gleiche sein, die zur Registrierung genutzt worden ist.
Denken Sie bitte auch daran, dass diese e-mail Adresse als Login fur Ihre zukunftigen Bestellungen dient.
                        </p>
												<%if errore=5 then%><p><strong>Achtung! E-Mail ist nicht korrekt.</strong></p><%end if%>
                        <form class="form-horizontal" method="post" action="/de/iscrizione.asp?mode=4" name="newsform3">
												<input type="hidden" name="prov" value="<%=prov%>">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Email</label>
                                <div class="col-sm-8">

																		<input type="email" class="form-control" id="inputEmail3" name="email">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <button type="submit" class="btn btn-danger">Anmelden</button>
                                </div>
                            </div>
                        </form>
											<%end if%>
                    </div>
                </div>
								<%
								if pkid>0 then
									Set rs=Server.CreateObject("ADODB.Recordset")
									sql = "SELECT * From Clienti WHERE Dominio LIKE '"&dominio&"' AND pkid="&pkid
									rs.Open sql, conn, 1, 1
									if rs.recordcount>0 then
									nome=rs("nome")
									nominativo=rs("nominativo")
									email=rs("email")
									password=rs("password")
									aut_email=rs("aut_email")
									end if
									rs.close
								end if
								%>
                <div class="col-lg-6">
                    <div class="title">
                        <h4><%if pkid>0 then%>Changing client data<%else%>Registrierung des Kunden<%end if%></h4>
                    </div>
                    <div class="col-md-12">
                        <p class="description">Auf dieser Seite konnen Sie Ihre fur die Registrierung bei Cristalensi benotigten Daten eingeben.
Wichtige Information: es ist ausserst wichtig, dass es sich bei der angegebenen e-mail Adresse um eine funktionierende und von Ihnen regelmassig genutzte Adresse handelt, denn wir werden diese nutzen, um Ihnen Mitteilungen hinsichtlich Ihrer Bestellungen und unserer Produkte zuzusenden.
Denken Sie bitte auch daran, dass diese e-mail Adresse als Login fur Ihre zukunftigen Bestellungen dient.</p>
												<%if errore=1 then%><p><strong>Achtung! Die eingegebene e-mail Adresse kann nicht akzeptiert werden.</strong></p><%end if%>
                        <form class="form-horizontal" method="post" action="/de/iscrizione.asp?mode=1&amp;pkid=<%=pkid%>" name="newsform" id="newsform" onSubmit="return verifica();">
												<input type="hidden" name="prov" value="<%=prov%>">
                            <div class="form-group">
                                <label for="nome" class="col-sm-4 control-label">Vor-</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="nome" name="nome" value="<% if pkid > 0 then %><%=nome%><%else%><%if mode=3 then%><%=nome%><%end if%><%end if%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="nominativo" class="col-sm-4 control-label">Nachname</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="nominativo" name="nominativo" value="<% if pkid > 0 then %><%=nominativo%><%else%><%if mode=3 then%><%=nominativo%><%end if%><%end if%>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="email" class="col-sm-4 control-label">Email</label>
                                <div class="col-sm-8">
                                    <input type="email" class="form-control" id="email" name="email" value="<% if pkid > 0 then %><%=email%><%else%><%if mode=3 then%><%=email%><%end if%><%end if%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="conferma" class="col-sm-4 control-label">Bestatigung Email</label>
                                <div class="col-sm-8">
                                    <input type="email" class="form-control" id="conferma" name="conferma" value="<% if pkid > 0 then %><%=email%><%else%><%if mode=3 then%><%=email%><%end if%><%end if%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-4 control-label">Passwort</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="password" name="password" value="<% if pkid > 0 then %><%=password%><%else%><%if mode=3 then%><%=password%><%end if%><%end if%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <span>Zustimmung zum Erhalt von e-mails</span>
                                    <div class="radio">
                                        <label><input type="radio" name="aut_email" value=True <% if pkid > 0 then %><%if aut_email=True then%> checked<%end if %><%else%> checked<%end if%>> yes</label>
                                        <label><input type="radio" name="aut_email" value=False <% if pkid > 0 then %><%if aut_email=False then%> checked<%end if %><%end if%>> no</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <textarea class="form-control" rows="3" readonly style="font-size: 11px;" readonly>INFORMATIONEN FUR DIE NUTZUNG DER PERSONLICHEN DATEN
Gemass des Gesetzes D.L. 196/2003, informiert die Firma den Interessenten, dass die ihn betreffenden Daten, die er selbst uns zur Verfugung gestellt hat, Gegenstand der Weitergabe im Respekt der oben aufgefuhrten Vorschrift sein konnen. Diese Daten werden nur fur Verwaltungs-, Werbe- und kommerzielle Zwecke weitergegeben. Die Mitteilung Ihrer Daten an unsere Firma ist vollkommen fakultativ.
Die erhobenen Daten konnen von uns an Dritte weitergegeben werden Gemass des Gesetzes D.L. 196/2003, um die oben aufgefuhrten Zwecke zu verfolgen.

Die verantwortliche Stelle fur den Schutz Ihrer personenbezogenen Daten ist Cristalensi s.n.c.
mit Sitz in via arti e mestieri, 1
Montelupo F.no (FLORENZ - ITALIEN)
, Dort befindet sich ebenfalls der Sitz des zeitweiligen Verantwortlichen, dessen Identifikationsdaten Sie uber das offentliche Register des Garant oder beim Gerichtssitz der Firma erfragen konnen.

Die Firma informiert ausserdem den Interessenten, dass er Gemass des Gesetzes D.L. 196/2003 die folgenden Rechte ausuben kann:
der Interessent kann kostenlos durch den Zugang uber das offentliche Register des Garant die Existenz samtlicher ihn betreffender Daten erfragen;
der Interessent kann von Cristalensi s.n.c., - mit einer Gebuhr, die nur bei einer negativen Antwort anfallt - die Bestatigung uber das eventuelle Vorhandensein seiner personlichen Daten im Firmenarchiv erhalten, und ebenso die Kommunikation und Information uber die Logistik und die Zwecke derselbigen. Diese Anfrage ist nach 90 Tagen erneuerbar;
der Interessent kann die Loschung, die Umwandlung in anonyme Form und die Sperrung von gesetzeswidrig verarbeiteten Daten verlangen;
der Interessent kann die Aktualisierung, die Korrektur oder die Integration der Daten verlangen;
der Interessent erhalt die Bescheinigung, dass die Loschung, die Aktualisierung, die anderung oder die Integration seiner personlichen Daten, denjenigen mitgeteilt worden sind, die mit seinen Daten in Kontakt gekommen sind;
der Interessent kann kostenlos Einspruch gegen die Verarbeitung seiner personlichen Daten erheben.</textarea>
                                    <div class="checkbox">
                                        <label><input name="chekka" type="checkbox" onClick="accetta(this)" /> Akzeptieren Sie die Bedingungen</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <button type="submit" class="btn btn-danger" name="Submit" disabled>Speichem</button> (*) Pflichtfeld
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="/de/inc_footer.asp"-->
</body>
<!--#include virtual="/inc_strClose.asp"-->

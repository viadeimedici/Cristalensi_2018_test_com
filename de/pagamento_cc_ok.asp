<!--#include virtual="/inc_strConn.asp"-->
<%
IdOrdine=session("ordine_shop")
session("ordine_shop")=""
if IdOrdine="" then IdOrdine=0
if idOrdine=0 then response.redirect("/carrello1.asp")

Set ss = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM Ordini WHERE Dominio LIKE '"&dominio&"' AND pkid="&idOrdine
ss.Open sql, conn, 3, 3

if ss.recordcount>0 then
  ss("stato")=9
  ss("DataAggiornamento")=now()
  ss("IpOrdine")=Request.ServerVariables("REMOTE_ADDR")
  ss.update
end if

ss.close

if idsession>0 then
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
  HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Thank you "&nominativo_email&" for having chosen our products!<br>This e-mail is a confirmation of the completion of order n. "&idordine&"/COM.<br> It will be the care of our staff to send the merchandise to you the moment our bank is notified of payment with Credit Card.</font>"
  HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000><br><br>Best wishes from the staff of Cristalensi</font>"
  HTML1 = HTML1 & "</td>"
  HTML1 = HTML1 & "</tr>"
  HTML1 = HTML1 & "</table>"
  HTML1 = HTML1 & "</body>"
  HTML1 = HTML1 & "</html>"

  Mittente = "info@cristalensi.it"
  Destinatario = email
  Oggetto = "Confirmation payment order n "&idordine&"/COM with Credit Card to Cristalensi.com"
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
  HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Nuovo ordine con pagamento con Carta di Credito dal sito internet.</font><br>"
  HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti del nuovo ordine:<br>Nominativo: <b>"&nominativo_email&"</b><br>Email: <b>"&email&"</b><br>Codice cliente: <b>"&FkCliente&"</b><br>Codice ordine: <b>"&idordine&"/COM</b></font><br>"
  HTML1 = HTML1 & "</td>"
  HTML1 = HTML1 & "</tr>"
  HTML1 = HTML1 & "</table>"
  HTML1 = HTML1 & "</body>"
  HTML1 = HTML1 & "</html>"

  Mittente = "info@cristalensi.it"
  Destinatario = "info@cristalensi.it"
  Oggetto = "Conferma pagamento ordine n "&idordine&"/COM (inglese) con Carta di Credito a Cristalensi.com"
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
  HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Nuovo ordine con pagamento da Carta di Credito dal sito internet.</font><br>"
  HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti del nuovo ordine:<br>Nominativo: <b>"&nominativo_email&"</b><br>Email: <b>"&email&"</b><br>Codice cliente: <b>"&FkCliente&"</b><br>Codice ordine: <b>"&idordine&"/COM</b></font><br>"
  HTML1 = HTML1 & "</td>"
  HTML1 = HTML1 & "</tr>"
  HTML1 = HTML1 & "</table>"
  HTML1 = HTML1 & "</body>"
  HTML1 = HTML1 & "</html>"

  'invio al webmaster

  Mittente = "info@cristalensi.it"
  Destinatario = "viadeimedici@gmail.com"
  Oggetto = "Conferma pagamento ordine n "&idordine&"/COM (inglese) con Carta di Credito a Cristalensi.com"
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
    <link href="/stylesheets/styles.css" media="screen" rel="stylesheet" type="text/css">
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
  <!--#include virtual="/de/inc_header_1.asp"-->
  <!--#include virtual="/de/inc_header_2.asp"-->
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-sm-12">
            <div class="row bs-wizard">

              <div class="col-sm-5 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">1</div>
                  <div class="progress">
                      <div class="progress-bar"></div>
                  </div>
                  <a href="/de/carrello1.asp" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Warenkorb</div>
              </div>
              <div class="col-sm-5 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">2</div>
                  <div class="progress">
                      <div class="progress-bar"></div>
                  </div>
                  <a href="/de/iscrizione.asp" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Wiedererkennung / Registrierung</div>
              </div>
              <div class="col-sm-5 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">3</div>
                  <div class="progress">
                      <div class="progress-bar"></div>
                  </div>
                  <a href="/de/carrello2.asp" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Spedition Adresse</div>
              </div>
              <div class="col-sm-5 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">4</div>
                  <div class="progress">
                      <div class="progress-bar"></div>
                  </div>
                  <a href="/carrello3.asp" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Zahlungsweisen &amp; Fakturierung</div>
              </div>
              <div class="col-sm-5 bs-wizard-step active">
                  <div class="text-center bs-wizard-stepnum">5</div>
                  <div class="progress">
                      <div class="progress-bar"></div>
                  </div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Bestellbestatigung</div>
              </div>
            </div>
        </div>
        <div class="col-md-12">
							<div class="title">
									<h4><%=IdOrdine%></h4>
							</div>
							<div class="col-md-12 hidden-print">
									<p class="description">
                    Die Zahlungsprozedur ist korrekt ausgefuhrt worden.<br>
                                            <br>
                                        Die Ware wird Ihnen zugeschickt, sobald unsere Bank Ihre uberweisung erhalten hat.<br>
                                        <br>
                                        Sie konnen den Stand Ihrer Bestellung direkt im Kundenbereich verfolgen. Es ist unseren Mitarbeitern eine Freude, Sie per e-mail zu informieren, sobald Ihre bestellten Produkte abgeschickt worden sind.
                                        <br>
                                        Herzliche Grusse, Ihr Team von Cristalensi.
                                        <br>
                                        <br>
									</p>
							</div>

        </div>
    </div>
    <!--#include virtual="/de/inc_footer.asp"-->
</body>

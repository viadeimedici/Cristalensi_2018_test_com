<!--#include virtual="/inc_strConn.asp"-->
<%
	mode=request("mode")
	if mode="" then mode=0

	if idsession=0 then response.Redirect("/iscrizione.asp")

	Destinazione=request("Destinazione")

	if mode=1 then
		testo=request("testo")
		if Len(testo)=0 then mode=2
		if Instr(1, testo, "www", 1)>0 then mode=2
		if Instr(1, testo, "@", 1)>0 then mode=2
	end if
	if mode=1 then
		Set rs=Server.CreateObject("ADODB.Recordset")
		sql = "Select Top 1 PkId From Commenti_Clienti Order by PkId DESC"
		rs.Open sql, conn, 1, 1
		PkId_Prec=rs("PkId")
		rs.close
		pkid_commento=PkId_Prec+1

		Set cli_rs=Server.CreateObject("ADODB.Recordset")
		sql = "Select * From Commenti_Clienti"
		cli_rs.Open sql, conn, 3, 3
		cli_rs.addnew
			cli_rs("PkId")=pkid_commento
			cli_rs("Testo")=request("Testo")
			cli_rs("Valutazione")=request("Valutazione")
			cli_rs("FkIscritto")=idsession
			cli_rs("Data")=now()
			cli_rs("Pubblicato")=False
			cli_rs("Risposta")=False
			cli_rs("Dominio")=Dominio
		cli_rs.update
		cli_rs.close

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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Thank you "&nominativo_email&" to send a review!<br>If it will be accepted by our moderators you will receive an email notification of the publication.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000><br><br>Best wishes from the staff of Cristalensi</font>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = email
			Oggetto = "Confirmation for a review on Cristalensi.com"
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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Nuovo commento sul sito internet.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti del nuovo commento:<br>Nominativo: <b>"&nominativo_email&"</b><br>Email: <b>"&email&"</b><br>Codice cliente: <b>"&idsession&"</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = "info@cristalensi.it"
			Oggetto = "Conferma invio commento a Cristalensi.com"
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
			Oggetto = "Conferma invio commento a Cristalensi.com"
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
		<title>Bewertungsformular Cristalensi</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Senden Sie auch eine Bewertung über Beleuchtungsgeschäft online Cristalensi.">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Senden Sie auch eine Bewertung über Beleuchtungsgeschäft online Cristalensi.">
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
    <link rel="stylesheet" type="text/css" href="/stylesheets/customization.css" shim-shadowdom>
    <!--[if lt IE 9]><script src="javascripts/html5shiv.js"></script><![endif]-->
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,400i,500,600,700" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/webcomponentsjs/0.7.5/webcomponents.min.js"></script>
    <link rel="import" href="awesome-slider.html">
    <style type="text/css">
        .clearfix:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
    </style>
		<!--#include virtual="/inc_funzioni_head.asp"-->
</head>

<body>
    <!--#include virtual="/de/inc_header_1.asp"-->
    <!--#include virtual="/de/inc_header_2.asp"-->
    <div class="container content">
        <div class="col-md-12">
            <div class="row top-buffer">
                <div class="col-md-8">


                  <div class="title">
                      <h4>Senden Sie auch eine Bewertung!</h4>
                  </div>
                  <div class="col-md-12">
                    <%if mode=1 then%>
                      <p class="description">Ihre Bewertung wurde korrekt eingefügt. Jetzt wird sie von unseren Mitarbeitern bewertet. Wenn sie genehmigt wird, senden wir Ihnen eine E-Mail-Benachrichtigung. <br /> Vielen Dank für Ihre Zusammenarbeit mit den Mitarbeitern von Cristalensi.<br /><br /><a href="https://www.cristalensi.it/commenti_elenco.asp" class="button_link_red" style="float:right">Alle Bewertungen</a>
                      </p>
                    <%else%>
                      <p class="description">Senden Sie eine Bewertung zu den gekauften Produkten, ob es Ihnen gefallen hat oder nicht, oder eine Bewertung auf der Website oder dem Unternehmen und den Mitarbeitern. <br /> Kommentare werden nicht sofort veröffentlicht, sondern von unseren Mitarbeitern überprüft, um zu verhindern, dass sie als rechtswidrig, anstößig und nicht veröffentlicht eingefügt werden. <br /> Bitte geben Sie keinen HTML-Code, keine E-Mail und keine Links zu anderen Websites ein. Der Kommentar wird nicht veröffentlicht. <br /> In jedem Kommentar wird auch <strong> Name </ strong> veröffentlicht, der bei der Registrierung eingereicht wird.
                      </p>
                      <%if mode=2 then%><p><strong>Warnung! Überprüfen Sie den durch die Regeln eingegebenen Text, danke.</strong></p><%end if%>
                      <form class="form-horizontal" method="post" action="/de/commenti_form.asp?mode=1" name="newsform2">
                          <div class="form-group">
                              <label for="testo" class="col-sm-2 control-label">Bewertungen</label>
                              <div class="col-sm-10">
                                  <textarea name="testo" style="width: 100%" rows="4" id="testo"></textarea>
                              </div>
                          </div>
													<div class="form-group">
                              <label for="valutazione" class="col-sm-2 control-label">Bewertung</label>
                              <div class="col-sm-10">
                                  <select class="selectpicker show-menu-arrow  show-tick" data-size="5" title="valutazione" name="valutazione" id="valutazione">
																	<option value="5" selected>5 - Groß</option>
																	<option value="4">4 - Gut</option>
																	<option value="3">3 - Genug</option>
																	<option value="2">2 - Unzureichend</option>
																	<option value="1">1 - Niedrig</option>
																	</select>
                              </div>
                          </div>
                          <div class="form-group">
                              <div class="col-sm-offset-4 col-sm-8">
                                  <a href="/de/commenti_elenco.asp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Alle Bewertungen</a>
                                  <button type="submit" class="btn btn-danger">Einreichen</button>
                              </div>
                          </div>
                      </form>
                    <%end if%>
                  </div>

                  <p>&nbsp;<br>&nbsp;</p>
                </div>
                <div class="col-md-4">
                    <!--#include virtual="/de/inc_box_contatti.asp"-->
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="/de/inc_footer.asp"-->
</body>
<!--#include virtual="/inc_strClose.asp"-->

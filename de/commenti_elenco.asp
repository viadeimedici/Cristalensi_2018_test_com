<!--#include virtual="/inc_strConn.asp"-->
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Bewertungen über Beleuchtungsgeschäfte online von italienischen Lampen</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Senden Sie auch eine Bewertung über Beleuchtungsgeschäft online Cristalensi">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Senden Sie auch eine Bewertung über Beleuchtungsgeschäft online Cristalensi">
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
    <link rel="stylesheet" type="text/css" href="/stylesheets/camera.css" shim-shadowdom>
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
    <!--#include virtual="/inc_funzioni_head.asp"-->
</head>

<body>
    <!--#include virtual="/de/inc_header_1.asp"-->
    <!--#include virtual="/de/inc_header_2.asp"-->
    <div class="container content">
        <div class="col-md-12">
            <div class="row top-buffer">
                <div class="col-md-8">
                    <h1 class="slogan">Bewertungen zu gekauften Beleuchtungsprodukten</h1>
                    <p class="main-description">
                        Im Hinblick auf Transparenz, Kundenansprache und Verbesserung unserer Dienstleistungen haben wir diesen Bereich geöffnet, in dem Kunden eine Nachricht oder einen Kommentar zur Funktionsweise der Website oder eine Überprüfung der gekauften Beleuchtungsprodukte, aber auch der Dienstleistungen der Mitarbeiter selbst einreichen können. <br /> Um einen Kommentar zu veröffentlichen, müssen Sie auf der Website registriert sein und gesendete Nachrichten werden vom Personal genehmigt, um zu verhindern, dass die Veröffentlichung oder anstößige Texte Werbelinks zu anderen Internetseiten einfügen.
                    </p>
                    <%
                    Set com_rs = Server.CreateObject("ADODB.Recordset")
                    sql = "SELECT * FROM Commenti_Clienti WHERE Pubblicato=1 ORDER BY PkId DESC"
                    com_rs.open sql,conn, 1, 1
                    if com_rs.recordcount>0 then
                    %>
                    <div class="panel panel-default user-comment">
                        <!-- Default panel contents -->
                        <div class="panel-heading">
                            <h5><i class="fa fa-users"></i> Bewertungen</h5>
                        </div>
                        <ul class="list-group">
                        <%Do While not com_rs.EOF%>
                        <li class="list-group-item"><i class="fa fa-user"></i> <em><%=NoHTML(com_rs("Testo"))%><br />Bewertung: <%=com_rs("Valutazione")%>/5</em></li>
                        <%
                        com_rs.movenext
                        loop
                        %>
                        <div class="panel-footer"><a href="/de/commenti_form.asp" class="btn btn-success">Senden Sie auch einen Kommentar! <i class="fa fa-chevron-right"></i></a></div>
                        </ul>

                    </div>
                    <%
                    end if
                    com_rs.close
                    %>
                </div>
                <div class="col-md-4">
                    <div class="banner preventivi overflowContainer">
                        <h3 class="title">Preventivi personalizzati</h3>
                        <p class="text">Per ordini superiori a 500&euro; contatta il nostro personale... <strong>sconti speciali!</strong></p>
                    </div>
                    <div class="banner pagamenti overflowContainer">
                        <h3 class="title">Sito internet e pagamenti sicuri</h3>
                        <p class="text">Contrassegno, Bonifico Bancario, PostePay e Carte di Credito con Sistema Garantito di PayPal
                        </p>
                    </div>
                    <div class="banner consegne overflowContainer">
                        <h3 class="title">Consegne</h3>
                        <p class="text">confezionamento accurato e spedizione assicurata GRATUITA in tutta Italia per ordini superiori a 250&euro;</p>
                    </div>

    								<!--condizioni di vendita-->
                    <div class="panel panel-default payment-list">
    										<!-- Default panel contents -->
    										<div class="panel-heading">
    											<h5>Condizioni di vendita</h5>
    										</div>
    										<ul class="list-group">
    											<li class="list-group-item"><strong>SPEDIZIONE ASSICURATA IN TUTTA ITALIA</strong></li>
    											<li class="list-group-item"><i class="fa fa-check"></i> <em>Per ordini superiori a 250&euro;:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
    											<li class="list-group-item"><i class="fa fa-check"></i> <em>Per ordini fino a  250&euro;:</em><div style="float: right;"><em><strong>10&euro;</strong></em></div></li>
    											<li class="list-group-item"><i class="fa fa-check"></i> <em>Ritiro in sede:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
    											<li class="list-group-item">&nbsp;</li>
    											<li class="list-group-item"><strong>PAGAMENTI SICURI</strong></li>
    											<li class="list-group-item"><i class="fa fa-check"></i> <em>Bonifico e PostePay:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
    											<li class="list-group-item"><i class="fa fa-check"></i> <em>Carte di credito e prepagate:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
    											<li class="list-group-item"><i class="fa fa-check"></i> <em>Contrassegno in contanti:</em><div style="float: right;"><em><strong>4&euro;</strong></em></div></li>
    										</ul>
    										<div class="panel-footer"><a href="/de/condizioni_di_vendita.asp" class="btn btn-default">Condizioni di vendita <i class="fa fa-chevron-right"></i></a></div>
    								</div>
                    <!--#include virtual="/de/inc_box_contatti.asp"-->
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="/de/inc_footer.asp"-->
</body>
<!--#include virtual="/inc_strClose.asp"-->

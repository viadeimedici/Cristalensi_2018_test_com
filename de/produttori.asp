<!--#include file="inc_strConn.asp"-->
<!DOCTYPE html>
<html>

<head>
    <title>Liste der Hersteller von Beleuchtungsartikeln - Cristalensi Verkauf von Lampen</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Hier finden Sie eine Liste sämtlicher Hersteller von Beleuchtung Artikeln, die unser Geschaft beliefern, Cristalensi Verkauf von Lampen.">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Hier finden Sie eine Liste sämtlicher Hersteller von Beleuchtung Artikeln, die unser Geschaft beliefern, Cristalensi Verkauf von Lampen.">
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
    <link rel="stylesheet" type="text/css" href="stylesheets/customization.css" shim-shadowdom>
    <link rel="stylesheet" type="text/css" href="stylesheets/camera.css" shim-shadowdom>
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
    <!--#include file="inc_header_1.asp"-->
    <!--#include file="inc_header_2.asp"-->
    <div class="container content">
        <div class="col-md-12">
            <div class="row top-buffer">
                <div class="col-xl-12 clearfix">
                    <h1 class="slogan">Liste der Hersteller von Beleuchtungsartikeln</h1>
                </div>
                <p class="description">
                  Hier finden Sie eine Liste samtlicher Hersteller von Beleuchtungsartikeln, die unser Geschaft beliefern.
Nachdem Sie einen Hersteller ausgewahlt haben, konnen Sie seine gesamte Produktpalette ansehen und von dort haben Sie dann Zugriff auf die entsprechende Produkttafel und konnen den Artikel kaufen. Wenn Sie einen bestimmten Artikel von einem Hersteller wunschen, diesen aber nicht in der Produktpalette finden, setzen Sie sich bitte mit unseren Mitarbeitern in Verbindung, die Ihnen gerne mit Informationen und einem Kostenvoranschlag behilflich sind: in unserem Internet- Katalog sind nicht samtliche Artikel von allen Herstellern vorhanden, wir haben eine Auswahl aus den einzelnen Katalogen der Hersteller getroffen.
                </p>
                <p>&nbsp;</p>
                <%
                Set prod_rs = Server.CreateObject("ADODB.Recordset")
  							sql = "SELECT * FROM Produttori ORDER BY Titolo ASC"
  							prod_rs.open sql,conn, 1, 1
  							if prod_rs.recordcount>0 then
                %>
                <%
                Do while not prod_rs.EOF

                id=prod_rs("PkId")
                titolo=prod_rs("titolo")
                descrizione=prod_rs("descrizione")
                file_img=NoLettAcc(prod_rs("logo"))
                'link=prod_rs("prodotti")

                'url="https://www.cristalensi.it/prodotti.asp?FkProduttore="&id
                url="/lichtmarken/"&ConvertiTitoloInUrlProduttore(Titolo, Id)
  							%>
                <div class="col-xs-4 col-sm-3 col-md-2 col-lg-2">
                  <article class="col-item">
                      <div class="photo">
                          <a href="<%=url%>" class="prod-img-replace" style="background-image: url(https://www.cristalensi.it/public/<%=file_img%>)" title="<%=titolo%>"><img alt="<%=titolo%>" src="/images/blank.png"></a>
                      </div>
                      <div class="info">
                          <div class="row">
                              <div class="price-details col-md-6">
                                  <a href="<%=url%>" title="<%=titolo%>"><h3><%=titolo%></h3></a>
                              </div>
                          </div>

                          <div class="clearfix"></div>
                      </div>
                  </article>
                </div>
                <%
                prod_rs.movenext
                loop
                end if
                prod_rs.close
                %>
            </div>

        </div>
    </div>
    <!--#include file="inc_footer.asp"-->
    <script type='text/javascript' src='javascripts/camera.js'></script>
    <script type='text/javascript' src='javascripts/jquery.easing.1.3.js'></script>
    <script>
		jQuery(function(){

			jQuery('#slider').camera({
                height: '55%',
	            pagination: false,
				thumbnails: false,
                autoadvance: true,
                time: 5
			});
		});
	</script>
</body>
<!--#include file="inc_strClose.asp"-->

<!--#include virtual="/inc_strConn.asp"-->
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Lampengeschäft von Florenz, Produkte für Innenbeleuchtung und Außenbeleuchtung</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Cristalensi, ein Lampengeschäft in der Nähe von Florenz, verkauft Produkte für die Innenbeleuchtung, Außenbeleuchtung, Hängeleuchten, Stehlampen, Deckenleuchten, Außenleuchten, Ventilatoren, Kinderzimmerlampen und Badezimmerleuchten, Produkte in verschiedenen Stilrichtungen vom Modernen bis zum Klassischen.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Cristalensi, ein Lampengeschäft in der Nähe von Florenz, verkauft Produkte für die Innenbeleuchtung, Außenbeleuchtung, Hängeleuchten, Stehlampen, Deckenleuchten, Außenleuchten, Ventilatoren, Kinderzimmerlampen und Badezimmerleuchten, Produkte in verschiedenen Stilrichtungen vom Modernen bis zum Klassischen.">
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
    <link href="/stylesheets/jquery.fancybox.min.css" media="screen" rel="stylesheet" type="text/css">
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
            <!--#include virtual="/de/inc_slider.asp"-->
            <div class="row top-buffer">
                <div class="col-md-8">
                    <h1 class="slogan">Seit über 50 Jahren steht der Name Cristalensi für Beleuchtung<br />Lampengeschäft von Florenz</h1>
                    <p class="main-description">
                      Seit über 50 Jahren hat unser renommiertes Lampengeschäft nur ein Ziel: Unseren Kunden eine grosszügige und erlesene Produktauswahl anzubieten, die sämtliche Wünsche der Innen- und Außenbeleuchtung sowohl im klassischen als auch im modernen Stil erfüllt. Halogenlampen, Deckenleuchten, Wandleuchten, Tischlampen, Strahler, Spots und Energiesparlampen machen eine gute Figur im Ausstellungsraum unserer Firma.<br><br>
                                Dank unserer privilegierten Position (zwischen Florenz, Pisa und Siena: sehen Sie auf der Karte nach) und unserem grossen Parkplatz, bietet unser Lampengeschäft Ihnen die Möglichkeit unseren Showroom in aller Ruhe zu besichtigen.<br><br>
                                Schwimmbäder, Parkanlagen und Gärten erhalten ein besonderes Ambiente, dank raffinierter Licht- und Schattenspiele, die von Technikexperten für die Montage der Außenbeleuchtung geschaffen werden: die Firma Cristalensi bietet ihrer Kundschaft einen Rundumservice an: wir machen Ihnen einen kostenlosen Kostenvoranschlag, schicken Sie uns Fotos des zu beleuchtenden Ambientes.
                    </p>
                </div>
                <%
                Set com_rs = Server.CreateObject("ADODB.Recordset")
                sql = "SELECT TOP 3 * FROM Commenti_Clienti WHERE Pubblicato=1 ORDER BY PkId DESC"
                com_rs.open sql,conn, 1, 1
                if com_rs.recordcount>0 then
                %>
                <div class="col-md-4 ">
                    <div class="panel panel-default user-comment">
                        <!-- Default panel contents -->
                        <div class="panel-heading">
                            <h5><i class="fa fa-users"></i> Bewertungen...</h5>
                        </div>
                        <ul class="list-group">
                            <%Do While not com_rs.EOF%>
                            <li class="list-group-item"><i class="fa fa-user"></i> <em><%=Left(NoHTML(com_rs("Testo")), 90)%>... Bewertung: <%=com_rs("Valutazione")%>/5</em></li>
                            <%
                            com_rs.movenext
            								loop
                            %>
                        </ul>
                        <div class="panel-footer"><a href="/de/commenti_elenco.asp" class="btn btn-default">Lesen Sie alle Bewertungen <i class="fa fa-chevron-right"></i></a></div>
                    </div>
                </div>
                <%
                end if
                com_rs.close
                %>
            </div>
            <div class="row top-buffer">
                <div class="col-xl-12 clearfix">
                    <h4 class="subtitle pull-left"><div class="dot"></div><span>Showroom-Fotos</span></h4>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/5.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/5.jpg)" title="Shop lighting - Entry and parking"><img alt="Shop lighting - Entry and parking" src="/images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/6.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/6.jpg)" title="Shop lighting - Staff"><img alt="Shop lighting - Staff" src="/images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/1.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/1.jpg)" title="Shop chandeliers - Overview"><img alt="Shop chandeliers - Overview" src="/images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/2.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/2.jpg)" title="Shop chandeliers in Florence - Overview"><img alt="Shop chandeliers in Florence - Overview" src="/images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/3.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/3.jpg)" title="Shop rustic lamps"><img alt="Shop rustic lamps" src="/images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/4.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/4.jpg)" title="Shop crystal chandeliers"><img alt="Shop crystal chandeliers" src="/images/blank.png"></a>
                        </div>
                    </article>
                </div>


                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/10.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/10.jpg)" title="Shop modern chandeliers"><img alt="Shop modern chandeliers" src="/images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/11.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/11.jpg)" title="Shop fans with lights"><img alt="Shop fans with lights" src="/images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/13.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/13.jpg)" title="Shop lighting - Overview"><img alt="Shop lighting - Overview" src="/images/blank.png"></a>
                        </div>
                    </article>
                </div>

                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/8.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/8.jpg)" title="Shop lamps - Overview"><img alt="Shop lamps - Overview" src="/images/blank.png"></a>
                        </div>
                    </article>
                </div>

                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/15.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/15.jpg)" title="Shop Lighting Outdoor"><img alt="Shop Lighting Outdoor" src="/images/blank.png"></a>
                        </div>
                    </article>
                </div>

                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/16.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/16.jpg)" title="Shop Lighting Outdoor"><img alt="Shop Lighting Outdoor" src="/images/blank.png"></a>
                        </div>
                    </article>
                </div>

            </div>


        </div>
    </div>
    <!--#include virtual="/de/inc_footer.asp"-->
  <script type='text/javascript' src='/javascripts/camera.min.js'></script>
  <script type='text/javascript' src='/javascripts/jquery.easing.1.3.min.js'></script>
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
<!--#include virtual="/inc_strClose.asp"-->

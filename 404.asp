<!--#include virtual="inc_strConn.asp"-->
<!DOCTYPE html>
<html>

<head>
    <title>Page 404 - CRISTALENSI online store lamps</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="This page doesn't exist on Cristalensi, Cristalensi is an ecommerce about lights">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="This page doesn't exist on Cristalensi, Cristalensi is an ecommerce about lights">
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="apple-touch-icon-57x57.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="apple-touch-icon-114x114.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="apple-touch-icon-72x72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="apple-touch-icon-144x144.png" />
    <link rel="apple-touch-icon-precomposed" sizes="60x60" href="apple-touch-icon-60x60.png" />
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="apple-touch-icon-120x120.png" />
    <link rel="apple-touch-icon-precomposed" sizes="76x76" href="apple-touch-icon-76x76.png" />
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="apple-touch-icon-152x152.png" />
    <link rel="icon" type="image/png" href="favicon-196x196.png" sizes="196x196" />
    <link rel="icon" type="image/png" href="favicon-96x96.png" sizes="96x96" />
    <link rel="icon" type="image/png" href="favicon-32x32.png" sizes="32x32" />
    <link rel="icon" type="image/png" href="favicon-16x16.png" sizes="16x16" />
    <link rel="icon" type="image/png" href="favicon-128.png" sizes="128x128" />
    <meta name="application-name" content="&nbsp;"/>
    <meta name="msapplication-TileColor" content="#FFFFFF" />
    <meta name="msapplication-TileImage" content="mstile-144x144.png" />
    <meta name="msapplication-square70x70logo" content="mstile-70x70.png" />
    <meta name="msapplication-square150x150logo" content="mstile-150x150.png" />
    <meta name="msapplication-wide310x150logo" content="mstile-310x150.png" />
    <meta name="msapplication-square310x310logo" content="mstile-310x310.png" />

    <link href="/stylesheets/styles.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/stylesheets/customization.css" shim-shadowdom>
    <link rel="stylesheet" type="text/css" href="/stylesheets/camera.css" shim-shadowdom>
    <!--[if lt IE 9]><script src="javascripts/html5shiv.js"></script><![endif]-->
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,400i,500,600,700" rel="stylesheet">
    <!--#include virtual="/inc_funzioni_head.asp"-->
    <link rel="canonical" href="https://www.cristalensi.it/404.asp"/>
</head>

<body>
    <!--#include virtual="inc_header_1.asp"-->
    <!--#include virtual="inc_header_2.asp"-->
    <div class="container content">
        <div class="col-md-12">
            <!--#include virtual="inc_slider.asp"-->
            <div class="row top-buffer" itemscope itemtype="http://schema.org/WebSite">
              <link itemprop="url" href="https://www.cristalensi.it/"/>
                <div class="col-md-8">
                    <h1 class="slogan">This page doesn't exist on Cristalensi</h1>
                    <p class="main-description">
                      The page you were looking for has been deleted or modified and is now present at another address. <br /> You can continue browsing starting from the main categories or search by entering the name or product code, or by contacting our staff.<br /> We apologize for the inconvenience, thanks anyway for visiting us. <br /> Best regards from the Cristalensi staff.
                    </p>
                </div>
                <%
                Set com_rs = Server.CreateObject("ADODB.Recordset")
                sql = "SELECT TOP 3 * FROM Commenti_Clienti WHERE Pubblicato=1 ORDER BY PkId DESC"
                com_rs.open sql,conn, 1, 1
                if com_rs.recordcount>0 then
                %>
                <div class="col-md-4 ">
                    <div class="panel panel-default user-comment" itemprop="review" itemscope itemtype="http://schema.org/Review">
                        <!-- Default panel contents -->
                        <div class="panel-heading">
                            <h5><i class="fa fa-users"></i> Dicono di noi...</h5>
                        </div>
                        <ul class="list-group">
                            <%Do While not com_rs.EOF%>
                            <%
                            Set cr_rs = Server.CreateObject("ADODB.Recordset")
                            sql = "SELECT PkId, Nome FROM Clienti WHERE PkId="&com_rs("FkIscritto")
                            cr_rs.open sql,conn, 1, 1
                            if cr_rs.recordcount>0 then
                              NomeIscritto=cr_rs("Nome")
                            end if
                            cr_rs.close
                            %>
                            <li class="list-group-item"><i class="fa fa-user"></i> <em><span itemprop="description"><%=Left(NoHTML(com_rs("Testo")), 90)%>...</span><span itemprop="author" style="display: none;"><%=NomeIscritto%></span> <span itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">Voto: <meta itemprop="worstRating" content = "1"><span itemprop="ratingValue"><%=com_rs("Valutazione")%></span>/<span itemprop="bestRating">5</span></span></em></li>
                            <%
                            com_rs.movenext
            								loop
                            %>
                        </ul>
                        <div class="panel-footer"><a href="commenti_elenco.asp" class="btn btn-default">leggi tutti i commenti <i class="fa fa-chevron-right"></i></a></div>
                    </div>
                </div>
                <%
                end if
                com_rs.close
                %>
            </div>
            <div class="row top-buffer">
                <!--<div class="col-xl-12 clearfix">
                    <h4 class="subtitle"><div class="dot"></div><span>What lamp are you looking for?</span></h4>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/interior-exterior-lighting/1ng-indoor-lighting.asp" class="prod-img-replace" style="background-image: url(https://www.cristalensi.it/images/home-lampade-da-interno.jpg)" title="Indoor Lighting and Interior Lamps"><img alt="Indoor lighting" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="/interior-exterior-lighting/1ng-indoor-lighting.asp" title="Indoor Lighting and Interior Lamps"><h3>Indoor lighting</h3></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/interior-exterior-lighting/2ng-outdoor-lighting.asp" class="prod-img-replace" style="background-image: url(https://www.cristalensi.it/images/home-lampade-da-esterno.jpg)" title="Outdoor Lighting and Exterior Lamps"><img alt="Outdoor Lighting" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="/interior-exterior-lighting/2ng-outdoor-lighting.asp" title="Outdoor Lighting and Exterior Lamps"><h3>Outdoor Lighting</h3></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/interior-exterior-lighting/3ng-cooling-fans.asp" class="prod-img-replace" style="background-image: url(https://www.cristalensi.it/images/home-ventilatori.jpg)" title="Cooling fans"><img alt="Cooling fans" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="/interior-exterior-lighting/3ng-cooling-fans.asp" title="Cooling fans"><h3>Cooling fans</h3></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/interior-exterior-lighting/4ng-light-bulbs.asp" class="prod-img-replace" style="background-image: url(https://www.cristalensi.it/images/home-lampadine.jpg)" title="Light bulbs, Drivers and Led Strip Bar"><img alt="Lampadine" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="/interior-exterior-lighting/4ng-light-bulbs.asp" title="Light bulbs, Drivers and Led Strip Bar"><h3>Light bulbs, Drivers and Led Strip Bar</h3></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>-->
            </div>

        </div>
    </div>
    <!--#include virtual="inc_footer.asp"-->
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
<!--#include virtual="inc_strClose.asp"-->

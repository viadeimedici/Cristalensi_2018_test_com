<!--#include virtual="/inc_strConn.asp"-->
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Video lighting products CRISTALENSI</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Video installation of lamps, fans, lamps and other lighting products. Video of productions and presentations of articles of our e-commerce.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Video installation of lamps, fans, lamps and other lighting products. Video of productions and presentations of articles of our e-commerce.">
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
    <link href="/stylesheets/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css">
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
    <!--#include virtual="/inc_header_1.asp"-->
    <!--#include virtual="/inc_header_2.asp"-->
    <div class="container content">
        <div class="col-md-12">
            <!--#include virtual="/inc_slider.asp"-->
            <div class="row top-buffer">
                <div class="col-md-8">
                    <h1 class="slogan">Video lighting products</h1>
                    <p class="main-description">
                      Here are some videos created by us or supplied by manufacturers of lighting products that are on sale in our e-commerce. Display installations fans, installation of lamps, fittings and new product introductions. You can also connect to our channel on YouTube or the official Facebook page where you'll find articles and advice.
<br />Connect immediately so as to receive the new content that will get in the future.
                      <br /><br />
                      <a href="https://www.youtube.com/channel/UCsP3WTO0PryxgRq6OymSfpA" target="_blank" title="Cristalensi Official YouTube Channel"><img style="width:150px;padding:10px;text-align:right;" src="https://www.cristalensi.it/images/youtube.png" border="0" alt="Cristalensi Official YouTube Channel" /></a>
                      <a href="https://www.facebook.com/CristalensiLampadari/" target="_blank" title="Cristalensi Official Facebook page"><img style="width:150px;padding:10px;text-align:right;" src="https://www.cristalensi.it/images/facebook.png" border="0" alt="Cristalensi Official Facebook page" /></a>
                    </p>
                      <h4 class="title">Cristalensi shows the series Kelly of Studio Italia Design</h4>
                      <iframe width="560" height="315" src="https://www.youtube.com/embed/v2m1O2lP9Ys" frameborder="0" allowfullscreen></iframe>

                      <h4 class="title">Outdoor lighting - Cristalensi and Linea Light</h4>
                      <iframe width="560" height="315" src="https://www.youtube.com/embed/5yyBJla-U1Q" frameborder="0" allowfullscreen></iframe>

                      <h4 class="title">How to assemble Moonflower of Linea Light</h4>
                      <iframe width="560" height="315" src="https://www.youtube.com/embed/NcstM9ILcsA" frameborder="0" allowfullscreen></iframe>

                      <h4 class="title">Cristalensi and Studio Italia Design show "Nostalgia"</h4>
                      <iframe width="560" height="315" src="https://www.youtube.com/embed/bPqKfhgVHE4" frameborder="0" allowfullscreen></iframe>

                      <h4 class="title">A selection of Light4 products</h4>
                      <iframe width="560" height="315" src="https://www.youtube.com/embed/QO5W6Vhu8xY" frameborder="0" allowfullscreen></iframe>

                      <h4 class="title">How to install a ceiling fan</h4>
                      <iframe width="560" height="315" src="https://www.youtube.com/embed/6QC0Aw8NnPE" frameborder="0" allowfullscreen></iframe>
                </div>

                <%
                Set com_rs = Server.CreateObject("ADODB.Recordset")
                sql = "SELECT TOP 5 * FROM Commenti_Clienti WHERE Pubblicato=1 ORDER BY PkId DESC"
                com_rs.open sql,conn, 1, 1
                if com_rs.recordcount>0 then
                %>
                <div class="col-md-4 ">
                    <div class="panel panel-default user-comment">
                        <!-- Default panel contents -->
                        <div class="panel-heading">
                            <h5><i class="fa fa-users"></i> Reviews...</h5>
                        </div>
                        <ul class="list-group">
                            <%Do While not com_rs.EOF%>
                            <li class="list-group-item"><i class="fa fa-user"></i> <em><%=Left(NoHTML(com_rs("Testo")), 90)%>... Vote: <%=com_rs("Valutazione")%>/5</em></li>
                            <%
                            com_rs.movenext
            								loop
                            %>
                        </ul>
                        <div class="panel-footer"><a href="commenti_elenco.asp" class="btn btn-default">Read all reviews <i class="fa fa-chevron-right"></i></a></div>
                    </div>
                </div>
                <%
                end if
                com_rs.close
                %>
                <div class="col-md-4 ">
                <!--#include virtual="/inc_box_contatti.asp"-->
                </div>
            </div>


        </div>
    </div>
    <!--#include virtual="/inc_footer.asp"-->
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
<!--#include virtual="/inc_strClose.asp"-->

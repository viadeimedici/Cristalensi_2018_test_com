<!--#include virtual="/inc_strConn.asp"-->
<%
	order=request("order")
	if order="" then order=3
	if order=1 then ordine="Titolo_de ASC"
	if order=2 then ordine="Titolo_de DESC"
	if order=3 then ordine="prezzoprodotto ASC"
	if order=4 then ordine="prezzoprodotto DESC"
%>
<!DOCTYPE html>
<html>

<head>
		<meta charset="utf-8">
		<title>Angebote von Beleuchtungsprodukten und Kronleuchter im Angebot: Cristalensi Verkauf von Lampen im Angebot</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Die besten Angebote für Beleuchtungsprodukte, Kronleuchter im Angebot: bei Cristalensi finden Sie Lampen im Angebot.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Die besten Angebote für Beleuchtungsprodukte, Kronleuchter im Angebot: bei Cristalensi finden Sie Lampen im Angebot.">
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
    <style type="text/css">
        .clearfix:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
    </style>
    <link rel="canonical" href="https://www.cristalensi.com/<%=toUrl%>"/>
		<!--#include virtual="/de/inc_funzioni_head.asp"-->
</head>

<body>
    <!--#include virtual="/de/inc_header_1.asp"-->
    <!--#include virtual="/de/inc_header_2.asp"-->
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-xl-12">
            <ol class="breadcrumb">
                <li><a href="/"><i class="fa fa-home"></i></a></li>
                <li class="active">Angebote</li>
            </ol>
            <h1 class="title">Beleuchtungsprodukte im Angebot</h1>
            <p class="description">
							Auf dieser Seite finden Sie sämtliche Angebote unserer Beleuchtungsprodukte: dies sind Produkte aus unserem Katalog zu absolut unschlagbaren Preisen.
							Jedes Produkt hat seine eigene detaillierte Produktbeschreibung. Sie brauchen nur auf den Namen oder das Foto zu klicken, schon erhalten Sie diese Information.
Wenn Sie sich hingegen den ganzen Katalog anschauen möchten, können Sie entweder klicken auch eine Kategorie oder einen Hersteller direkt aus dem Menu.
            </p>
        </div>
        <div class="col-md-3">
            <div class=" top-buffer">
                <nav class="navbar">
                    <!-- menu - normal collapsible navbar markup -->
                    <%
                    Set tip_rs = Server.CreateObject("ADODB.Recordset")
                    sql = "SELECT * FROM NewGruppi ORDER BY Posizione ASC"
                    tip_rs.open sql,conn, 1, 1
                    if tip_rs.recordcount>0 then
                    %>
                    <ul class="list-unstyled side-list">
                        <%
                        Do While not tip_rs.EOF
                          Titolo_1=tip_rs("Titolo_1_de")
                          Titolo_2=tip_rs("Titolo_2_de")
                          Url=tip_rs("Url_de")
                          Title=tip_rs("Title_de")
                          'Description=tip_rs("Description")
                          'Descrizione=tip_rs("Descrizione")
                        %>
                        <li><a href="/lampen-innenbeleuchtung-aussenbeleuchtung/<%=Url%>" title="<%=Titolo_2%>"><%=Titolo_1%></a></li>
                        <%
                        tip_rs.movenext
                        loop
                        %>
                    </ul>
                    <%
                    end if
                    tip_rs.close
                    %>
                </nav>
            </div>
        </div>
        <div class="col-md-9">
            <div class="row top-buffer">
                <%
                Set prod_rs = Server.CreateObject("ADODB.Recordset")
                sql = "SELECT * FROM Prodotti WHERE Offerta=1 or Offerta=2 ORDER BY "&ordine&""
                prod_rs.open sql,conn, 1, 1
                if prod_rs.recordcount>0 then

                %>
                <div class="col-xs-12">
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="#">Geordnet:</a>
                            </div>
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <p class="navbar-text">preisen</p>
                                <ul class="nav navbar-nav">
                                    <li <%if order=3 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="/de/offerte.asp?order=3"><i class="glyphicon glyphicon-eur"></i> - </a></li>
                                    <li <%if order=4 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="/de/offerte.asp?order=4"><i class="glyphicon glyphicon-eur"></i> + </a></li>
                                </ul>
                                <p class="navbar-text">alphabetisch</p>
                                <ul class="nav navbar-nav">
                                    <li <%if order=1 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="/de/offerte.asp?order=1">A/Z</a></li>
                                    <li <%if order=2 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="/de/offerte.asp?order=2">Z/A</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
                <%
                Do while not prod_rs.EOF

                  id=prod_rs("pkid")
                  titolo_prodotto=prod_rs("titolo_de")
                  NomePagina=prod_rs("NomePagina_de")
                  if Len(NomePagina)>0 then
                    NomePagina="public/pagine/"&NomePagina
                    'NomePagina="/public/pagine/scheda_prodotto.asp?id="&id
                  else
                    NomePagina="#"
                  end if
                  codicearticolo=prod_rs("codicearticolo")
                  prezzoarticolo=prod_rs("PrezzoProdotto")
                  prezzolistino=prod_rs("PrezzoListino")

                    fkproduttore_pr=prod_rs("fkproduttore")
                    if fkproduttore_pr="" then fkproduttore_pr=0

                    if fkproduttore_pr>0 then
                      Set pr_rs = Server.CreateObject("ADODB.Recordset")
                      sql = "SELECT * FROM Produttori WHERE PkId="&fkproduttore_pr&""
                      pr_rs.open sql,conn, 1, 1
                      if pr_rs.recordcount>0 then
                        produttore=pr_rs("titolo")
												url_produttore="/lichtmarken/"&ConvertiTitoloInUrlProduttore(produttore, fkproduttore_pr)
                      end if
                      pr_rs.close
                    end if

                    Set img_rs = Server.CreateObject("ADODB.Recordset")
                    sql = "SELECT * FROM Immagini WHERE Record="&id&" AND Tabella='Prodotti' Order by PkId_Contatore ASC"
                    img_rs.open sql,conn, 1, 1

                    if img_rs.recordcount>0 then
                      tot_img=img_rs.recordcount
                      titolo_img=img_rs("titolo")
                      file_img=NoLettAcc(img_rs("file"))
                    end if
                    img_rs.close
                %>
                <div class="col-xs-12 col-sm-4 col-md-4">
                  <article class="col-item">
                      <div class="photo">
                          <a href="/<%=NomePagina%>" class="prod-img-replace" style="background-image: url(https://www.cristalensi.it/public/<%=file_img%>)" title="<%=titolo_prodotto%>"><img alt="<%=titolo_prodotto%>" src="/images/blank.png"></a>
                      </div>
                      <div class="info">
                          <div class="row">
                              <div class="price-details col-md-6">
                                  <a href="/<%=NomePagina%>" title="<%=titolo_prodotto%>"><h3><%=titolo_prodotto%></h3></a>
                                  <p class="details"><span>code: <b><%=codicearticolo%></b></span><span>marke: <b><a href="<%=url_produttore%>"><%=produttore%></a></b></span></p>
                                  <div class="price-box separator">
                                      <%if prezzoarticolo<>0 then%>
                                        <span class="price-new"><i class="fa fa-tag"></i>&nbsp;<%=prezzoarticolo%> &euro;</span><br />
                                        <%if prezzolistino<>0 then%><span class="price-old">statt <b><%=prezzolistino%> &euro;</b></span><%else%>&nbsp;<%end if%>
                                      <%else%>
                                        <span class="price-new">&nbsp;<br /></span>
                                        <span class="price-old">Preis: <b><%=prezzolistino%> &euro;</b></span>
                                      <%end if%>
                                  </div>
                              </div>
                          </div>
													<div class="separator clear-left clearfix">
                              <p class="btn-add">
                                  <a href="/de/preferiti.asp?id=<%=id%>" rel="nofollow" class="hidden-lg" data-toggle="tooltip" data-placement="top" title="Zur Wunschliste hinzufügen"><i class="fa fa-heart"></i></a>
                              </p>
                              <p class="btn-details">
                                  <a href="/<%=NomePagina%>" class="hidden-lg" data-toggle="tooltip" data-placement="top" title="Siehe die Details und In den Warenkorb">details <i class="fa fa-chevron-right"></i></a>
                              </p>
                          </div>
                          <div class=""></div>
                      </div>
                  </article>
                </div>
                <%
                prod_rs.movenext
                loop
                %>

            </div>

            <%
            end if
            prod_rs.close
            %>
        </div>
    </div>
    <!--#include virtual="/de/inc_footer.asp"-->
</body>
<!--#include virtual="/inc_strClose.asp"-->

<!--#include virtual="/inc_strConn.asp"-->
<%
	order=request("order")
	if order="" then order=3
	if order=1 then ordine="Titolo_EN ASC"
	if order=2 then ordine="Titolo_EN DESC"
	if order=3 then ordine="prezzoprodotto ASC"
	if order=4 then ordine="prezzoprodotto DESC"
%>
<!DOCTYPE html>
<html>

<head>
    <title>New products lighting novelties chandeliers lamps online store</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Would you like to know what are the new chandelier, new products for lighting? Cristalensi has a very large catalog:  modern chandeliers and Led suspended lamps, ceiling lamps, wall lamps, applique and floor lamps.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Would you like to know what are the new chandelier, new products for lighting? Cristalensi has a very large catalog:  modern chandeliers and Led suspended lamps, ceiling lamps, wall lamps, applique and floor lamps.">
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
    <link rel="canonical" href="https://www.cristalensi.it/<%=toUrl%>"/>
		<!--#include virtual="/inc_funzioni_head.asp"-->
</head>

<body>
    <!--#include virtual="/inc_header_1.asp"-->
    <!--#include virtual="/inc_header_2.asp"-->
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-xl-12">
            <ol class="breadcrumb">
                <li><a href="/"><i class="fa fa-home"></i></a></li>
                <li class="active">New products lighting</li>
            </ol>
            <h1 class="title">New products lighting</h1>
            <p class="description">
							Here we show you our products by entering in our catalog, so you could find new items or companies that recently have been included in our online store. You can choose between suspended lights, ceiling lights, wall lights and floor lights. Moreover, we offer you new products and innovations for LED pendant lamps, LED ceiling lamps and LED wall lamps: all interior products suitable for both living rooms, kitchens, bedrooms, hallways, studies and other types of interiors.
Items with elegant design by leading brands and manufacturers, but also products at affordable prices for all needs.
            </p>
        </div>
        <div class="col-md-3">
            <div class=" top-buffer">
                <nav class="navbar">
                    <!-- menu - normal collapsible navbar markup -->
                    <ul class="list-unstyled side-list">
                        <li><a href="/interior-exterior-lighting/1-new-suspended-lights.asp" title="New suspended lights - Chandeliers">Suspended lights</a></li>
												<li><a href="/interior-exterior-lighting/2-new-ceiling-lights.asp" title="New ceiling lights - Overhead lamps">Ceiling lights</a></li>
												<li><a href="/interior-exterior-lighting/3-new-wall-lamps.asp" title="New wall lamps">Wall lamps</a></li>
												<li><a href="/interior-exterior-lighting/4-new-floor-lights.asp" title="New floor lights">Floor lights</a></li>
												<li><a href="/interior-exterior-lighting/5-new-table-lights.asp" title="New table lights">Table lights</a></li>
												<li><a href="/interior-exterior-lighting/10-new-outdoor-lamps.asp" title="New outdoor lamps">Outdoor lamps</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="col-md-9">
            <div class="row top-buffer">
                <%
                Set prod_rs = Server.CreateObject("ADODB.Recordset")
                sql = "SELECT TOP 60 * FROM Prodotti WHERE ((Offerta=0 or Offerta=2) AND (Len(Titolo_EN)>0)) ORDER BY PkId DESC"
                prod_rs.open sql,conn, 1, 1
                if prod_rs.recordcount>0 then

                %>

                <%
                Do while not prod_rs.EOF

                  id=prod_rs("pkid")
                  titolo_prodotto=prod_rs("titolo_en")
                  NomePagina=prod_rs("NomePagina_en")
                  if Len(NomePagina)>0 then
                    NomePagina="public/pagine/"&NomePagina
                    'NomePagina="/public/pagine/scheda_prodotto.asp?id="&id
                  else
                    NomePagina="#"
                  end if
                  codicearticolo=prod_rs("codicearticolo")
                  prezzoarticolo=prod_rs("PrezzoProdotto")
                  prezzolistino=prod_rs("PrezzoListino")

									prezzoprodottosoloclienti=prod_rs("PrezzoProdottoSoloClienti")
                  if prezzoprodottosoloclienti=True THEN
                    prezzoprodottosoloclienti="si"
                  Else
                    prezzoprodottosoloclienti="no"
                  end if

                    fkproduttore_pr=prod_rs("fkproduttore")
                    if fkproduttore_pr="" then fkproduttore_pr=0

                    if fkproduttore_pr>0 then
                      Set pr_rs = Server.CreateObject("ADODB.Recordset")
                      sql = "SELECT * FROM Produttori WHERE PkId="&fkproduttore_pr&""
                      pr_rs.open sql,conn, 1, 1
                      if pr_rs.recordcount>0 then
                        produttore=pr_rs("titolo")
												url_produttore="/lighting-brands/"&ConvertiTitoloInUrlProduttore(produttore, fkproduttore_pr)
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
                                  <p class="details"><span>code: <b><%=codicearticolo%></b></span><span>brand: <b><a href="<%=url_produttore%>"><%=produttore%></a></b></span></p>
                                  <div class="price-box separator">
																		<%if prezzoarticolo<>0 then%>
																			<%if idsession=0 and prezzoprodottosoloclienti="si" then%>
																				<em><span class="price-new" style="color: #000;">DISCOUNT FOR CLIENTS</span></em><br />
																				<%if prezzolistino<>0 then%><span class="price-old">Price: <b><%=prezzolistino%> &euro;</b></span><%else%>&nbsp;<%end if%>
																			<%else%>
																				<span class="price-new"><i class="fa fa-tag"></i>&nbsp;<%=prezzoarticolo%> &euro;</span><br />
																				<%if prezzolistino<>0 then%><span class="price-old">instead of <b><%=prezzolistino%> &euro;</b></span><%else%>&nbsp;<%end if%>
																			<%end if%>
																		<%else%>
																			<span class="price-new">&nbsp;<br /></span>
																			<%if prezzolistino<>0 then%><span class="price-old">Price: <b><%=prezzolistino%> &euro;</b></span><%else%>&nbsp;<%end if%>
																		<%end if%>
                                  </div>
                              </div>
                          </div>
                          <div class="separator clear-left clearfix">
                              <p class="btn-add">
                                  <a href="/preferiti.asp?id=<%=id%>" rel="nofollow" class="hidden-lg" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><i class="fa fa-heart"></i></a>
                              </p>
                              <p class="btn-details">
                                  <a href="/<%=NomePagina%>" class="hidden-lg" data-toggle="tooltip" data-placement="top" title="See the details and Add to cart">details <i class="fa fa-chevron-right"></i></a>
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
    <!--#include virtual="/inc_footer.asp"-->
</body>
<!--#include virtual="/inc_strClose.asp"-->

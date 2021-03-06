<!--#include virtual="/inc_strConn.asp"-->
<%
Function CleanStr(sTesto)
	If Len(sTesto)>0 Then
		sTesto = Replace(sTesto,"'","")
		stesto = replace(sTesto, "*", "")
		stesto = replace(sTesto, "%", "")
		stesto = replace(sTesto, "=", "")
		stesto = replace(sTesto, "&", "")
		stesto = LTrim(sTesto)

	End If
	CleanStr=sTesto
End Function

titolo=CleanStr(request("testo_ricerca"))

cat=request("cat")
if cat="" then cat=0

FkProduttore=request("FkProduttore")
if FkProduttore="" then FkProduttore=0

if FkProduttore>0 then
	Set cs=Server.CreateObject("ADODB.Recordset")
	sql = "Select * From Produttori where PkId="&FkProduttore&" order by titolo ASC"
	cs.Open sql, conn, 1, 1
	if cs.recordcount>0 then
		produttore=cs("Titolo")
	end if
	cs.close
end if


prezzo_da=CleanStr(request("prezzo_da"))
if prezzo_da="" then prezzo_da=0

prezzo_a=CleanStr(request("prezzo_a"))
if prezzo_a="" then prezzo_a=0

p=request("p")
if p="" then p=1

order=request("order")
if order="" then order=1

if cat>0 then
Set cs=Server.CreateObject("ADODB.Recordset")
sql = "SELECT Categorie1.PkId as PkId_1, Categorie1.Titolo_EN as Titolo_1, Categorie2.PkId as PkId_2, Categorie2.Titolo_EN as Titolo_2 "
sql = sql + "FROM Categorie1 INNER JOIN Categorie2 ON Categorie1.PkId = Categorie2.Fkcategoria1 "
sql = sql + "WHERE Categorie2.PkId = "&cat&" "
sql = sql + "ORDER BY Categorie1.Titolo_EN ASC, Categorie2.Titolo_EN ASC"
cs.Open sql, conn, 1, 1
if cs.recordcount>0 then
	title=cs("Titolo_1") & " " & cs("Titolo_2")
end if
cs.close
end if
%>
<!DOCTYPE html>
<html>

<head>
    <title><%if cat>0 then%>Ricerca<%if titolo<>"" then%><%=" "&titolo&" "%><%end if%><%=" "&title%><%if produttore<>"" then%><%=" "&produttore&" "%><%end if%> lighting articles<%else%>Search<%=" "&titolo%><%if produttore<>"" then%><%=" "&produttore&" "%><%end if%> outdoor lighting articles indoor lamps<%end if%></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<%if cat>0 then%>
	    <meta name="description" content="Search the Cristalensi catalog for <%=title%><%if produttore<>"" then%><%=" "&produttore&" "%><%end if%>, <%if titolo<>"" then%><%=titolo%>, <%end if%>you will find a large number of products to choose from to furnish your home, your office, the garden and all the exterior of the home">
		<%else%>
	    <meta name="description" content="Search <%if titolo<>"" then%>per <%=titolo%> <%end if%><%if produttore<>"" then%><%=" "&produttore&" "%><%end if%>in the Cristalensi catalog, showroom near Florence, sell lamps and chandeliers online, products for indoor lighting, outdoor lighting.">
	  <%end if%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="The best offers of lighting products, chandeliers on offer: from Cristalensi you will find lamps on offer.">
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
		<%if p>0 then%>
		<link rel="canonical" href="https://www.cristalensi.com/ricerca_avanzata_elenco.asp?cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&titolo=<%=titolo%>&prezzo_da=<%=prezzo_da%>&prezzo_a=<%=prezzo_a%>&order=<%=order%>"/>
		<%end if%>
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
                <li class="active">Products search</li>
            </ol>

						<%if titolo<>"" or prezzo_da<>0 or prezzo_a<>0 or title<>"" or produttore<>"" then%>
						<h1 class="title">
						Products search
						 - You searched: <%if titolo<>"" then%> <%=titolo%><%end if%><%if prezzo_da<>0 or prezzo_a<>0 then%> - Price from <%=prezzo_da%> to <%=prezzo_a%><%end if%>
						<%if title<>"" then%><br />Category: <%=title%><%end if%><%if produttore<>"" then%><br />Brand: <%=produttore%><%end if%>
						</h1>
						<%end if%>

        </div>
				<%if Len(titolo)>0 or prezzo_da<>0 or prezzo_a<>0 or Len(title)>0 or Len(produttore)>0 then%>
        <div class="col-md-3 hidden-xs">
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
                          Titolo_1=tip_rs("Titolo_1_en")
                          Titolo_2=tip_rs("Titolo_2_en")
                          Url=tip_rs("Url_en")
                          Title=tip_rs("Title_en")
                          'Description=tip_rs("Description")
                          'Descrizione=tip_rs("Descrizione")
                        %>
                        <li><a href="/interior-exterior-lighting/<%=Url%>" title="<%=Titolo_2%>"><%=Titolo_1%></a></li>
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

				<%
					'if FkProduttore>0 and order=1 then order=5

					if order=1 then ordine="Titolo_en ASC"
					if order=2 then ordine="Titolo_en DESC"
					if order=3 then ordine="PrezzoProdotto ASC, PrezzoListino ASC"
					if order=4 then ordine="PrezzoProdotto DESC, PrezzoListino DESC"

					Set prod_rs = Server.CreateObject("ADODB.Recordset")
					'if cat>0 then sql = "SELECT * FROM Prodotti WHERE (FkCategoria2="&cat&" and (Offerta=0 or Offerta=2)) ORDER BY "&ordine&""
					'if FkProduttore>0 then sql = "SELECT * FROM Prodotti WHERE (FkProduttore="&FkProduttore&" and (Offerta=0 or Offerta=2)) ORDER BY "&ordine&""
					sql = "SELECT * FROM Prodotti WHERE "
					if prezzo_da>0 or prezzo_a>0 then
						sql = sql + "((PrezzoProdotto>="&prezzo_da&" AND PrezzoProdotto<="&prezzo_a&" AND PrezzoProdotto>0) OR (PrezzoProdotto=0 AND PrezzoListino>="&prezzo_da&" AND PrezzoListino<="&prezzo_a&")) "
					else
						sql = sql + "PrezzoProdotto>=0 "
					end if
					if cat>0 then
						sql = sql + "AND FkCategoria2="&cat&" "
					end if
					if FkProduttore>0 then
						sql = sql + "AND FkProduttore="&FkProduttore&" "
					end if
					if titolo<>"" then
						sql = sql + "AND (CodiceArticolo LIKE '%"&titolo&"%' OR CodiceArticolo_Azienda LIKE '%"&titolo&"%' OR Titolo_en LIKE '%"&titolo&"%') "
					end if
					sql = sql + "AND Offerta<10 "
					sql = sql + "ORDER BY "&ordine&""
					prod_rs.open sql,conn, 1, 1

					if prod_rs.recordcount>0 then
				%>
        <div class="col-md-9">
            <div class="row top-buffer">

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
                                <a class="navbar-brand" href="#">Order by:</a>
                            </div>
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <p class="navbar-text">price</p>
                                <ul class="nav navbar-nav">
                                    <li <%if order=3 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="https://www.cristalensi.com/ricerca_avanzata_elenco.asp?cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&titolo=<%=titolo%>&prezzo_da=<%=prezzo_da%>&prezzo_a=<%=prezzo_a%>&order=3"><i class="glyphicon glyphicon-eur"></i> - </a></li>
                                    <li <%if order=4 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="https://www.cristalensi.com/ricerca_avanzata_elenco.asp?cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&titolo=<%=titolo%>&prezzo_da=<%=prezzo_da%>&prezzo_a=<%=prezzo_a%>&order=4"><i class="glyphicon glyphicon-eur"></i> + </a></li>
                                </ul>
                                <p class="navbar-text">alphabetic</p>
                                <ul class="nav navbar-nav">
                                    <li <%if order=1 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="https://www.cristalensi.com/ricerca_avanzata_elenco.asp?cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&titolo=<%=titolo%>&prezzo_da=<%=prezzo_da%>&prezzo_a=<%=prezzo_a%>&order=1">A/Z</a></li>
                                    <li <%if order=2 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="https://www.cristalensi.com/ricerca_avanzata_elenco.asp?cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&titolo=<%=titolo%>&prezzo_da=<%=prezzo_da%>&prezzo_a=<%=prezzo_a%>&order=2">Z/A</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
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
                    sql = "SELECT * FROM Immagini WHERE Record="&id&" AND Tabella='Prodotti' Order by Ordine ASC, PkId_Contatore ASC"
                    img_rs.open sql,conn, 1, 1

                    if img_rs.recordcount>0 then
                      tot_img=img_rs.recordcount
                      titolo_img=img_rs("titolo")
                      file_img=NoLettAcc(img_rs("file"))
											file_img=Replace(file_img, "&rsquo;", "")
                    end if
                    img_rs.close

										spedizionegratis=0
                    if prezzoarticolo>250 then spedizionegratis=1
                %>
                <div class="col-xs-12 col-sm-4 col-md-4">
                  <article class="col-item">
											<%if spedizionegratis=1 then%><div class="options">SPEDIZIONE<br />GRATUITA</div><%end if%>
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
            </div>


        </div>
				<%else%>
				<div class="col-md-9">
            <div class="row top-buffer">
						Currently no products are displayed on the website for the search.<br />Cristalensi has contact with many companies of lighting products, so if you know exactly one item and want to get a price quote, fill out the form indicating the name of the product and possibly some details, will contact you as soon as possible: our staff will be at your disposal for any clarification.
						<br /><a href="/contatti.asp">CONTACT US!</a>
						</div>
				</div>
				<%
				end if
				prod_rs.close
				%>
				<%end if%>
    </div>
		<div class="container content">
			<div class="col-xl-12">
					<h2 class="title">
					Advanced search
					</h2>
					<form class="form-horizontal" method="post" action="/ricerca_avanzata_elenco.asp" name="newsform">
					<div class="col-lg-6">
							<div class="form-group">
									<label for="titolo" class="col-sm-4 control-label">Name or Code of product</label>
									<div class="col-sm-8">
											<input type="text" class="form-control" id="testo_ricerca" name="testo_ricerca">
									</div>
							</div>
							<div class="form-group">
									<label for="FkProduttore" class="col-sm-4 control-label">Brand</label>
									<div class="col-sm-8">
											<%
											Set cs=Server.CreateObject("ADODB.Recordset")
											sql = "Select * From Produttori order by titolo ASC"
											cs.Open sql, conn, 1, 1
											if cs.recordcount>0 then
											%>
											<select name="FkProduttore" id="FkProduttore" class="selectpicker show-menu-arrow  show-tick" data-size="10">
											<option value="0">Select a brand</option>
											<%
											Do While Not cs.EOF
											%>
											<option value="<%=cs("pkid")%>"><%=cs("titolo")%></option>
											<%
											cs.movenext
											loop
											%>
											</select>
											<%end if%>
											<%cs.close%>
									</div>
							</div>
					</div>
					<div class="col-lg-6">
							<div class="form-group">
									<label for="inputEmail3" class="col-sm-4 control-label">Lowest price</label>
									<div class="col-sm-8">
											<input type="text" class="form-control" id="prezzo_da" name="prezzo_da">
									</div>
							</div>
							<div class="form-group">
									<label for="prezzo_a" class="col-sm-4 control-label">Maximum price</label>
									<div class="col-sm-8">
											<input type="text" class="form-control" id="prezzo_a" name="prezzo_a">
									</div>
							</div>
							<div class="form-group">
									<div class="col-sm-offset-4 col-sm-8">
											<button type="submit" class="btn btn-danger">Find</button>
									</div>
							</div>
					</div>
					</form>
			</div>
		</div>
    <!--#include virtual="/inc_footer.asp"-->
</body>
<!--#include virtual="/inc_strClose.asp"-->

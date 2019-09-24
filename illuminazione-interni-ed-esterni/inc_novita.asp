<!--#include virtual="/inc_strConn.asp"-->
<%
if pkid_novita=1 then
  Title="Suspended lights and Chandeliers"
  Titolo_1="Suspended lights"
  Titolo_2="Suspended lights and Chandeliers"
  Description=""
  Descrizione=""
end if
if pkid_novita=3 then
  Title="Ceiling lights and Overhead lamps"
  Titolo_1="Ceiling lights"
  Titolo_2="Ceiling lights and Overhead lamps"
  Description=""
  Descrizione=""
end if
if pkid_novita=4 then
  Title="Wall lights"
  Titolo_1="Wall lights"
  Titolo_2="Wall lights"
  Description=""
  Descrizione=""
end if
if pkid_novita=5 then
  Title="Floor lights"
  Titolo_1="Floor lights"
  Titolo_2="Floor lights"
  Description=""
  Descrizione=""
end if
if pkid_novita=6 then
  Title="Table lights"
  Titolo_1="Table lights"
  Titolo_2="Table lights"
  Description=""
  Descrizione=""
end if
if pkid_novita=10 then
  Title="Outdoor lamps"
  Titolo_1="Outdoor lamps"
  Titolo_2="Outdoor lamps"
  Description=""
  Descrizione=""
end if
%>
<!DOCTYPE html>
<html>

<head>
    <title><%=Title%> New product lighting - Cristalensi online shop</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="<%if Len(Description)>0 then%><%=Description%><%else%><%=Titolo_2%> online shop: from Cristalensi discount about all new product lighting. Online store of lights and lamps.<%end if%>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="<%if Len(Description)>0 then%><%=Description%><%else%><%=Titolo_2%> online shop: from Cristalensi discount about all new product lighting. Online store of lights and lamps.<%end if%>">
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
    <link rel="canonical" href="https://www.cristalensi.com/interior-exterior-lighting/<%=toUrl%>"/>
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
                <li><a href="/" title="CRISTALENSI online store lamps"><i class="fa fa-home"></i></a></li>
                <li><a href="/novita-illuminazione-ultimi-arrivi.asp">New product lighting</a></li>
                <li class="active"><%=Titolo_1%></li>
            </ol>
            <h1 class="title"><%=Titolo_2%> - New product lighting</h1>
            <%if Len(Descrizione)>0 then%>
            <p class="description">
                <%=NoLettAccDescrizioni(Descrizione)%>
            </p>
            <%end if%>
        </div>
        <div class="col-md-3">
            <div class=" top-buffer">
                <nav class="navbar hidden-xs">
                    <!-- menu - normal collapsible navbar markup -->
                    <ul class="list-unstyled side-list">
                        <li><a href="/interior-exterior-lighting/1-new-suspended-lights.asp" title="Suspended lights - New product lighting">Suspended lights</a></li>
												<li><a href="/interior-exterior-lighting/2-new-ceiling-lights.asp" title="Ceiling lights - New product lighting">Ceiling lights</a></li>
												<li><a href="/interior-exterior-lighting/3-new-wall-lamps.asp" title="Wall lights - New product lighting">Wall lights</a></li>
												<li><a href="/interior-exterior-lighting/4-new-floor-lights.asp" title="Floor lights - New product lighting">Floor lights</a></li>
												<li><a href="/interior-exterior-lighting/5-new-table-lights.asp" title="Table lights - New product lighting">Table lights</a></li>
                        <li><a href="/interior-exterior-lighting/10-new-outdoor-lamps.asp" title="Outdoor lamps - New product lighting">Outdoor lamps</a></li>
                    </ul>
                </nav>
                <div class="banner preventivi overflowContainer">
                    <h3 class="title">Promozione di Novembre</h3>
                    <p class="text" style="padding-left: 40px;"><strong><em>Sconti Extra in Carrello</em></strong><br />-2% Oltre 300&nbsp&euro;<br />-3% Oltre 600&nbsp&euro;<br />-4% Oltre 900&nbsp&euro;</strong></p>
                </div>
                <div class="banner pagamenti overflowContainer">
                    <h3 class="title">Paga in sicurezza!</h3>
                    <p class="text"><strong><em>PAGHI CON BONIFICO? -2%</em></strong><br />Altri pagamenti disponibili:<br />Carte di Credito e PayPal, PostePay e Contrassegno.
                    </p>
                </div>
                <div class="banner consegne overflowContainer">
                    <h3 class="title">SPEDIZIONI ASSICURATE</h3>
                    <p class="text">Consegna <u>GRATUITA</u> in tutta Italia per ordini superiori a 250&euro;<br />Per ordini fino a 250&euro;: 10&euro;</p>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="row top-buffer">
                <%
                Set prod_rs = Server.CreateObject("ADODB.Recordset")
                if pkid_novita=1 then sql = "SELECT TOP 60 * FROM Prodotti WHERE ((FkNewTipologia=1 or FkNewTipologia=2) and (Offerta=0 or Offerta=2)) ORDER BY PkId DESC"
                if pkid_novita=3 or pkid_novita=4 or pkid_novita=5 or pkid_novita=6 then sql = "SELECT TOP 60 * FROM Prodotti WHERE (FkNewTipologia="&pkid_novita&" and (Offerta=0 or Offerta=2)) ORDER BY PkId DESC"
                if pkid_novita=10 then sql = "SELECT TOP 60 * FROM Prodotti WHERE ((FkNewGruppo=2) and (Offerta=0 or Offerta=2)) ORDER BY PkId DESC"
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
                      file_img=Replace(file_img, "&rsquo;", "")
                    end if
                    img_rs.close

                    spedizionegratis=0
                    if prezzoarticolo>250 then spedizionegratis=1
                %>
                <div class="col-xs-12 col-sm-4 col-md-4">
                  <article class="col-item">
                      <%if dominio="IT" then%><%if spedizionegratis=1 then%><div class="options">SPEDIZIONE<br />GRATUITA</div><%end if%><%end if%>
                      <div class="photo">
                          <a href="/<%=NomePagina%>" class="prod-img-replace" style="background-image: url(/public/<%=file_img%>)" title="<%=titolo_prodotto%>"><img alt="<%=titolo_prodotto%>" src="/images/blank.png"></a>
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

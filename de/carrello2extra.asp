<!--#include file="inc_strConn.asp"-->
<%
	mode=request("mode")
	if mode="" then mode=0

	'se la session &eacute; gi&agrave; aperta sfrutto il pkid dell'ordine, altrimenti ne apro una
	IdOrdine=session("ordine_shop")
	if IdOrdine="" then IdOrdine=0
	if idOrdine=0 then response.redirect("/carrello1.asp")

		'inserisco le eventuali note dal carrello1
	if fromURL="carrello1.asp" then
		Set os1 = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM Ordini WHERE Dominio LIKE '"&dominio&"' AND PkId="&idOrdine
		os1.Open sql, conn, 3, 3
		os1("NoteCliente")=request("NoteCliente")
		os1.update
		os1.close
	end if
	if idsession=0 then response.Redirect("/de/iscrizione.asp?prov=1")


	Call Visualizzazione("",0,"carrello2extra.asp")

	mode=request("mode")
	if mode="" then mode=0

	Set os1 = Server.CreateObject("ADODB.Recordset")
	sql = "SELECT * FROM Ordini WHERE Dominio LIKE '"&dominio&"' AND PkId="&idOrdine
	os1.Open sql, conn, 3, 3

	TotaleCarrello=os1("TotaleCarrello")
	Sconto=os1("Sconto")
	CostoSpedizione=os1("CostoSpedizione")

	'os1("TipoTrasporto")="Shipping in OTHERS COUNTRIES"
	os1("CostoSpedizione")=CostoSpedizione
	'os1("FkSpedizione")=TipoTrasportoScelto
	'TotaleGnerale_AG=TotaleCarrello+CostoSpedizione
	os1("TotaleGenerale")=TotaleCarrello-Sconto+CostoSpedizione
	os1("FkCliente")=idsession
	stato_ordine=os1("stato")
	if stato_ordine="" then stato_ordine=0


	if mode=0 then

		Nominativo_sp=os1("Nominativo_sp")
		Telefono_sp=os1("Telefono_sp")
		Indirizzo_sp=os1("Indirizzo_sp")
		CAP_sp=os1("CAP_sp")
		Citta_sp=os1("Citta_sp")
		Provincia_sp=os1("Provincia_sp")
		Nazione_sp=os1("Nazione_sp")

		if stato_ordine<3 then os1("stato")=12

	else
		if mode=1 then os1("stato")=22

		Nominativo_sp=request("Nominativo_sp")
		Telefono_sp=request("Telefono_sp")
		Indirizzo_sp=request("Indirizzo_sp")
		CAP_sp=request("CAP_sp")
		Citta_sp=request("Citta_sp")
		Provincia_sp=request("Provincia_sp")
		Nazione_sp=request("Nazione_sp")

		os1("Nominativo_sp")=Nominativo_sp
		os1("Telefono_sp")=Telefono_sp
		os1("Indirizzo_sp")=Indirizzo_sp
		os1("CAP_sp")=CAP_sp
		os1("Citta_sp")=Citta_sp
		os1("Provincia_sp")=Provincia_sp
		os1("Nazione_sp")=Nazione_sp

		NoteCliente=request("NoteCliente")
		os1("NoteCliente")=NoteCliente
	end if
	os1("DataAggiornamento")=now()
	os1("IpOrdine")=Request.ServerVariables("REMOTE_ADDR")
	os1.update

	os1.close

	if mode=1 then response.Redirect("/de/carrello3.asp")
	if mode=2 then response.Redirect("/de/calcolospedizione.asp")
%>
<!DOCTYPE html>
<html>

<head>
    <title>Cristalensi</title>
		<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Cristalensi.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Cristalensi.">
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

		<script language="javascript">
		function Continua()
		{
			nominativo_sp=document.modulocarrello.nominativo_sp.value;
			telefono_sp=document.modulocarrello.telefono_sp.value;
			indirizzo_sp=document.modulocarrello.indirizzo_sp.value;
			cap_sp=document.modulocarrello.cap_sp.value;
			citta_sp=document.modulocarrello.citta_sp.value;
			nazione_sp=document.modulocarrello.nazione_sp.value;

			if (nominativo_sp==""){
 			 alert("\"Vor- und Nachname\" Pflichtfeld.");
 			 return false;
	 		}
			if (telefono_sp==""){
	 			alert("\"Telefon\" Pflichtfeld.");
	 			return false;
	 		}
			if (indirizzo_sp.length<4){
 			 alert("\"Adresse\" Pflichtfeld.");
 			 return false;
 		  }
			if (cap_sp==""){
 			 alert("\"PLZ\" Pflichtfeld.");
 			 return false;
 		  }
 		  if (citta_sp==""){
 			 alert("\"Stadt\" Pflichtfeld.");
 			 return false;
 		  }
 		  if (nazione_sp==""){
 			 alert("Wahlen Sie ein \"Land\".");
 			 return false;
 		  }

			else

				document.modulocarrello.method = "post";
				document.modulocarrello.action = "/de/carrello2extra.asp?mode=1";
				document.modulocarrello.submit();
		}
		</script>
		<script language="javascript">
		function CalcoloSpedizione()
		{
			nominativo_sp=document.modulocarrello.nominativo_sp.value;
			telefono_sp=document.modulocarrello.telefono_sp.value;
			indirizzo_sp=document.modulocarrello.indirizzo_sp.value;
			cap_sp=document.modulocarrello.cap_sp.value;
			citta_sp=document.modulocarrello.citta_sp.value;
			nazione_sp=document.modulocarrello.nazione_sp.value;

			if (nominativo_sp==""){
 			 alert("\"Vor- und Nachname\" Pflichtfeld.");
 			 return false;
	 		}
			if (telefono_sp==""){
	 			alert("\"Telefon\" Pflichtfeld.");
	 			return false;
	 		}
			if (indirizzo_sp.length<4){
 			 alert("\"Adresse\" Pflichtfeld.");
 			 return false;
 		  }
			if (cap_sp==""){
 			 alert("\"PLZ\" Pflichtfeld.");
 			 return false;
 		  }
 		  if (citta_sp==""){
 			 alert("\"Stadt\" Pflichtfeld.");
 			 return false;
 		  }
 		  if (nazione_sp==""){
 			 alert("Wahlen Sie ein \"Land\".");
 			 return false;
 		  }

			else

				document.modulocarrello.method = "post";
				document.modulocarrello.action = "/de/carrello2extra.asp?mode=2";
				document.modulocarrello.submit();
		}
		</script>
		<!--#include virtual="/inc_funzioni_head.asp"-->
</head>

<body>
<!--#include file="inc_header_1.asp"-->
<!--#include file="inc_header_2.asp"-->
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "SELECT PkId, FkOrdine, FkProdotto, PrezzoProdotto, Quantita, TotaleRiga, Titolo, CodiceArticolo, Colore, Lampadina, Dominio FROM RigheOrdine WHERE Dominio LIKE '"&dominio&"' AND FkOrdine="&idOrdine&""
	rs.Open sql, conn, 1, 1
	num_prodotti_carrello=rs.recordcount

	Set ss = Server.CreateObject("ADODB.Recordset")
	sql = "SELECT * FROM Ordini WHERE Dominio LIKE '"&dominio&"' AND pkid="&idOrdine
	ss.Open sql, conn, 1, 1

	if ss.recordcount>0 then
		TotaleCarrello=ss("TotaleCarrello")
		CostoSpedizioneTotale=ss("CostoSpedizione")
		if CostoSpedizioneTotale="" or isnull(CostoSpedizioneTotale) then CostoSpedizioneTotale=0
		Sconto=ss("Sconto")
		TotaleGenerale=ss("TotaleGenerale")
		NoteCliente=ss("NoteCliente")

		TipoTrasportoScelto=ss("FkSpedizione")
		if TipoTrasportoScelto="" or IsNull(TipoTrasportoScelto) then TipoTrasportoScelto=0

		Nominativo_sp=ss("Nominativo_sp")
		Telefono_sp=ss("Telefono_sp")
		Indirizzo_sp=ss("Indirizzo_sp")
		CAP_sp=ss("CAP_sp")
		Citta_sp=ss("Citta_sp")
		Provincia_sp=ss("Provincia_sp")
		Nazione_sp=ss("Nazione_sp")
	end if
%>
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-sm-12 hidden-xs">
            <div class="row bs-wizard">
                <div class="col-sm-5 bs-wizard-step complete">
                    <div class="text-center bs-wizard-stepnum">1</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="/de/carrello1.asp" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Warenkorb</div>
                </div>
                <div class="col-sm-5 bs-wizard-step complete">
                    <div class="text-center bs-wizard-stepnum">2</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="/de/iscrizione.asp" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Wiedererkennung / Registrierung</div>
                </div>
                <div class="col-sm-5 bs-wizard-step active">
                    <div class="text-center bs-wizard-stepnum">3</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Spedition Adresse</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">4</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Zahlungsweisen &amp; Fakturierung</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">5</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Bestellbestatigung</div>
                </div>
            </div>
        </div>
				<form name="modulocarrello" id="modulocarrello" class="form-horizontal">
        <div class="col-md-12">
						<div class="title">
                <h4><span class="visible-xs" style="padding-top: 20px;">Spedition Adresse - 3 of 5</span></h4>
            </div>
            <div class="col-md-12">
                <div class="top-buffer">
                    <table id="cart" class="table table-hover table-condensed table-cart">
												<thead>
														<tr>
															<th style="width:60%">Produktname</th>
															<th style="width:10%" class="text-center">Anzahl</th>
															<th style="width:15%" class="text-right">Stuckpreis</th>
															<th style="width:15%" class="text-right hidden-xs">Gesamtpreis</th>
														</tr>
												</thead>
												<%if rs.recordcount>0 then%>
												<tbody>
														<%
														Do while not rs.EOF

														Set url_prodotto_rs = Server.CreateObject("ADODB.Recordset")
														sql = "SELECT PkId, NomePagina_de FROM Prodotti where PkId="&rs("FkProdotto")&""
														url_prodotto_rs.Open sql, conn, 1, 1

														NomePagina=url_prodotto_rs("NomePagina_de")
														if Len(NomePagina)>0 then
															NomePagina="/public/pagine/"&NomePagina
														else
															NomePagina="#"
														end if

														url_prodotto_rs.close
														%>
														<%
														quantita=rs("quantita")
														if quantita="" then quantita=1
														%>
														<tr>
                                <td data-th="Product" class="cart-product">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5 class="nomargin"><%=rs("titolo")%></h5>
																						<p><strong>Code: <%=rs("codicearticolo")%></strong></p>
                                            <%if Len(rs("colore"))>0 or Len(rs("lampadina"))>0 then%><p><%if Len(rs("colore"))>0 then%>Farbe: <%=rs("colore")%><%end if%><%if Len(rs("lampadina"))>0 then%> - Licht: <%=rs("lampadina")%><%end if%></p><%end if%>
																						<%if FkProduttore=59 then%><br /><span style="color:#a01010;"><strong><em>Zusatzliche Rabatte sind nicht anwendbar</em></strong></span><%end if%>
                                        </div>
                                    </div>
                                </td>
																<td data-th="Quantity" class="text-center"><%=quantita%></td>
                                <td data-th="Price" class="text-right"><%=FormatNumber(rs("PrezzoProdotto"),2)%>&nbsp&euro;</td>
                                <td data-th="Subtotal" class="text-right hidden-xs"><%=FormatNumber(rs("TotaleRiga"),2)%>&nbsp&euro;</td>
                            </tr>
														<%
														rs.movenext
														loop
														%>
                        </tbody>
												<%end if%>
												<%if ss.recordcount>0 then%>
												<tfoot>
													<tr>
															<td class="hidden-xs"></td>
															<td class="text-right" colspan="2">Gesamtwagen</td>
															<td class="text-right"><%if ss("TotaleCarrello")<>0 then%>
															<%=FormatNumber(ss("TotaleCarrello"),2)%><%else%>0<%end if%>&nbsp&euro;</td>
													</tr>
													<tr>
															<td class="hidden-xs"></td>
															<td class="text-right" colspan="2"><strong>Extra Rabatt</strong></td>
															<td class="text-right"><strong><%if ss("Sconto")<>0 then%>
															-<%=FormatNumber(ss("Sconto"),2)%><%else%>0,00<%end if%>&nbsp&euro;</strong></td>
													</tr>
                        </tfoot>
												<%end if%>
                    </table>
										<h5>Anmerkungen</h5>
                    <p>Sie können diesen Bereich nutzen, um uns eventuelle Anmerkungen zu den gekauften Produkten mitzuteilen.</p>
                    <textarea class="form-control" rows="2" name="NoteCliente" id="NoteCliente"><%=NoteCliente%></textarea>
										<p>&nbsp;</p>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="row top-buffer">
                <div class="col-md-6">
                    <div class="title">
                        <h4>Versand</h4>
                    </div>
                    <div class="col-md-12 top-buffer">
                        <table id="cart" class="table table-hover table-condensed table-cart">
														<thead>
                                <tr>
                                    <th style="width:70%">Speditionsarten</th>
                                    <th style="width:15%">Stückpreis</th>
                                    <th style="width:15%" class="hidden-xs">Gesamtpreis</th>
                                </tr>
                            </thead>
                            <tbody>
																<%if stato_ordine=22 then%>
																<tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="radio">
                                                    <label><b>Internationaler Kurier</b></label>
                                                </div>
                                                <p style="color: #666; font-size: .85em;"></p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Price"><%=FormatNumber(CostoSpedizioneTotale,2)%>&#8364;</td>
                                    <td data-th="Subtotal" class="hidden-xs"><%=FormatNumber(CostoSpedizioneTotale,2)%>&#8364;</td>
                                </tr>
																<tr>
                                    <td data-th="Product"><h5>Versandkosten:</h5></td>
                                    <td data-th="Price" class="hidden-xs"></td>
                                    <td data-th="Subtotal"><h5><%=FormatNumber(CostoSpedizioneTotale,2)%>&#8364;</h5></td>
                                </tr>
																<%else%>
																<tr>
																		<td data-th="Product" class="cart-product">
																				<div class="row">
																						<div class="col-sm-12">
																								<div class="radio">
																										<label><b>Internationaler Kurier</b></label>
																								</div>
																								<p style="color: #666; font-size: .85em;">International shipping costs depend upon the wieght of the product<br />
			      If you wish to continue with your purchase please follow the following  procedure:<br />
			      -check that the articles in the shopping basket are those which you wish  to purchase,<br />
			      -click on &ldquo;click here for shipping cost&rdquo;.<br />
			      Within 24h (but perhaps within the hour) you will receive an e-mail with  the shipping costs and the possibility to continue with the purchase. <br>
			      Having received the administrator's reply, return to our internet site Home Page, where you should reinsert your original Login (E-mail) and  Password.&nbsp; At this point a link will  appear &ldquo;My Orders&rdquo; still in the Client Area, clicking on this&nbsp; your shopping basket will reappear with the Cost of shipping included, and you can continue.</p>
																						</div>
																				</div>
																		</td>
																		<td data-th="Price">&nbsp;</td>
																		<td data-th="Subtotal" class="hidden-xs">&nbsp;</td>
																</tr>
																<tr>
                                    <td data-th="Product"><h5>Versandkosten:</h5></td>
                                    <td data-th="Price" class="hidden-xs"></td>
                                    <td data-th="Subtotal"><h5>&nbsp;</h5></td>
                                </tr>
																<%end if%>

                            </tbody>


                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="title">
                        <h4>Spedition Adresse</h4>
                    </div>
                    <div class="col-md-12">
							<p class="description">Sie mussen die genaue Adresse angeben, an der Sie die Produkte erhalten mochten.</p>
							<div class="form-group clearfix">
                                <label for="nominativo_sp" class="col-sm-4 control-label">Vor- und Nachname</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="nominativo_sp" id="nominativo_sp" value="<%=nominativo_sp%>" maxlength="100">
                                </div>
                            </div>
							<div class="form-group clearfix">
                                <label for="telefono_sp" class="col-sm-4 control-label">Telefon</label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" name="telefono_sp" id="telefono_sp" value="<%=telefono_sp%>" maxlength="50">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="indirizzo_sp" class="col-sm-4 control-label">Addresse</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="indirizzo_sp" id="indirizzo_sp" value="<%=indirizzo_sp%>" maxlength="100">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="citta_sp" class="col-sm-4 control-label">Stadt</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="citta_sp" id="citta_sp" value="<%=citta_sp%>" maxlength="50">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="cap_sp" class="col-sm-4 control-label">PLZ</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="cap_sp" id="cap_sp" value="<%=cap_sp%>" maxlength="5">
                                </div>
                            </div>
                            <div class="form-group clearfix">
																<label for="provincia_sp" class="col-sm-4 control-label">Provinz</label>
																<div class="col-sm-8">
																<%
																Set prov_rs = Server.CreateObject("ADODB.Recordset")
																sql = "SELECT * FROM Province order by Provincia ASC"
																prov_rs.Open sql, conn, 1, 1
																if prov_rs.recordcount>0 then
																%>
																<select class="selectpicker show-menu-arrow  show-tick" data-size="4" title="Provincia" name="provincia_sp" id="provincia_sp">
																	<option title="" value="">Wahlen Sie eine Provinz (nur fur Italien)</option>
																	<%
																	Do While Not prov_rs.EOF
																	%>
																	<option title="<%=prov_rs("codice")%>" value=<%=prov_rs("codice")%> <%if provincia_sp=prov_rs("codice") then%> selected<%end if%>><%=prov_rs("Provincia")%></option>
																	<%
																	prov_rs.movenext
																	loop
																	%>
																</select>
																<%
																end if
																prov_rs.close
																%>
                                </div>
                            </div>
														<div class="form-group clearfix">
																<label for="nazione_sp" class="col-sm-4 control-label">Land</label>
																<div class="col-sm-8">
																<%
																Set naz_rs = Server.CreateObject("ADODB.Recordset")
																sql = "SELECT * FROM Nazioni order by Nazione ASC"
																naz_rs.Open sql, conn, 1, 1
																if naz_rs.recordcount>0 then
																%>
																<select class="selectpicker show-menu-arrow  show-tick" data-size="4" title="Nazione" name="nazione_sp" id="nazione_sp">
																	<option title="" value="">Wahlen Sie ein Land</option>
																	<%
																	Do While Not naz_rs.EOF

																		if TipoTrasportoScelto<4 and naz_rs("codice")="IT" then
																			selected="OK"
																		end if
																		if nazione_sp=naz_rs("codice") then
																			selected="OK"
																		end if
																	%>
																	<option title="<%=naz_rs("codice")%>" value=<%=naz_rs("codice")%> <%if selected="OK" then%> selected<%end if%>><%=naz_rs("Nazione")%></option>
																	<%
																		selected=""
																	naz_rs.movenext
																	loop
																	%>
																</select>
																<%
																end if
																naz_rs.close
																%>
                                </div>
                            </div>
					</div>
                </div>
            </div>
			<%if ss.recordcount>0 then%>
            <div class="col-md-12">
                <div class="bg-primary">

                    <p style="font-size: 1.2em; text-align: right; padding: 10px 15px; color: #000;">Warenkorb gesamt: <b>
										<%if ss("TotaleGenerale")<>0 then%>
									  	<%=FormatNumber(ss("TotaleGenerale"),2)%>
                    <%else%>
                    	0,00
                    <%end if%>
	                 	&#8364;&nbsp;</b></p>

								</div>
								<%if rs.recordcount>0 then%>
                <a href="/de/carrello2.asp" class="btn btn-danger pull-left" style="margin-top: 10px;"><i class="glyphicon glyphicon-chevron-left"></i> Vorhergehender Schritt</a>
                <a href="#" class="btn btn-danger pull-right" style="margin-top: 10px;" onClick="<%if stato_ordine=22 then%>Continua();<%else%>CalcoloSpedizione();<%end if%>"><%if stato_ordine=22 then%>klicken Sie hier, um den Einkauf abzuschliessen<%else%>Click here to calculate the shipping cost<%end if%> <i class="glyphicon glyphicon-chevron-right"></i></a>
								<%end if%>
            </div>
						<%end if%>
        </div>
				</form>
    </div>
		<%
		ss.close
		rs.close
		%>
		<!--#include file="inc_footer.asp"-->
</body>

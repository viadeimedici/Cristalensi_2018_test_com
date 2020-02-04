<nav class="navbar navbar-inverse menu-aux navbar-default visible-xs">
    <div class="container">
        <div class="col-xs-6">
            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-info-sign"></span> Kontakt <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li>
                          <a href="tel:0571911163">
                          <span class="glyphicon glyphicon-earphone"></span> +39.0571.911163<br />
                          Mon. - Mit.: 9.00 - 12.30 | 14.30 - 19.30<br />Sam: 9.00 - 12.30 | 15.30 - 19.30<br />Sonntags GESCHLOSSEN
                          </a>
                        </li>
                        <li><a href="mailto:info@cristalensi.it"><span class="glyphicon glyphicon-envelope"></span> info@cristalensi.it</a></li>
                        <li><a href="https://api.whatsapp.com/send?phone=393388064487" target="_blank" title="So senden Sie Nachrichten und Fotos"><span class="glyphicon glyphicon-camera"></span> WhatsApp (NUR CHAT)</a></li>
                        <li><a href="/contatti.asp"><span class="glyphicon glyphicon-map-marker"></span> Kontakte und Karte</a></li>
                        <li><a href="/chi_siamo.asp"><span class="glyphicon glyphicon-star"></span> Wer wir sind</a></li>
                        <li><a href="/video_elenco.asp"><span class="glyphicon glyphicon-facetime-video"></span> Video</a></li>
                        <li><a href="/commenti_elenco.asp"><span class="glyphicon glyphicon-bullhorn"></span> Bewertungen</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="col-xs-6">
            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-globe"></span> Sprachen <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="https://www.cristalensi.it">Italienisch</a></li>
                        <li><a href="https://www.cristalensi.com/">Englisch</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<nav class="navbar navbar-inverse menu-aux hidden-xs first-top-menu">
    <div class="container">
        <ul class="nav nav-justified">
            <li class="dropdown"><a href="tel:0571911163" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-earphone"></span> 0571.911163</a>
              <ul class="dropdown-menu">
                  <li>
                    <a href="tel:0571911163" style="text-align: center;">Mon. - Mit.: 9.00 - 12.30 | 14.30 - 19.30<br />Samstag: 9.00 - 12.30 | 15.30 - 19.30<br />Sonntags GESCHLOSSEN</a>
                  </li>
              </ul>
            </li>
            <li><a href="mailto:info@cristalensi.it"><span class="glyphicon glyphicon-envelope"></span> info@cristalensi.it</a></li>
            <li><a href="https://api.whatsapp.com/send?phone=393388064487" target="_blank" title="So senden Sie Nachrichten und Fotos"><span class="glyphicon glyphicon-camera"></span> WhatsApp (NUR CHAT)</a></li>
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-globe"></span> Wer wir sind <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="/contatti.asp"><span class="glyphicon glyphicon-map-marker"></span> Kontakte und Karte</a></li>
            		    <li><a href="/chi_siamo.asp"><span class="glyphicon glyphicon-picture"></span> Ausstellungsraum</a></li>
            		    <li><a href="/video_elenco.asp"><span class="glyphicon glyphicon-facetime-video"></span> Video</a></li>
                    <li><a href="/commenti_elenco.asp"><span class="glyphicon glyphicon-bullhorn"></span> Bewertungen</a></li>
                    <li><a href="/condizioni_di_vendita.asp"><span class="glyphicon glyphicon-th-list"></span> Warenkorb</a></li>
                </ul>
            </li>
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-globe"></span> Sprachen <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="https://www.cristalensi.it">Italienisch</a></li>
                    <li><a href="https://www.cristalensi.com/de/">Englisch</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<nav class="navbar navbar-inverse service-menu hidden-xs last-top-menu">
    <div class="container">
        <ul class="nav nav-justified">
            <!-- <li><a href="/" title="Cristalensi, vendita lampadari online"><span class="glyphicon glyphicon-home"></span> Home</a></li> -->
            <li><img src="/images/trasparente.png" width="20px" height="1px;"></li>
            <li><img src="/images/trasparente.png" width="20px" height="1px;"></li>
            <li><img src="/images/trasparente.png" width="20px" height="1px;"></li>
            <li><img src="/images/trasparente.png" width="20px" height="1px;"></li>
            <%if idsession>0 then%>
              <li><a href="/admin/logout.asp"><span class="glyphicon glyphicon-log-in"></span> AUSLOGGEN</a></li>
            <%end if%>
            <li><a href="/areaprivata.asp" rel="nofollow"><span class="glyphicon glyphicon-user"></span> Kundenbereich</a></li>
            <li><a href="/preferiti.asp" rel="nofollow"><span class="glyphicon glyphicon-heart"></span> Wunschzettel</a></li>
            <li><a href="/carrello1.asp" rel="nofollow"><span class="glyphicon glyphicon-shopping-cart"></span> Warenkorb</a></li>
        </ul>
    </div>
</nav>

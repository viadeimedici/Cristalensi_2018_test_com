<nav class="navbar navbar-inverse menu-aux navbar-default visible-xs">
    <div class="container">
        <div class="col-xs-6">
            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-info-sign"></span> Contattaci <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li>
                          <a href="tel:0571911163">
                          <span class="glyphicon glyphicon-earphone"></span> +39.0571.911163<br />
                          Mon. - Wed.: 9.00 - 12.30 | 14.30 - 19.30<br />Sat: 9.00 - 12.30 | 15.30 - 19.30<br />Sunday CLOSED
                          </a>
                        </li>
                        <li><a href="mailto:info@cristalensi.it"><span class="glyphicon glyphicon-envelope"></span> info@cristalensi.it</a></li>
                        <li><a href="https://api.whatsapp.com/send?phone=393388064487" target="_blank" title="To send messages and photos"><span class="glyphicon glyphicon-camera"></span> WhatsApp (ONLY CHAT)</a></li>
                        <li><a href="/contatti.asp"><span class="glyphicon glyphicon-map-marker"></span> Contacts and Map</a></li>
                        <li><a href="/chi_siamo.asp"><span class="glyphicon glyphicon-star"></span> Who we are</a></li>
                        <li><a href="/video_elenco.asp"><span class="glyphicon glyphicon-facetime-video"></span> Video</a></li>
                        <li><a href="/commenti_elenco.asp"><span class="glyphicon glyphicon-bullhorn"></span> Reviews</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="col-xs-6">
            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-globe"></span> Languages <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="https://www.cristalensi.it">Italian</a></li>
                        <li><a href="https://www.cristalensi.com/de/">German</a></li>
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
                    <a href="tel:0571911163" style="text-align: center;">Mon. - Wed.: 9.00 - 12.30 | 14.30 - 19.30<br />Saturday: 9.00 - 12.30 | 15.30 - 19.30<br />Sunday CLOSED</a>
                  </li>
              </ul>
            </li>
            <li><a href="mailto:info@cristalensi.it"><span class="glyphicon glyphicon-envelope"></span> info@cristalensi.it</a></li>
            <li><a href="https://api.whatsapp.com/send?phone=393388064487" target="_blank" title="To send messages and photos"><span class="glyphicon glyphicon-camera"></span> WhatsApp (ONLY CHAT)</a></li>
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-globe"></span> Who we are <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="/contatti.asp"><span class="glyphicon glyphicon-map-marker"></span> Contacts and maps</a></li>
            		    <li><a href="/chi_siamo.asp"><span class="glyphicon glyphicon-picture"></span> Showroom</a></li>
            		    <li><a href="/video_elenco.asp"><span class="glyphicon glyphicon-facetime-video"></span> Video</a></li>
                    <li><a href="/commenti_elenco.asp"><span class="glyphicon glyphicon-bullhorn"></span> Reviews</a></li>
                    <li><a href="/condizioni_di_vendita.asp"><span class="glyphicon glyphicon-th-list"></span> Conditions of sale</a></li>
                </ul>
            </li>
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-globe"></span> Languages <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="https://www.cristalensi.it">Italian</a></li>
                    <li><a href="https://www.cristalensi.com/de/">German</a></li>
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
              <li><a href="/admin/logout.asp"><span class="glyphicon glyphicon-log-in"></span> LOG OUT</a></li>
            <%end if%>
            <li><a href="/areaprivata.asp" rel="nofollow"><span class="glyphicon glyphicon-user"></span> Client Area</a></li>
            <li><a href="/preferiti.asp" rel="nofollow"><span class="glyphicon glyphicon-heart"></span> Wishlist</a></li>
            <li><a href="/carrello1.asp" rel="nofollow"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
        </ul>
    </div>
</nav>

!function(t){t.fn.tipTip=function(e){var o={activation:"hover",keepAlive:!1,maxWidth:"200px",edgeOffset:3,defaultPosition:"bottom",delay:400,fadeIn:200,fadeOut:200,attribute:"title",content:!1,enter:function(){},exit:function(){}},i=t.extend(o,e),n=t('<div id="tiptip_holder" style="max-width:'+i.maxWidth+';"></div>'),r=t('<div id="tiptip_content"></div>'),a=t('<div id="tiptip_arrow"></div>');return t("body").append(n.html(r).prepend(a.html('<div id="tiptip_arrow_inner"></div>'))),this.each(function(){function e(){i.enter.call(this),i.content?d=i.content:f.attr(i.attribute)&&(d=f.attr(i.attribute),""!=d&&f.removeAttr(i.attribute)),r.html(d),n.hide().removeAttr("class").css("margin","0"),a.removeAttr("style");var e=parseInt(f.offset().top),o=parseInt(f.offset().left),c=parseInt(f.outerWidth()),p=parseInt(f.outerHeight()),l=n.outerWidth(),h=n.outerHeight(),s=Math.round((c-l)/2),_=Math.round((p-h)/2),v=Math.round(o+s),m=Math.round(e+p+i.edgeOffset),g="",b="",M=Math.round(l-12)/2;"bottom"==i.defaultPosition?g="_bottom":"top"==i.defaultPosition?g="_top":"left"==i.defaultPosition?g="_left":"right"==i.defaultPosition&&(g="_right");var w=s+o<parseInt(t(window).scrollLeft()),O=l+o>parseInt(t(window).width());w&&0>s||"_right"==g&&!O||"_left"==g&&o<l+i.edgeOffset+5?(g="_right",b=Math.round(h-13)/2,M=-12,v=Math.round(o+c+i.edgeOffset),m=Math.round(e+_)):(O&&0>s||"_left"==g&&!w)&&(g="_left",b=Math.round(h-13)/2,M=Math.round(l),v=Math.round(o-(l+i.edgeOffset+5)),m=Math.round(e+_));var x=e+p+i.edgeOffset+h+8>parseInt(t(window).height()+t(window).scrollTop()),I=e+p-(i.edgeOffset+h+8)<0;x||"_bottom"==g&&x||"_top"==g&&!I?("_top"==g||"_bottom"==g?g="_top":g+="_top",b=h,m=Math.round(e-(h+5+i.edgeOffset))):(I|("_top"==g&&I)||"_bottom"==g&&!x)&&("_top"==g||"_bottom"==g?g="_bottom":g+="_bottom",b=-12,m=Math.round(e+p+i.edgeOffset)),"_right_top"==g||"_left_top"==g?m+=5:("_right_bottom"==g||"_left_bottom"==g)&&(m-=5),("_left_top"==g||"_left_bottom"==g)&&(v+=5),a.css({"margin-left":M+"px","margin-top":b+"px"}),n.css({"margin-left":v+"px","margin-top":m+"px"}).attr("class","tip"+g),u&&clearTimeout(u),u=setTimeout(function(){n.stop(!0,!0).fadeIn(i.fadeIn)},i.delay)}function o(){i.exit.call(this),u&&clearTimeout(u),n.fadeOut(i.fadeOut)}var f=t(this);if(i.content)var d=i.content;else var d=f.attr(i.attribute);if(void 0!=d){i.content||f.removeAttr(i.attribute);var u=!1;"hover"==i.activation?(f.hover(function(){e()},function(){i.keepAlive||o()}),i.keepAlive&&n.hover(function(){},function(){o()})):"focus"==i.activation?f.focus(function(){e()}).blur(function(){o()}):"click"==i.activation&&(f.click(function(){return e(),!1}).hover(function(){},function(){i.keepAlive||o()}),i.keepAlive&&n.hover(function(){},function(){o()}))}})}}(jQuery);
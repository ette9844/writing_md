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

```html
<script>
      var map, infoWindow;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 6
        });
        infoWindow = new google.maps.InfoWindow;

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            infoWindow.open(map);
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
    </script>
```
>navigator.geolocation.getCurrentPosition: 현재 위경도를 가져오는 함수
>getCurrentPosition내 function 의 매개변수 position: 현재 위,경도 값
>setPosition으로 위치를 새로 잡고 open함수로 map을 새로 보여준다.


## Marker

```java
function initMap() {
    var myLatLng = {lat: -25.363, lng: 131.044};

    var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: myLatLng
    });

    var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          title: 'Hello World!'
	});
}
 ```


## Marker Labels
label을 가진 마커를 만들고 싶을때
```java
function addMarker(location, map) {
        // Add the marker at the clicked location, and add the next-available label
        // from the array of alphabetical characters.
        var marker = new google.maps.Marker({
          position: location,
          label: labels[labelIndex++ % labels.length],
          map: map
        });
}
```
>

## Simple Marker Icons
마커를 특정 아이콘으로 변경

>icon 속성 추가

## Complex Marker Icons
배열로 처리하여 마커를 여러 개 생성
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE5MjMxMTk0MTEsLTk4NDYxMjA2OF19
-->
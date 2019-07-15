## JQuery 공식 사이트 가이드

[jQuery learn](https://learn.jquery.com/)

## $ vs $()

jQuery용 함수를 사용하기 위해서는 jQuery객체로 만드는 것이 선행되어야 한다.

$(): jQuery 객체화
```JAVA
var obj = document.querySelector("h1");
obj.remove();	// 에러 발생
```
```JAVA
$("h1").remove();
$(document);	// document를 jquery 객체화
```

$. : jQuery에서 제공되는 prototype 사용
주로 ajax를 호출할 때 사용 됨
```JAVA
$.ajax();
```

## 



<!--stackedit_data:
eyJoaXN0b3J5IjpbMTQ4MjAzNzI4MV19
-->
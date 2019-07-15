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

## Attribute
attribute를 셋팅하거나 그 값을 가져오는 역할

매개변수 1개: 값 셋팅
```JAVA
$( "a" ).attr( "href", "allMyHrefsAreTheSameNow.html" );
$( "a" ).attr({
	 title: "all titles are the same too!",
	 href: "somethingNew.html"
});
```

매개변수 1개




<!--stackedit_data:
eyJoaXN0b3J5IjpbNjQ5NzA0MTU0XX0=
-->
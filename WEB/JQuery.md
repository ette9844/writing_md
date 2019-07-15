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

매개변수 1개: 해당 attribute의 값 가져오기
```JAVA
$( "a" ).attr( "href" );
```

## 선택자

기존 javaScript 선택자와 동일

### Selecting Elements by ID

```JAVA
$( "#myId" ); // Note IDs must be unique per page.
```

### Selecting Elements by Class Name
```JAVA
$( ".myClass" );
```
### Selecting Elements by Attribute
```JAVA
$( "input[name='first_name']" );
```

### Selecting Elements by Compound CSS Selector

1

`$( "#contents ul.people li" );`

## [link](https://learn.jquery.com/using-jquery-core/selecting-elements/#selecting-elements-with-a-comma-separated-list-of-selectors)Selecting Elements with a Comma-separated List of Selectors

1

`$( "div.myClass, ul.people" );`

## [link](https://learn.jquery.com/using-jquery-core/selecting-elements/#pseudo-selectors)Pseudo-Selectors

1

2

3

4

5

6

7

8

9

10

11

12

`$( "a.external:first" );`

`$( "tr:odd" );`

`// Select all input-like elements in a form (more on this below).`

`$( "#myForm :input" );`

`$( "div:visible" );`

`// All except the first three divs.`

`$( "div:gt(2)" );`	// 

`// All currently animated divs.`

`$( "div:animated" );`
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTY1OTA2NTAxMV19
-->
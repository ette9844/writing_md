---
layout: post
title:  "JQuery 시작하기"
subtitle:   "JQuery 시작하기"
categories: study
tags: web
---

## JQuery 공식 가이드

[JQuery 공식 사이트 가이드](https://learn.jquery.com/)
[W3Schools jQuery 튜토리얼](https://www.w3schools.com/jquery/default.asp)

## jQuery Start

먼저 jquery 라이브러리를 사용할 수 있도록 외부 라이브러리를 가져오는 script태그를 작성한 후에 jquery 사용 스크립트 작성

```HTML
<!-- 외부 jquery 라이브러리 불러오기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
// JavaScript 작성..
$(function(){
	alert("first");
});
</script>
```

## $ vs $()

jQuery용 함수를 사용하기 위해서는 jQuery객체로 만드는 것이 선행되어야 한다.

$(): jQuery 객체화
```javascript
var obj = document.querySelector("h1");
obj.remove();	// 에러 발생
```
```javascript
$("h1").remove();
$(document);	// document를 jquery 객체화
```

$. : jQuery에서 제공되는 prototype 사용
주로 ajax를 호출할 때 사용 됨
```javascript
$.ajax();
```

## Attribute
attribute를 셋팅하거나 그 값을 가져오는 역할

매개변수 1개: 값 셋팅
```javascript
$( "a" ).attr( "href", "allMyHrefsAreTheSameNow.html" );
$( "a" ).attr({
	 title: "all titles are the same too!",
	 href: "somethingNew.html"
});
```

매개변수 1개: 해당 attribute의 값 가져오기
```javascript
$( "a" ).attr( "href" );
```

## 선택자

기존 javaScript 선택자와 동일

### Selecting Elements by ID

```javascript
$( "#myId" ); // Note IDs must be unique per page.
```

### Selecting Elements by Class Name
```javascript
$( ".myClass" );
```
### Selecting Elements by Attribute
```javascript
$( "input[name='first_name']" );
```

### Selecting Elements by Compound CSS Selector
```javascript
$( "#contents ul.people li" );
```
### Selecting Elements with a Comma-separated List of Selectors

```javascript
$( "div.myClass, ul.people" );
```

### Pseudo-Selectors

```javascript
$( "a.external:first" );
$( "tr:odd" );

// Select all input-like elements in a form (more on this below).
$( "#myForm :input" );
$( "div:visible" );

// All except the first three divs.
$( "div:gt(2)" );	// 두번째 요소보다 큰

// All currently animated divs.
$( "div:animated" );
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTg1Mjk0NDI2MCwxNzYyNTA0NDgxLDE1ND
Q5NDAwODNdfQ==
-->
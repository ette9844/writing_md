---
layout: post
title:  "JQuery 이펙트"
subtitle:   "JQuery 이펙트"
categories: study
tags: web
---

## jQuery Hide & Show

* hide() : object.style.display = 'none';
요소 안보이게 하기
* show() : object.style.display = `'inline' or 'block'`;
요소 보이게 하기
* hide(number)
```HTML
$("button").click(function(){  
	$("p").hide(1000);  	// 1000ms = 1초
});
```
>hide 애니메이션 설정
타임아웃을 설정해 천천히 사라지도록 함

## jQuery Fade
* fadeIn() : 천천히 나타나기
* fadeOut() : 천천히 사라지기
* fadeToggle() = fadein + fadeout

```javascript
$(document).ready(function(){
  $("button").click(function(){
    $("#div1").fadeToggle();
    $("#div2").fadeToggle("slow");
    $("#div3").fadeToggle(3000);
  });
});
```

## jQuery Slide
* slideUp() : 
* slideDown() :  
* slideToggle() = slideUp() + slideDown()
```javascript
$(document).ready(function(){
  $("#flip").click(function(){
    $("#panel").slideToggle("slow");
  });
});
```

## JQuery Chaining

```javascript
// obj1, 2, 3모두 id속성이 p1인 객체를 반환받음
var obj1 = $("#p1").css("color", "red");
var obj2 = $("#p1").slideUp(2000);
var obj3 = $("#p1").slideDown(2000);

// 현재 사용중인 객체를 반환하므로 method chaining이 가능
$("#p1").css("color", "red").slideUp(2000).slideDown(2000);
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE1MzUyNzU5MzAsLTYxODc1NjkyNiw4Nj
k5MDA0MDhdfQ==
-->
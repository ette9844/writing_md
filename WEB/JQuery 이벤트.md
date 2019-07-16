---
layout: post
title:  "JQuery 이벤트"
subtitle:   "JQuery 이벤트"
categories: study
tags: web
---

## JQuery와 DOM의 클릭이벤트 처리

### DOM
```java
var testObj = document.querySelector("#test");
testObj.addEventListener("click", function(){
	var otherObj = document.querySelector("#other");
	// 주의: javascript에도 click()함수가 있다.
	// js의 click(): 클릭이벤트 강제 발생
	otherObj.click();
});
```

### JQuery
```java
// jQuery의 click(): 이벤트 감시용 함수 = 이벤트 핸들러
$("#test").click(function(){
	// TODO
});
```
<br/>

## JQuery가 제공하는 다양한 이벤트 함수

![jQuery event](https://github.com/ette9844/writing_md/blob/master/imgs/jquery_event.PNG?raw=true)

mouseenter: 마우스가 요소 내에 들어갔을 때

mouseleave: 마우스가 요소 내에서 나갔을 때

hover(): mouseenter + mouseleave
>hover은 콜백함수가 2개
>첫번째 콜백함수는 마우스가 들어갔을 때(mouseenter), 
>두번째 콜백함수는 마우스가 나갔을 때(mouseleave)


<br/>

## on() 이벤트 처리 함수

### 단일 이벤트 핸들러 작성
```java
$("p").on("click", function(){  
$(this).hide();  
});
```
### 다수의 이벤트 핸들러 작성
```java
$("p").on({  
	mouseenter: function(){  
		$(this).css("background-color", "lightgray");  
	},  
	mouseleave: function(){  
		$(this).css("background-color", "lightblue");  
	},  
	click: function(){  
		$(this).css("background-color", "yellow");  
	}  
});
```


**selector**

Type:  [String](http://api.jquery.com/Types/#String)

A selector string to filter the **descendants** of the selected elements that trigger the event. If the selector is  `null`  or omitted, the event is always triggered when it reaches the selected element.


<!--stackedit_data:
eyJoaXN0b3J5IjpbMTY4MTAyMzMzLC0xMzM0NzY1OTMsLTY5NT
E4NDMzN119
-->
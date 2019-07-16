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

### on함수의 특징 1
다수의 이벤트 핸들러 작성 가능

#### 단일 이벤트 핸들러 작성

```java
$("p").on("click", function(){  
$(this).hide();  
});
```
#### 다수의 이벤트 핸들러 작성
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
<br/>

### on함수의 특징 2
DOM 트리에 없는 요소(동적으로 추가된 요소)도 이벤트 핸들러를 미리 작성할 수 있다.

```java
// dom에서 div객체를 찾고 후손으로 추가될 p요소의 click 이벤트 핸들러
$("div").on("click", "p", function(){
	$(this).css("background-color", "yellow");
});
```

<br/>

### [.on( events [, selector ] [, data ], handler )](https://api.jquery.com/on/#on-events-selector-data-handler)
**events**

Type:  [String](http://api.jquery.com/Types/#String)

One or more space-separated event types and optional namespaces, such as "click" or "keydown.myPlugin".

**selector**

Type:  [String](http://api.jquery.com/Types/#String)

A selector string to filter the **descendants** of the selected elements that trigger the event. If the selector is  `null`  or omitted, the event is always triggered when it reaches the selected element.

**data**
    
Type:  [Anything](http://api.jquery.com/Types/#Anything)
    
Data to be passed to the handler in  [`event.data`](https://api.jquery.com/event.data/)  when an event is triggered.
    
**handler**
    
Type:  [Function](http://api.jquery.com/Types/#Function)(  [Event](http://api.jquery.com/Types/#Event)  eventObject [,  [Anything](http://api.jquery.com/Types/#Anything)  extraParameter ] [, ... ] )
    
A function to execute when the event is triggered. The value  `false`  is also allowed as a shorthand for a function that simply does  `return false`.
    
    

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTcyNzEyNjI0OSwtMTMzNDc2NTkzLC02OT
UxODQzMzddfQ==
-->
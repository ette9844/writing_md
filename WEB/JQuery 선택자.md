---
layout: post
title:  "JQuery 선택자"
subtitle:   "JQuery 선택자"
categories: study
tags: web
---


### DOM 트리에서 요소 찾기
```javascript
// p요소 하나만 찾기
var pObj = document.querySelector("p");
// 모든 p요소 찾기
var pArr = document.querySelectorAll("p");

// p객체들에 대한 각각의 이벤트 리스너 작성
for(var i=0; i<pArr.length; i++){
	// 변수분리 
	(function(j){
		var pObj = pArr[j];
		pObj.addEventListener("click", function(){
			// TODO
		});
	})(i);
```

### jQuery에서 요소 찾기
```javascript
// querySelectorAll() 호출과 동일하게 작동
var $pArr = $("p");
// p객체들에 대한 각각의 이벤트 리스너 작성
$pArr.click(function(){
	// TODO
});
```
변수 이름 앞에 $를 붙이는 이유는 jquery용 객체를 구분하기 위한 것일 뿐 큰 의미는 없다

$태그로 객체를 찾아오면 querySelectorAll과 같은 기능을 함. = 배열로 리턴 됨

반복문을 사용하지 않아도 배열 내 모든 객체들에 대해 클릭 리스너를 작성할 수 있다



### id 식별자를 사용하여 요소 찾기
```javascript
// id속성값이 test인 요소를 찾기
// id속성값은 유일
// querySelectorAll 사용하지 않아도 됨
document.querySelector("#test");
```

```javascript
// querySelector() 호출과 동일하게 작동
var $testObj = $("#test");
```

### W3Schools description

![jquery selector](https://github.com/ette9844/writing_md/blob/master/imgs/jquery_selector.PNG?raw=true)

```javascript
// 첫번째 ul의 첫번째 li hide
$("ul li:first").hide();
// 모든 ul의 첫번째 li hide
$("ul li:first-child").hide();
```

### 요소 style 설정하기

```javascript
// DOM
this.style.background-color = "yellow";
// JQuery
$(this).css("background-color", "yellow");
```


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEwNDg1ODE1MTRdfQ==
-->
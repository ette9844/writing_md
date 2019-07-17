## 자바스크립트 이벤트 처리방법

```js
(EX)
var ctrl = {
	// block 엘리먼트로 설정
	block: function(elem){
		elem.style.display = 'block';
	}
	// inline 엘리먼트로 설정
	inline: function(elem){
		elem.style.display = 'inline';
	}
	// block, inline을 번갈아 적용
	toggle: function(elem){
		if(elem.style.display === 'block') {
			ctrl.inline(elem);
		} else {
			ctrl.block(elem);
		}
	}
}
```
<br/>

1. inline 이벤트 처리
```html
<span onclick="ctrl.toggle(this);">
```
태그 내에 이벤트용 속성을 적어준다.
이벤트용 속성: onclick, onfocus, onsubmit ...

html태그와 js용 이벤트 처리 코드가 뒤섞여 유지보수가 어렵다. 

<br/>

2. internal 이벤트 처리
```js
window.addEventListener("load", function(){
	var spanObj = document.querySelector("span");
	spanObj.addEventListener("click", function(){
		ctrl.toggle(this);
	});
});
```
코딩량은 많으나, 유지보수가 용이하다. 

<br/>

3. external 이벤트 처리

```js
(a.js)
window.addEventListener("load", function(){
	var spanObj = document.querySelector("span");
	spanObj.addEventListener("click", function(){
		ctrl.toggle(this);
	});
});
```
```html
<script src="a.js"></script>
<span></span>
```
재사용성을 높이고 js와 html 코드를 분리해 유지보수가 용이하다. (권장)
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTExMTYxNDI1NDksLTIwNTY2NTc4MDZdfQ
==
-->
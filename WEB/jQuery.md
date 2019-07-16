
this.style.background-color = 'yellow';
$(this).css("background-color", "yello");

DOM 트리에서 p 객체 찾기
```JAVA
// p객체 하나만 찾기
var pObj = document.querySelector("p");
// p객체 모두 찾기
var pArr = document.querySelectorAll("p");
```
jQuery에서 p객체 찾기
```JAVA
// p객체 ㅁ
var $pArr = $("p");
```
변수 이름 앞에 $를 붙이는 이유는 jquery용 객체를 구분하기 위한 것일 뿐 큰 의미는 없다

> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE5MDk5NjcwNl19
-->
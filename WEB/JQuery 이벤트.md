
```java
var testObj = document.querySelector("#test");
testObj.addEventListener("click", function(){
	// TODO
	var otherObj = document.querySelector("#other");
	// 주의: javascript에도 click()함수가 있다.
	// js의 click(): 강제 클릭이벤트 발생
	otherObj.click();
});
```

```java
$("#test").click(function(){
	// TODO
});
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTE2MTY2NzM3OF19
-->
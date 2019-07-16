
```java
var testObj = document.querySelector("#test");
testObj.addEventListener("click", function(){
	var otherObj = document.querySelector("#other");
	// 주의: javascript에도 click()함수가 있다.
	// js의 click(): 클릭이벤트 강제 발생
	otherObj.click();
});
```

```java
// jQuery의 click(): 이벤트 감시용 함수 = 이벤트 핸들러
$("#test").click(function(){
	// TODO
});
```

## jQuery가 제공하는 다양한 이벤트 함수

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTU0OTIxMDkyM119
-->
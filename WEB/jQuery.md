
this.style.background-color = 'yellow';
$(this).css("background-color", "yello");

### DOM 트리에서 p 객체 찾기
```JAVA
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

### jQuery에서 p객체 찾기
```JAVA
// p요소 하나만 찾기
var $pArr = $("p");
// p객체들에 대한 각각의 이벤트 리스너 작성
$pArr.click(function(){
	// TODO
});
```
변수 이름 앞에 $를 붙이는 이유는 jquery용 객체를 구분하기 위한 것일 뿐 큰 의미는 없다

$태그로 객체를 찾아오면 querySelectorAll과 같은 기능을 함. = 배열로 리턴 됨

반복문을 사용하지 않아도 배열 내 모든 객체들에 대해 클릭 리스너를 작성할 수 있다


> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTU5MTU1NTMyNF19
-->
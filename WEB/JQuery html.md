## jQuery get / set

get과 set함수 이름이 같다
get() - 인자 필요 x
set() - 인자 필요

```javascript
// JS
$divObj.innerHTML = inner;
// JQuery
$divObj.html(inner);
```

```html
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#btn1").click(function(){
	// 하위 요소는 생략
    alert("Text: " + $("#test").text());
  });
  $("#btn2").click(function(){
	// 하위 요소도 출력
    alert("HTML: " + $("#test").html());
  });
});
</script>
</head>
<body>

<p id="test">This is some <b>bold</b> text in a paragraph.</p>

<button id="btn1">Show Text</button>
<button id="btn2">Show HTML</butto
n>

</body>
</html>
```

```javascript
// form의 input요소에서 입력값을 get/set하는 함수
alert("Value: " + $("#test").val());
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbMjEwNDU3MDc0NCw0NTgwODU5NzNdfQ==
-->
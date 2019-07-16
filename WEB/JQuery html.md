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


-   `append()`  - Inserts content at the end of the selected elements
-   `prepend()`  - Inserts content at the beginning of the selected elements
-   `after()`  - Inserts content after the selected elements
-   `before()`  - Inserts content before the selected elements

## append
```javascript
$("#btn1").click(function(){
  $("p").append(" <b>Appended text</b>.");
});

$("#btn2").click(function(){
  $("ol").append("<li>Appended item</li>");
});
  ```
 
#### append와 after의 차이점
append: 해당 요소의 child로서 가장 끝에 **추가**
after: 해당요소의 뒷쪽/다음 부분에 
  
#### remove와 empty의 차이점
remove: 요소 자체를 지운다
empty: 하위 요소들만 지워, 요소 내부를 비운다

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTcxNjg1MDYwOCwxMDUzMTI4MDI4LDQ1OD
A4NTk3M119
-->
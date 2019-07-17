```html
<script>
window.addEventListener("load", function(){
	var formArr = document.querySelectorAll("form");
});
</script>
```

```html
<script>
window.addEventListener("load", function(){
	var formArr = document.forms;
});
</script>
```
통일성을 망치기 때문에 권장하지 않는다.

```html
<script>
window.addEventListener("load", function(){
	var formArr = document.getElementById("f1");
});
</script>
```
id값으로 찾는 함수.
모든 요소에 id속성을 설정해 줘야하기 때문에 현재는 거의 쓰지 않는다.

```js
var formArr = document.getElementById("f1");
var form
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTQ5ODU1OTg3OV19
-->
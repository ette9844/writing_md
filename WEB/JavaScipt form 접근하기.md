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
통일성을 망치기 때문에 권장하지 않음.

```html
<script>
window.addEventListener("load", function(){
	var formArr = document.getElementById("f1");
});
</script>
```
id
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE1NjI0MTUxMjBdfQ==
-->
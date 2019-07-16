# Ancestors


-   `parent()`
-   `parents()`
-   `parentsUntil()`


```js
$(document).ready(function(){  
	// span의 직계 부모만 찾기
	$("span").parent();  
});
```
```js
$(document).ready(function(){  
	// span의 모든 부모(조상) 찾기
	$("span").parents();  
});
```

# Descendants

-   `children()`
-   `find()`

```js
// 바로 밑 자식 찾기
$(document).ready(function(){  
$("div").children();  
});
$(document).ready(function(){  
$("div").children("p.first");  
});
```
```js
//후손 찾기
$(document).ready(function(){  
$("div").find("span");  
});
$(document).ready(function(){  
$("div").find("*");  
});
```
# Siblings
-   `siblings()`
-   `next()`
-   `nextAll()`
-   `nextUntil()`
-   `prev()`
-   `prevAll()`
-   `prevUntil()`



# Filtering
- `first()` 
- `last()`  
- `eq()`
- `filter()` 
- `not()`
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTExMzM4MjY3M119
-->
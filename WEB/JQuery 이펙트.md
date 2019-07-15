## hide() & show()

* hide() : object.style.display = 'none';
* show(): object.style.display = `'inline' or 'block'`;


* hide(number)
```HTML
$("button").click(function(){  
	$("p").hide(1000);  	// 1000ms = 1초
});
```
>hide 애니메이션 설정
타임아웃을 설정해 천천히 사라지도록 함

## fadeIn & fadeOut & fadeToggle
* fadeIn = 천천히 나타나기
* fadeOut = 천천히 사라지기
* fadeToggle = fadein + fadeout

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTExNDEwMzM3ODZdfQ==
-->
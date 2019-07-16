`$.get(_URL,callback_);`

`$.post(_URL,data,callback_);`


#### [jQuery.ajax( [settings ] )](https://api.jquery.com/jquery.ajax/#jQuery-ajax-settings)
ajax 타입은 다양한 property를 가지고 있음 (링크 참조)

```js
$.ajax({
	url: 'a.html',
	data: ,			//요청시 전달할 data
	method: 'POST',	// 전송 방식 (default: GET)
	success: function(data, textStatus, jqXHR){
		// 요청이 성공되었을 때 이 function이 자동호출
		// data: 응답 결과가 data로 전송됨
	}
});
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbNzE5OTEyNzhdfQ==
-->
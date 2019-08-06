# JQuery AJAX


#### [jQuery.ajax( [settings ] )](https://api.jquery.com/jquery.ajax/#jQuery-ajax-settings)
JQuery ajax는 다양한 property를 가지고 있음 (링크 참조)

```js
$.ajax({
	url: 'a.html',
	// 요청시 전달할 data
	data: 'id=id1&pwd=p1',
	method: 'POST',	// 전송 방식 (default: GET)
	success: function(data, textStatus, jqXHR){
		// 요청이 성공되었을 때 이 function이 자동호출
		// data: 응답 결과가 data로 전송됨
	}
});
```

```js
$.ajax({
	url: 'a.html',
	// 객체 형태로도 전송 가능
	data: { id: 'id1', pwd: 'p1' },
	method: 'POST',	// 전송 방식 (default: GET)
	success: function(data, textStatus, jqXHR){
		// 요청이 성공되었을 때 이 function이 자동호출
		// data: 응답 결과가 data로 전송됨
	}
});
```

이를 요청 방식별로 축약한 것이

`$.get(_URL,callback_);`
`$.post(_URL,data,callback_);`

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE3Nzk1NDUyMDFdfQ==
-->
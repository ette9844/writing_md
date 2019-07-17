---
layout: post
title:  "JSON에 대하여"
subtitle:   "JSON의 개념과 이를 사용하는 이유"
categories: study
tags: web
---

## JSON 이란?
[JavaScript Object Notation](https://ko.wikipedia.org/wiki/JSON)

## JSON을 사용하는 이유
```html
<tr><th>우편번호</th><th>주소</th></tr>
<tr><td>12345</td><td>주소1</td></tr>
...
```
<p>서버가 응답하는 내용이 길어지면 응답 시간은 조금 길어지지만, client가 하는 일이 적어진다.</p>

<p>브라우저에서 응답을 받으면 응답내용을 parsing할 수 있으나, 안드로이드 앱에는 렌더링 엔진과 js해석기가 없기 때문에 html형태로 응답한 내용을 parsing할 수 없다.</p>

```html
우편번호:주소,12345:주소1,2345:주소2,34567:주소3,...
```
<p>서버가 응답하는 내용이 단순해지면 client에서 할일이 늘어난다.</p>
<p>데이터의 총량이 줄어들어 네트워크의 응답 비용이 감소하지만, 유지보수성이 떨어진다. </p>

***최소한의 가독성을 유지한채 응답 비용을 줄이기 위해 json 형태로 응답을 한다.***

## 장점

-   JSON은 텍스트로 이루어져 있으므로, 사람과 기계 모두 읽고 쓰기 쉽다.
-   [프로그래밍 언어](https://ko.wikipedia.org/wiki/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D_%EC%96%B8%EC%96%B4 "프로그래밍 언어")와  [플랫폼](https://ko.wikipedia.org/wiki/%EC%BB%B4%ED%93%A8%ED%8C%85_%ED%94%8C%EB%9E%AB%ED%8F%BC "컴퓨팅 플랫폼")에 독립적이므로, 서로 다른 시스템간에 객체를 교환하기에 좋다.
- [자바스크립트](https://ko.wikipedia.org/wiki/%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8 "자바스크립트")의 문법을 채용했기 때문에 쉽게 사용할 수 있다.
- 안드로이드 앱에는 json 라이브러리가 제공되기 때문에 안드로이드 앱에서도 json형태로 응답된 내용을 처리할 수 있다.


## JSON
#### json 형태로 응답 작성
```json
[
  {
    "d1":"우편번호",
    "d2":"주소"
  },
  {
    "d1":"12345",
    "d2":"양천구 시흥시 구일234길 롯데타워"
  }
]
```

>[]: 배열
{}: 객체
"property": 프로퍼티(속성)
"value" or value: 숫자값은 "" 필요 없음

#### client에서 json객체 처리하기 (웹)
```js
$.ajax({
	url: '../b.jsp',
	method: 'GET',
	success: function(){
		var jsonObjArr = JSON.parse(data);	// json객체 형태로 변환 (javascript array)
		console.log(jsonObjArr);			// 배열 []

		var trs = "";
		for(var i=0; i<jsonObjArr.length; i++){
			var jsonObj = jsonObjArr[i];	// 객체 {}
			console.log(jsonObj.d1 + ", " + jsonObj.d2);
			trs += "<tr><td>"+jsonObj.d1+"</td><td>"+jsonObj.d2+"</td></tr>";
		}
		$("#divSearchZip>div>table").html(trs);
	}
});
```
<br/>

#### jsp에서 응답 형식을 json 형식으로 했을 경우
```js
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
```
client 처리
```js
$.ajax({
	url: '../b.jsp',
	method: 'GET',
	success: function(jsonObjArr){
		var trs = "";
		for(var i=0; i<jsonObjArr.length; i++){
			var jsonObj = jsonObjArr[i];	// 객체 {}
			trs += "<tr><td>"+jsonObj.d1+"</td><td>"+jsonObj.d2+"</td></tr>";
		}
		$("#divSearchZip>div>table").html(trs);
	}
});
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTYxODIyMzA5Niw1NzczNjUxNzksLTE3Mz
g5OTkxOTIsLTIwOTI1NTI5MjksLTE1NTgzODk2OCwtMTg1ODI3
Nzg4OCwtMTYxNjI5NzM1NywyMDM4MzgzODBdfQ==
-->
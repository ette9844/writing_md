## 기존 a tag

1. a태그 클릭
2. rendering engine이 networking레이어로 내용 전달
3. networking레이어가 서버로 join.html요청
4. 서버에서 networking레이어로 응답
5. renering engine으로 응답내용 전송
6. rendering engine이 기존 화면 지우고 응답내용으로 렌더링

## AJAX
Asynchronous Javascript And Xml 

1. a태그 클릭
2. javascript interpreter단에서 클릭 이벤트 처리
3. javascript interpreter단이 서버로 join.html요청
4. 서버에서 javascript interpreter단으로 응답
5. (화면 지우기x) 응답내용 반영 (시간 절약)

* 장점
-비동기 일처리 가능
-화면 클리어 하지 않음 (시간 절약)

* ajax를 사용하는 대표적인 예: 지도

## XHTTR 
ajax를 사용하기 위한 javascript내장 객체



web의 기본 언어: HTML
web의 기본 프로토콜: http

http 구조: 요청, 응답

## client→server request 구조

![http request](https://www.lifewire.com/thmb/nmUWZwQj44TqI0AR0bnlhDnQfOs=/950x320/filters:no_upscale():max_bytes(150000):strip_icc()/HTTP_RequestMessageExample-5c82b349c9e77c0001a67620.png)
***Request Line***
**GET**: http요청 방식 (GET/POST)
**/doc/test.html**: URL
**HTTP/1.1**: version

### ※ get과 post의 차이

**GET**
- message body 사용 안함. 
- 요청시 전달될 값이 URL뒷부분에 채워짐 
= **query string** (ex. 이름=값&이름=값&... )
- 기본값(default)
 
 **POST**
- message body 사용함. 
- 요청시 전달될 값이 message body에 채워짐.
- GET방식보다 보안상 좋다.
- form태그의 method 속성값이 'post'인 경우
 
 ## server→client response 구조
 ![http response](https://www.ntu.edu.sg/home/ehchua/programming/webprogramming/images/HTTP_ResponseMessageExample.png)
 ***Status Line***
**HTTP/1.1 **: version
**200**: status code 응답 코드
**응답코드가 404일 경우: 404 not found

## 응답 코드 Status Code

![http status code](https://www.steveschoger.com/status-code-poster/img/status-code.png)

<주요 응답 코드>

* 정상 응답	: 200
* Not found: 404
* Method not allowed: 405
* Internal Server Error: 505
<!--stackedit_data:
eyJoaXN0b3J5IjpbNTQzNjI4NzI2LC03MDM5MjMyNzQsMjYzMT
g2ODQyLC0zNDMzOTI3MjBdfQ==
-->
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
**HTTP/1.1**: version
**200**: status code 응답 코드
응답코드가 **404**일 경우: 404 not found

## 응답 코드 Status Code

![http status code](https://www.steveschoger.com/status-code-poster/img/status-code.png)

<주요 응답 코드>

* 정상 응답	: 200
* Not found: 404
* Method not allowed: 405
* Internal Server Error: 505
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEyNTcyMzEwODFdfQ==
-->
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


<!--stackedit_data:
eyJoaXN0b3J5IjpbODE2MTA0MzAzLDE3OTcyNTgwNjhdfQ==
-->
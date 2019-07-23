## 기존
서블릿에서 DB 연결, 연결, 요청 송신, SQL 결과값 받기, DB 닫기 등의 역할을 모두 담당했음.

## 개선

크게 두 가지로 역할 분담
1. 요청에 대한 처리
2. DB와의 일처리 담당

## 서블릿 역할
**요청에 대한 처리** 

클라이언트의 요청 받기
DB CLASS 호출
결과 분석
결과에 따른 응답 생성
응답 송신 등

## DAO
**DB와의 일처리 담당**

**D**ata**A**ccess**O**bject
DB와의 일처리를 담당하는 CLASS


**+) 비지니스 로직**
:DB 연결, 요청 송신, SQL 결과값 받기, DB 닫기


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTg3OTEwNDIxOCwtODE1MjMwMTA2LC03NT
g5NDE1M119
-->
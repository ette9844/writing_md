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


## 예외처리

### 1) 예외 처리를 DAO 내에서 try-catch로 처리
오류 메세지가 Tomcat console에 출력되어, servlet과 사용자UI에서는 어떠한 오류가 발생했는지 확인 불가

반환값을 NULL로 설정할 경우, servlet 개발자는 늘 반환값이 NULL인지를 검사해야한다. (자칫하면 NullPointException에 빠지게 됨)
→ 좋은 코드가 아니다.
### 2) 예외 처리를 throws로 넘겨 servlet에서 처리











**+) 비지니스 로직**
:DB 연결, 요청 송신, SQL 결과값 받기, DB 닫기


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE3NDgyNDIxOCwtODc5MTA0MjE4LC04MT
UyMzAxMDYsLTc1ODk0MTUzXX0=
-->
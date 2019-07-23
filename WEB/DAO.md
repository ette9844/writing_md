## 기존
서블릿에서 DB 연결, 연결, 요청 송신, SQL 결과값 받기, DB 닫기 등의 역할을 모두 담당했음.

## 개선


역할 분담

비지니스 로직: DB 연결, 요청 송신, SQL 결과값 받기, DB 닫기

서블릿 역할: 
요청에 대한 처리 (클라이언트의 요청 받기, 요청 전달 데이터 분석 등)
DB CLASS 호출

DAO: 
DataAccessObject
DB와의 일처리를 담당하는 CLASS
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTc1ODk0MTUzXX0=
-->
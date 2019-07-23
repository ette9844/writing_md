## Service Layer
servlet에서 DAO를 직접 호출하는 게 아닌
servlet은 service layer와 함께 동작하고, service layer에서 DAO를 호출하는 구조.

기능별로 service layer를 생성한다.

※ 현업에서 많이 사용되는 구조: DAO + Service Layer


**Service Layer를 작성하는 이유**
- **재사용성 ↑**: service layer와 DAO는 웹 뿐만 아니라 다른 자바 애플리케이션에서 재사용될 수 있다. 
- **유지 보수**에 좋다.
- servlet의 할일이 줄어듬.

## 구조
**Three Tier 구조**
Client - Server - DB

Server 내에서도 **세가지 레이어**가 있는 구조
servlet, DAO, service layer



<!--stackedit_data:
eyJoaXN0b3J5IjpbMTg1NTAwMTQ2NSwxNDg1Njk3MTQzLC0xMz
YwODMxMjA2XX0=
-->
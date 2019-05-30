## SQLplus 기본 명령어

*oracle의 sqlplus를 이용한 DML 연습에 필요한 환경을 구축하기 위한 명령어*
</BR>
</BR>
>

## 새 사용자 생성하기


**1. SYSTEM 계정으로 접속** 
```
사용자명 입력: system
비밀번호 입력: `Oracle 설치시 등록한 비밀번호`
```
>이 때 주의해야 할 사항은 SQL문을 작성할 때에는 대, 소문자를 구분하지 않지만, 비밀번호 입력시에는 대소문자를 구분한다는 점이다.


**2. 새로운 사용자 생성**
```SQL
CREATE USER `USERNAME` IDENTIFIED BY `PASSWORD`;
```
>해당 사용자의 테이블스페이스를 따로 지정하고 싶을 경우에는 아래 구문을 사용한다.
 ```SQL
 CREATE USER `USERNAME` IDENTIFIED BY `PASSWORD`
 DEFAULT TABLESPACE `TABLESPACE_NAME`
 TEMPORARY TABLESPACE`TABLESPACE_NAME`;
```
**3. 사용자에게 롤 부여하기**
```sql
GRANT DBA TO `USERNAME`;
```
>`USERNAME`에게 DBA 권한을 부여하는 코드

**4. 사용자 계정으로 DB에 접속하기**
```SQL
CONNECT `USERNAME`;
비밀번호 입력: `PASSWORD`
```
>`CONNECT` 구문을 사용하거나
```SQL
CONN `USERNAME`/`PASSWORD`;
```
>`CONNECT`의 축약형인 `CONN`으로 간편하게 접속할 수 있다.
```SQL
SELECT USER FROM DUAL;
```
>접속 후 해당 구문을 통해 현재 로그인한 사용자 이름을 조회할 수 있다.


> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTMxNzc5NzQ3LC00ODM0OTk1MzEsMTM5Mj
M4NTY1MywtMTQ1NDAzNDAxOCwyMTEzNDg3NzUsNjg1MjYwODQ1
LDIwNTc5NjkwNDUsMTgyNzkzMzcyM119
-->
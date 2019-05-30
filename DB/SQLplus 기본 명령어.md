## SQLplus 기본 명령어

*oracle의 sqlplus를 이용한 DML 연습에 필요한 환경을 구축하기 위한 명령어*
</BR>
</BR>
>새 사용자 생성하기
>1. SYSTEM 계정으로 접속 
>```
>사용자명 입력: system
>비밀번호 입력: `Oracle 설치시 등록한 비밀번호`
>```
>##### 이 때 주의해야 할 사항은 SQL문을 작성할 때에는 대, 소문자를 구분하지 않지만, 사용자명/비밀번호 입력시에는 대소문자를 구분한다는 점이다.
>
>2. 새로운 사용자 생성
>```SQL
>CREATE USER `USERNAME` IDENTIFIED BY `PASSWORD`;
>```
> ```SQL
> CREATE USER `USERNAME` IDENTIFIED BY `PASSWORD`;
> DEFAULT TABLESPACE `TABLESPACE_NAME`
>```
	
	

> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTY2NjQ1ODI0OSwyMTEzNDg3NzUsNjg1Mj
YwODQ1LDIwNTc5NjkwNDUsMTgyNzkzMzcyM119
-->
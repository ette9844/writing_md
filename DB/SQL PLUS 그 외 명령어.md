## SQLplus 그 외 명령어

```SQL
CL SCR;
```
>`CLEAR SCREEN` 함수. 
>SQLPLUS CMD화면을 클리어한다.

<BR/>

```SQL
SET LINESIZE 200;
SET PAGESIZE 100;
```
>`LINESIZE`는 한 줄에 출력되는 최대 글자수 조정
>작게 설정하면 행이 끝나기 전에 개행이 되어 보기 힘들다.
>
>`PAGESIZE`는 테이블 헤더 밑에 출력되는 최대 행 수 이다.
>설정한 숫자만큼의 행 마다 테이블 헤더가 붙는다.

<BR/>

```SQL
COL `COLUMN_NAME` FORMAT a20;
```
>`COLUMN_NAME`에 해당하는 컬럼의 간격을 조정한다.
>컬럼의 간격 때문에 가독성이 떨어질 때 사용한다.

```SQL
DESC USER_TABLE
```
Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTM2OTkyNDY1OSwxNjgzNDQ1NDEyLDE5OD
MzMjkyNzMsOTEzNDI3MDldfQ==
-->
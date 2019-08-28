## 동적 SQL
조건에 따라 SQL 구문이 서로 다른 작업을 해야하는 경우 mybatis의 동적 SQL을 사용할 수 있다.
```java
if(test != null)
	sql += " ' ') ";
else
	sql += "";
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTk3NTkxODM4OF19
-->
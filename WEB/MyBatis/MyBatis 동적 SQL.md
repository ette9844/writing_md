## 동적 SQL
조건에 따라 SQL 구문이 서로 다른 작업을 해야하는 경우 mybatis의 동적 SQL을 사용할 수 있다.
```java
String sql = "INSERT INTO board( ~~... ";
if(test != null)
	sql += "' ', ";
else
	sql += board.getParent_no() + ")";
```
mybatis의 동적 sql 조건문은 jstl과 유사한 형태이다.
```xml
<if test="parent_no == 0">
  '',
</if>
 ```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTI1Nzk4MzRdfQ==
-->
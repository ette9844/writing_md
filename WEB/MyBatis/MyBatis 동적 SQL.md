## 동적 SQL
조건에 따라 SQL 구문이 서로 다른 작업을 해야하는 경우 mybatis의 동적 SQL을 사용할 수 있다.
```java
String sql = "INSERT INTO board( ~~... ";
if(test != null)
	sql += " ' ') ";
else
	sql += board.getParent_no() + ")";
```

```xml
<select  id="findActiveBlogWithTitleLike"  resultType="Blog"> SELECT * FROM BLOG
  WHERE state = ‘ACTIVE’ <if  test="title != null"> AND title like #{title} </if>  </select>
 ```
<!--stackedit_data:
eyJoaXN0b3J5IjpbNDczODU1OTA5XX0=
-->
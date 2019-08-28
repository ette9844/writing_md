## 동적 SQL
```java
String sql = "INSERT INTO board(board_seq.NEXTVAL";
if(board.getParent_no == null)
	sql += "' ', ";
else
	sql += board.getParent_no() + ", ";
sql += "?, ?, ?, ?)";
```
조건에 따라 SQL 구문이 서로 다른 작업을 해야하는 경우 mybatis의 동적 SQL을 사용할 수 있다.

mybatis의 동적 sql 조건문은 jstl과 유사한 형태이다.

### if

```xml
<select id="findActiveBlogWithTitleLike"
     resultType="Blog">
  SELECT * FROM BLOG
  WHERE state = ‘ACTIVE’
  <if test="title != null">
    AND title like #{title}
  </if>
</select>
 ```
### choose / when / otherwise
else 구문이 없기 때문에 else 기능을 사용하고 싶다면 choose / when / otherwise 태그를 사용.
```xml
<select id="findActiveBlogLike"
     resultType="Blog">
  SELECT * FROM BLOG WHERE state = ‘ACTIVE’
  <choose>
    <when test="title != null">
      AND title like #{title}
    </when>
    <when test="author != null and author.name != null">
      AND author_name like #{author.name}
    </when>
    <otherwise>
      AND featured = 1
    </otherwise>
  </choose>
</select>
```

### where

### for
<!--stackedit_data:
eyJoaXN0b3J5IjpbODc5OTM1MDM1XX0=
-->
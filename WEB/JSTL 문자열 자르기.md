## JAVA StringTokenizer
```java
String s = "아버지가::방에:들어:가신다";

StringTokenizer st = new StringTokenizer(s, ":");
while(st.hasMoreTokens()){
	String t = st.nextToken();
	System.out.println(t);
}
```
>아버지가
>방에
>들어
>가신다
>
>빈 문자열은 무시

## JAVA split
빈 문자열도 포함하기 위해서는 split 사용
```java
String[] arr = s.split(5, ":"); // 무조건 5개로 자른다
for(String a: arr){
	System.out.println("**"+a+"**");
}
```
>```text
>**아버지가**
>****
>**방에**
>**들어**
>**가신다**
>```
>빈 문자열이 포함되어 5조각으로 split된다.


## JSTL c:forTokens
```html
<c:forTokens var="t" items="아버지가::방에:들어:가신다" delims=":">
  ${t}
</c:forTokens>
```
>JAVA의 stringTokenizer와 동일.
<!--stackedit_data:
eyJoaXN0b3J5IjpbODE4MzQ1NDQxXX0=
-->
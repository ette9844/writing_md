## filter 예제

어떤 요청이 들어오건 간에 요청의 기본 인코딩을 utf-8로 설정하는 filter

이 필터는 아래와 같은 동작을 수행한다.
```java
public class CharacterEncodingFilter implements Filter{
	private String encoding;
	public void init(~~){
		encoding = getInitParameter("encoding");
	}
	public void doFilter(HttpServletRequest request, HttpServletResponse response){
		request.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
	}
}
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTk1MTM5MjIxNl19
-->
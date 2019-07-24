```java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// request: 요청할 때마다 만들어지고 소멸하는 객체
		
		// http://localhost:8080/servlet5/request 			콘솔결과 null
		// http://localhost:8080/servlet5/request?opt= 		콘솔결과 "" (빈문자열)
		// http://localhost:8080/servlet5/request?opt=test 	콘솔결과 test
		// http://localhost:8080/servlet5/request?opt=한글 	콘솔결과 한글
		// chrome은 잘 전달 되지만, IE에서는 Bad request (인코딩이 다르기 때문)
		System.out.println(request.getParameter("opt"));
		
		// 주의: 요청전달이 없으면 null 이므로 NullPointException에 빠질수 있다
		// if(request.getParameter("opt").equals("test"))
		
		// 순서를 바꾸는 것으로 간단하게 해결 가능
		if("test".equals(request.getParameter("opt"))) {}
		
		// http://localhost:8080/servlet5/request?c=JAVA&c=C&c=python
		// http://localhost:8080/servlet5/request
		String[] arr = request.getParameterValues("c");	// 이름은 같고 값이 여러개인 케이스, 배열반환
		
		// arr에 NULL이 들어갈 수 있다
		if(arr != null) {	// 회피
			for(String c: arr) {
				System.out.println(c);
			}
		}
		
		// 경로 관련 함수
		// context = 지금 사용하고 있는 webcontext = servlet5
		String contextPath = request.getContextPath();
		System.out.println(contextPath);			// 결과: /servlet5
		System.out.println(request.getProtocol());	// 결과: HTTP/1.1 (사용중인 protocol)
		System.out.println(request.getRemoteHost());// 결과: 0:0:0:0:0:0:0:1 (원격 호스트 / 현재는 localhost 사용중)
		System.out.println(request.getMethod());	// 결과: GET
		
		System.out.println(request.getRequestURI());// 결과: /servlet5/request (webcontext부터의 path = URI)
		System.out.println(request.getServerName());// 결과: localhost
		System.out.println(request.getServerPort());// 결과: 8080
		System.out.println(request.getServletPath());// 결과: /request
		
		// request header
		// Enumeration : 반복자의 한 종류
		Enumeration<String> names = request.getHeaderNames();
		while(names.hasMoreElements()) {
			String name = names.nextElement();
			System.out.println("<<" + name + ">>");
			Enumeration<String> values = request.getHeaders(name);	// header이름 하나에 해당하는 값이 여러개 일 수 있음
			while(values.hasMoreElements()) {
				String value = values.nextElement();
				System.out.println(value);
			}
			System.out.println("----------------------");
		}
	}
```

```text
----------------------크롬에서 요청했을 때
<<user-agent>>
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36
----------------------IE에서 요청했을 때
<<user-agent>>
Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko
----------------------모바일 웹에서 요청했을 때
<<user-agent>>
Mozilla/5.0 (Linux; Android 9; SAMSUNG SM-G970N Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/9.2 Chrome/67.0.3396.87 Mobile Safari/537.36
```


<!--stackedit_data:
eyJoaXN0b3J5IjpbMTUzNDY4NTkzNV19
-->
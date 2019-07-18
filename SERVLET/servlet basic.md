## Servlet

let = booklet : 소책자, 별책부록 에서 따옴

서버에서 실행되는 특수 어플리케이션
main() 없이 실행

### spec
1) public class
2) extends HttpServlet
3) 요청 방식이 GET인 경우 
`public void doGet(HttpServletRequest, HttpServletResponse)` 를 오버라이딩
4) 요청 방식이 POST인 경우
`public void doPOST(HttpServletRequest, HttpServletResponse)`를 오버라이딩
(servlet 엔진이 자동 호출해주는 메서드)

그 외
**~~Middlet~~** 
모바일에서 실행되는 특수 어플리케이션 (2G)

**~~Applet~~**
웹 브라우저에서 실행되는 특수 어플리케이션
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE2MjQ2Mzc3NDddfQ==
-->
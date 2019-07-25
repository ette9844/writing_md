```html
<div>
  <h3>JSP 구성요소</h3>
  <ul>
    <li>html요소</li>
      <!-- html 주석 : out.write의 인자가 된다-->
    </li>
    <li>JSP 요소
      <%--jsp 주석 : jsp.java파일이 만들어 질때 제외됨. out.write의 인자 x--%>
      <%--보안상 jsp 주석을 사용하는 것을 권장. : 페이지 소스 보기에 jsp 주석이 표기되지 않음--%>
    </li>
  </ul>
</div>
```

### scriptlet
**<% %>**

서버 쪽에서 실행 될 java 구문
= `_jspService()`내부에 저장 될 java 구문
= 요청시마다 처리 될 java 구문

```java
<li>scriptlet: _jspService()내부에 저장될 자바구문: 요청시마다 처리될 구문
<% int num = 1;
   System.out.println(num);
   out.print(num);
%><br>
<% out.print(request.getParameter("opt");
%><br>
<% out.print(new java.util.Date());
%></li>
```

>`int num`: _jspService()내부에 선언되는 지역 변수
>`out.print(num)`: _jsp.java 파일 내부의 out 변수등 _jsp.java 파일 내에 선언되어 있는 변수를 사용할 수 있다.
> `out.print(request.getParameter("opt")`: _jsp.java 파일 내부의 request, response등 _jspService의 매개변수를 사용할 수 있다.
> `out.print(new java.util.Date())`: java의 다양한 library도 사용할 수 있다.

**미세 팁:** 
eclipse에서 jsp오류가 없는데도 빨간 줄이 안없어질 경우에는 편집기에 열려있는 jsp 파일을 닫았다가 다시 열어준다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEyNDcyNjk4NDYsLTI4OTk5OTcxNiwxOT
U0OTUzNTg5LC0yMDUwNDAyNTAxLDE4MDAxOTMzODZdfQ==
-->
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

scriptlet: 
<% %>
서버 쪽에서 실행될 java 구문 작성
_jspService()내부에 저장될 java 구문
<!--stackedit_data:
eyJoaXN0b3J5IjpbMjA4MzQ3MzQ1LDE4MDAxOTMzODZdfQ==
-->
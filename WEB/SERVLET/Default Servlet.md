## 톰캣 web.xml의 default servlet

```html
<servlet>
  <servlet-name>dafault</servlet-name>
  <servlet-calss>DefaultServlet</servlet-class>
</servlet>
<servlet-mapping>
  <servlet-name>default</servlet-name>
  <url-pattern>/</url pattern>
</servlet-mapping>
```


## 톰캣의 DefaultServlet의 역할
1. 요청 분석한 uri값이 html, jpg, png, css, js, txt 확장자를 포함하면 uri용 자원 찾기, 응답출력스트림으로 쓰기. -> spring으로 해결 가능

2. 그 외의 확장자 (.do, .sds, cns ... 등)인 경우에는 웹 컨텍스트\WEB-INF\web.xml에 설정된 url-pattern으로 처리


**웹 컨텍스트\WEB-INF\web.xml**
```html
<servlet>
  <servlet-name>dispatcher</servlet-name>
  <servlet-calss>DispatcherServlet</servlet-class>
</servlet>
<servlet-mapping>
  <servlet-name>dispatcher</servlet-name>
  <url-pattern>/</url pattern>
</servlet-mapping>
```
default servlet을 덮어쓴다
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTk4ODY4NjE0Nl19
-->
## 톰캣 web.xml의 default servlet

```html
<servlet>
<servlet-name>dafault
```


## 톰캣의 DefaultServlet의 역할
요청 분석한 uri값이 html, jpg, png, css, js, txt 확장자를 포함하면 uri용 지원 찾기, 응답출력스트림으로 쓰기.

그 외의 확장자 (.do, .sds, cns ... 등)인 경우에는 웹 컨텍스트\WEB-INF\web.xml에서 알아서 처리
<!--stackedit_data:
eyJoaXN0b3J5IjpbNTAzNTYwMDAwXX0=
-->
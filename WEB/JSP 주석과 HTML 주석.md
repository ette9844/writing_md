---
layout: post
title:  "[JSP] JSP 주석 처리"
subtitle:   "JSP에서의 HTML과 JSP 주석 처리의 비교"
categories: study
tags: web, jsp
---

## HTML 주석

```html
<!-- html 주석 -->
```
>`out.write`의 인자가 된다

## JSP 주석
```java
<%-- jsp 주석 --%>
```
>_jsp.java 파일이 만들어 질때 **제외됨**.
>`out.write`의 인자가 되지 않는다.
>보안상 jsp 주석을 사용하는 것을 권장. : 페이지 소스 보기에 jsp 주석이 표기되지 않음
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTg5MDQ3Njg0Ml19
-->
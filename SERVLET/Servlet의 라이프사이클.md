## Servlet의 Life Cycle

1. 객체 생성
2. init() 메서드 자동 호출
3. HttpServletRequest,
    HttpServletResponse 객체 생성
4. service() 자동 호출
   - GET: doGet(.., ..) 자동 호출
   - POST: doPost(.., ..) 자동 호출


init
service
doPost
doGet
destroy

forwarding

MVC구조
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIwMDE1MDY4MTYsNTA4NTYxMDY2XX0=
-->
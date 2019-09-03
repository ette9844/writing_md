## 매개변수를 통해 요청 값을 받아오는 방식
요청: contextPath/join?id=id1&pwd=pwd1&name=name1&addr2=addr2&buildingno=buildingno
```java
@RequestMapping("/join")
public ModelAndView join(String id
					   , String pwd
					   , String name
					   , String addr2
					   , String buildingno) {
	// Customer 객체 생성
	Customer c = new Customer();
	c.setId(id);
	c.setPwd(pwd);
	c.setName(name);
	c.setAddr(addr2);
	Post p = new Post();
	p.setBuildingno(buildingno);
	c.setPost(p);

	String str = service.join(c);

	ModelAndView mnv = new ModelAndView();
	mnv.addObject("result", str);
	mnv.setViewName("/result.jsp");

	return mnv;
}
	
```

## 객체의 setter 메서드를 통해 자동 전달되는 방식
요청으로 전달되는 매개변수가 많을 때 유용하게 사용된다.

```java
@RequestMapping("/join")
public ModelAndView join(Customer c) {
	System.out.println(c.getId() + " : " 
			+ c.getPwd() + " : " 
			+ c.getName());
			+ 
	String str = service.join(c);
	
	ModelAndView mnv = new ModelAndView();
	mnv.addObject("result", str);
	mnv.setViewName("/result.jsp");
	
	return mnv;
}
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbNjkzNzY1MDkxXX0=
-->
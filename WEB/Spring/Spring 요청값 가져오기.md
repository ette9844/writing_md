## 매개변수를 통해 요청 값을 받아오는 방식
요청: contextPath/join?id=id1&pwd=pwd1&
```java
//	@RequestMapping("/join")
//	public ModelAndView join(String id
//						   , String pwd
//						   , String name
//						   , String addr2
//						   , String buildingno) {
//		// Customer 객체 생성
//		Customer c = new Customer();
//		c.setId(id);
//		c.setPwd(pwd);
//		c.setName(name);
//		c.setAddr(addr2);
//
//		Post p = new Post();
//		p.setBuildingno(buildingno);
//		c.setPost(p);
```
```java
	// Customer 객체의 setter 메서드를 통해 자동 전달되는 방식 ( 매개변수가 확 줄어듬 ) 
	// Customer c: command 객체
	@RequestMapping("/join")
	public String join(Customer c) {
		System.out.println(c.getId() + " : " 
				+ c.getPwd() + " : " 
				+ c.getName());
		//String str = service.join(c);

		//ModelAndView mnv = new ModelAndView();
		//mnv.addObject("result", str);
		//mnv.setViewName("/result.jsp");
		return "/result.jsp";
	}
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTg1NDMxNTgyOV19
-->
요청: contextPath/join?id=id1&pwd=pwd1&name=name1&addr2=addr2&buildingno=buildingno

## 매개변수를 통해 요청 값을 받아오는 방식
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
	String path = "/result.jsp";

	ModelAndView mnv = new ModelAndView();
	mnv.addObject("result", str);
	mnv.setViewName(path);
	return mnv;
}
```
>매개변수 이름을 요청전달 된 변수 이름과 동일하게 설정하거나
>@RequestParam("~") 을 통해 다른 이름으로 설정할 수 있다.
>@RequestParam(required="true"): 패러미터 요청전달 데이터가 반드시 전달되어야 한다.

## Command Object를 통해 전달되는 방식
요청으로 전달되는 매개변수가 많을 때 유용하게 사용된다.

아래 예제의 Customer c 처럼 
**HTTP**에서 들어오는 각 속성값들을 자동적으로 커맨드 객체에 바인딩하여 처리할 수 있게한 객체를 **Command 객체**라고 한다.
```java
@RequestMapping("/join")
public ModelAndView join(Customer c, 
				   String buildingno, 
				   @RequestParam("addr2") String addr) {
	Post post = new Post();
	post.setBuildingno(buildingno);
	c.setPost(post);
	c.setAddr(addr);
		
	String str = service.join(c);
	String path = "/result.jsp";

	ModelAndView mnv = new ModelAndView();
	mnv.addObject("result", str);
	mnv.setViewName(path);
	return mnv;
}
```
>자동 바인드 되지 않는 요소는 따로 매개변수로 받아 설정해줘야한다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbMzgyNzUwMTA3LDEzOTk5NjUwMDldfQ==
-->

## List & Set & Map

|  | List | Set | Map |
|--|--|--|--|
|  | Collection| Collection| Map |
|index|순차 저장<br>중복 저장|index없음<br>중복 불가|index 없음<br>값 중복 허용<br>키 중복 불가|



```java
public class Product{
	p1 = new Product();
	p2 = new Product();
	
	p1.setProd_no("10001");
	p2.setProd_no("10001");
	
	map.put(p1, 3);	 // 서로 다른 객체이기 때문에 2개 3개 따로 map에 들어감
	map.put(p2, 2);
	
	Product 3 = new Product();
	p3.setProd_no("10001");
	map.get(p3);	// 메모리 번지 수가 다르기 때문에 찾지 못함
}
```

상품 번호가 같을때 서로 같은 객
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE5Mjk2MDAzOV19
-->
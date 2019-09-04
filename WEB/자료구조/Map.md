
## List & Set & Map

|  | List | Set | Map |
|--|--|--|--|
|  | Collection| Collection| Map |
|index|순차 저장<br>중복 저장|index없음<br>중복 불가|index 없음<br>값 중복 허용<br>키 중복 불가|


## Map

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
>메모리 번지 수가 다른 객체는 다른 것으로 인식함. 
>


상품 번호가 같을때 같은 객체로 인식하고 값을 누적시키게 하고 싶다면?
>equals 메서드 오버라이딩
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEwMDgzNjUxODFdfQ==
-->
## Category Table
```
cate_no 		number(1)		CONSTRAINT pk_cate_no PRIMARY KEY
cate_parent_no	number(1)
cate_name 		varchar2(30)	NOT NULL
```
```
cate_no		cate_parent_no		cate_name
1			null				음료
2			null				상품
3			1					에스프레소
4			1					콜드브루
```
>대분류와 소분류 사용
>cate_parent_no == null 인 카테고리가 대분류 카테고리

Product Table
```
prod_no		prod_cate_no	prod_name 				prod_price	prod_detail
10001		3				플로랄 스타벅스 더블 샷		3000		스타벅스만의 시그니처 메뉴인 더블샷에 꽃향 가득한 얼 그레이 풍미를 함께 즐길 수 있는 20주년 기념 음료
10002		3				에스프레소 콘 파냐			4000		에스프레소 샷에 풍부한 휘핑크림을 얹은 강렬하고 달콤한 음료
10003		4				나이트로 쇼콜라			4000		초콜릿과 견과류의 풍미, 초콜릿 파우더 토핑, 풀 바디감의 새로운 나이트로 콜드 브루
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMjA2NDE3ODY4Ml19
-->
## 요구 사항
1. master-master replication, 양방향 복제를 지원할 것
2. AWS 상 RDS 복제를 지원할 것
3. 이기종 DBMS 간 복제를 지원할 것
4. 실시간으로 synchronized 될 것
5. Java 환경에서 작동할 것
6. open source 일 것 (option)

## Oracle GoldenGate
[https://www.oracle.com/kr/middleware/technologies/goldengate.html](https://www.oracle.com/kr/middleware/technologies/goldengate.html)
### 장점
AWS 상 RDS 복제 지원
이기종 DBMS 간 복제 지원

### 단점
AWS 에서 GoldenGate를 활용한 이기종 DBMS 간 복제 미지원: [참조](https://docs.aws.amazon.com/ko_kr/AmazonRDS/latest/UserGuide/Appendix.OracleGoldenGate.html)
불안정성


## AWS DMS
[https://aws.amazon.com/ko/dms/](https://aws.amazon.com/ko/dms/)
Amazon Web Service Database Migration Service

### 장점
AWS 상 RDS 복제 지원
이기종 DBMS 간 복제 지원
다양한 AWS 서비스와의 연동

### 단점
논리적으로 분리되지 않은 테이블의 양방향 복제를 권장하지 않음.
(복제 loop의 위험성): [참조](https://aws.amazon.com/ko/dms/faqs/?nc=sn&loc=6)
비용

## AWS read-write replication
[https://docs.aws.amazon.com/ko_kr/AmazonRDS/latest/UserGuide/USER_ReadRepl.html](https://docs.aws.amazon.com/ko_kr/AmazonRDS/latest/UserGuide/USER_ReadRepl.html)
### 장점
read 담당 DB와 write 담당 DB를 나눔으로써 부하 분산 효과

### 단점
asynchronous (master DB가 변경될 때 마다 slave DB 업데이트)
sharding-rule 수정 필수
비용

## Symmetric DS
[https://www.symmetricds.org/](https://www.symmetricds.org/)
### 장점
오픈 소스
트리거 -> pulling 방식
master-master replication 지원
AWS 인스턴스로 등록하여 RDS 복제 가능: [참조](https://medium.com/data-weekly/deploying-symmetricds-to-aws-ecs-596e4ebe056f)

### 단점
asynchronous (periodic or near real-time)
Gradle 사용
Java 버전 8 이상 요구


## ~~Flyway~~
[https://flywaydb.org/](https://flywaydb.org/)
Java based Schema Migration tool
Database Schema 형상 관리
### 장점
오픈 소스
Java 기반
AWS RDS 복제 지원
Spring boot plugin 제공

### 단점
asynchronous - 명령어 실행 시 migrate
단방향 migration
이기종 DBMS간 복제 미지원
DB 변경 마다 java 클래스명, sql 파일명에 버전 명시 필요 

## ~~Liquibase~~
[http://www.liquibase.org/](http://www.liquibase.org/)
Database schema 형상 관리
### 장점
이기종 DBMS간 복제 지원
오픈소스 (프리 티어)

### 단점
asynchronous 
테이블 변경 SQL에 로그 파일 작성 필요

## Peer to Peer Transaction Replication
[https://docs.microsoft.com/ko-kr/sql/relational-databases/replication/transactional/peer-to-peer-transactional-replication?view=sql-server-ver15](https://docs.microsoft.com/ko-kr/sql/relational-databases/replication/transactional/peer-to-peer-transactional-replication?view=sql-server-ver15)
### 장점
실시간 synchronized
master-master replication 지원

### 단점
Microsoft SQL Server only
이기종 DBMS간 복제 미지원
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTg4ODEyOTI4M119
-->
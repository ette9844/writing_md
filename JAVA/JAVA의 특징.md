## 자바 언어의 특징

* 객체 지향 언어
* 플랫폼에 독립적
* JVM이 메모리 관리
* ~~API가 많다~~ → 이제는 다른 언어가 더 많다

## 객체지향언어
* **객체지향언어의 종류**
JAVA, Python, C++, C# 등

* **객체지향언어의 조건**
	>상속
캡슐화
다형성	

* **객체지향언어의 목적**
클래스의 **재사용성**을 높이자

## 캡슐화

접근제어자를 통해 접근을 통제하고 getter setter로 캡슐화 한다.

## 다형성
-오버로딩 / 오버라이딩
-interface는 클래스가 아니므로 interface를 상속받아 하위클래스에서 재정의 하는 것은  엄밀히 말해 오버라이딩이 아님

<Overload:오버로드>
메서드들의 목적은 같으나 기능의 내용이 다른 것
int plus(int a, int b) { return a+b; }
double plus(double a, double b) { return a+b; }

<Override:오버라이드>
static void m(S s) {
	sysout("우리 회사의 주력사업은:" + s.toString());
}
public static void main() {
	// S s = newS();
	S s = new SE(); 	// 부모타입으로 업캐스팅
	SE s = new SE();
	m(s);		
}
-------------------------------------------------------------------------------
class S {
	String toString() { return "설탕"; }
}

class SE extends S {
	String toString() { return "전자"; }
}

class SD extends S {
	String toString() { return "디스플레이"; }
}

-------------------------------------------------------------------------------
// 오버라이딩을 하지 않아 결합도가 높은 코드
static void m(S s) {
	String str = "";
	if(s instanceof SE)
		str = "전자";
	else if(s instenceof SD)
		str = "디스플레이";
	else 
		str = "설탕";
	sysout("우리 회사의 주력사업은:" + str);
}


*플랫폼에 독립적:
-Windows OS에서 컴파일한 .class파일을 다른 OS (Linux/Mac/Unix등)에 붙여넣기 한 후 실행 가능하다.
-컴파일러와 실행기(인터프리터)가 분리되어 있어야 함.

*JVM이 메모리 관리
-실행하려면 JVM이 필요하다.

★★클래스 실행 순서★★
ex) 
C:\bin\A.java 내용
class A {
	int i;
	static int si;
	public static void main(String[] args) {
		Class.forName("com.my.Other");
		A a = new A(); // A객체가 생성되었을 때에 비로소 HEAP 메모리에 할당 됨
	}
}
			// 한번 로드된 클래스는 JVM 메모리에 계속 남아있음
C:\> java -cp bin A	// 총 4개의 클래스가 로드 됨
cp: classpath
classpath에서 클래스를 찾지 못하면 java 기본 라이브러리 경로에서 찾는다

1) C:\bin\A.class 파일 찾기
2) A.class 파일을 JVM에 올린다/옮긴다 = 로딩	// 3개의 클래스 로드
(★★로드 타임 다이나믹 로드: 컴파일시에(main실행 전에) 자동으로 로드)
3) 바이트 코드 검증
4) 바이트 코드의 내용을 바이너리(0,1)로 재해석 
(재해석하는 과정에서 새로운 클래스가 나오면 그 클래스를 JVM에 로드)
5) class 영역에 기억시킴 
6) static 변수 자동 초기화 -> 클래스가 언로드 될때까지 메모리에 남아있음 = liftscope이 길다
(메모리에 오래 남아있음: 그렇기 때문에 되도록 안 쓰는 것이 좋다-> 객체간에 값을 넘겨주는 형태로)
7) main() 호출		// Other 클래스 로드
(★★런타임 다이나믹 로드: 실행시에 클래스를 찾아서 로드)


7+) jvm STACK 메모리에 main fragment에 args 매개변수를 할당


<!--stackedit_data:
eyJoaXN0b3J5IjpbMjU2NjQxNTUyXX0=
-->
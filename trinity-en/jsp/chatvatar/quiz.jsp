<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 {
      "test" : [
{"quest" : "End of method. run. java.lang.RuntimeException: Problem ", "answers" : [{"answer":"public class Threads2 implements Runnablee {<BR>
 public void run() {
  System.out.println(\"run.\");
  throw new RuntimeException(\"Problem\");
 }

 public static void main(String[] args) {
  Thread t = new Thread(new Threads2());
  t.start();
  System.out.println(\"End of method.\");
 }
}"}]},
{"quest" : "It is possible for more than two threads to deadlock at once", "answers" : [{"answer":"Which statements are true"}]},
{"quest" : "This code does NOT compile unless \"obj.wait()\" is replaced with \"((Thread) obj).wait()\" ", "answers" : [{"answer":"void waitForSignal() {
  Object obj = new Object();
  synchronized (Thread.currentThread()) {
   obj.wait();
   obj.notify();
  }
 }"}]},
{"quest" : "The output could be 6-1 6-2 5-1 5-2 ", "answers" : [{"answer":"class PingPong2 {
 synchronized void hit(long n) {
  for (int i = 1; i < 3; i++)
   System.out.print(n + \"-\" + i + \" \");
 }
}

public class Tester implements Runnable {
 static PingPong2 pp2 = new PingPong2();

 public static void main(String[] args) {
  new Thread(new Tester()).start();
  new Thread(new Tester()).start();
 }

 public void run() {
  pp2.hit(Thread.currentThread().getId());
 }
}"}]},
{"quest" : "An exception is thrown at runtime. ", "answers" : [{"answer":"public class Threads4 {
 public static void main(String[] args) {
  new Threads4().go();
 }

 public void go() {
  Runnable r = new Runnable() {
   public void run() {
    System.out.print(\"foo\");
   }
  };
  Thread t = new Thread(r);
  t.start();
  t.start();
 }
}"}]},
{"quest" : "An exception is thrown at runtime", "answers" : [{"answer":" void waitForSignal() {
  Object obj = new Object();
  synchronized (Thread.currentThread()) {
   obj.wait();
   obj.notify();
  }
 }"}]},
{"quest" : "public class Circle extends Shape {
 private int radius;

 public void draw() {
  /* code here */}
}", "answers" : [{"answer":"public abstract class Shape {
 private int x;
 private int y;

 public abstract void draw();

 public void setAnchor(int x, int y) {
  this.x = x;
  this.y = y;
 }
}"}]},

{"quest" : "Object Oriented", "answers" : [{"answer":"In Java, everything is an Object. Java can be easily extended
since it is based on the Object model"}]},
{"quest" : "Platform Independent", "answers" : [{"answer":"Unlike many other programming languages including C
and C++, when Java is compiled, it is not compiled into platform specific machine, rather into -------- --------- byte code. This byte code is distributed over the web and interpreted by the Virtual Machine (JVM) on whichever platform it is being run on.
"}]},
{"quest" : "Simple", "answers" : [{"answer":"Java is designed to be easy to learn. If you understand the basic concept of OOP Java, it would be easy to master"}]},
{"quest" : "Architecture-neutral", "answers" : [{"answer":"Java compiler generates an -------------- object
file format, which makes the compiled code executable on many processors, with the presence of Java runtime system"}]},
{"quest" : "Portable", "answers" : [{"answer":"Being architecture-neutral and having no implementation dependent aspects of the specification makes Java ---------. Compiler in Java is written in ANSI C with a clean portability boundary, which is a POSIX subset"}]},
{"quest" : "Robust", "answers" : [{"answer":"Java makes an effort to eliminate error prone situations by emphasizing mainly on compile time error checking and runtime checking.
"}]},
{"quest" : "Multithreaded", "answers" : [{"answer":"With Java's ----------- feature it is possible to write programs
that can perform many tasks simultaneously. This design feature allows the developers to construct interactive applications that can run smoothly"}]},
{"quest" : "Interpreted", "answers" : [{"answer":"Java byte code is translated on the fly to native machine
instructions and is not stored anywhere. The development process is more rapid and analytical since the linking is an incremental and light-weight process."}]},
{"quest" : "High Performance", "answers" : [{"answer":"With the use of Just-In-Time compilers, Java enables ----- ---------"}]},
{"quest" : "Distributed", "answers" : [{"answer":"Java is designed for the --------- environment of the internet."}]},
{"quest" : "Dynamic", "answers" : [{"answer":"Java is considered to be more --------- than C or C++ since it is
designed to adapt to an evolving environment. Java programs can carry extensive amount of run-time information that can be used to verify and resolve accesses to objects on run-time"}]},
{"quest" : "Object", "answers" : [{"answer":"--------- have states and behaviors. Example: A dog has states - color, name, breed as well as behavior such as wagging their tail, barking, eating. An ---------- is An instance of A class"}]},
{"quest" : "Class", "answers" : [{"answer":"A ------ can be defined as a template/blueprint that describes the
behavior/state that the object of its type supports"}]},
{"quest" : "Methods", "answers" : [{"answer":"A -------- is basically a behavior. A class can contain many -------.
It is in ------- where the logics are written, data is manipulated and all the actions are executed"}]},
{"quest" : "Instance Variables", "answers" : [{"answer":"Each object has its unique set of ------ --------. An object's state is created by the values assigned to these ------- -------"}]},
{"quest" : "Access Modifiers", "answers" : [{"answer":"default, public , protected, private"}]},
{"quest" : "Non-access Modifiers", "answers" : [{"answer":"final, abstract, strictfp"}]},
{"quest" : "Interface", "answers" : [{"answer":"In Java language, an ------- can be defined as a contract between objects on how to communicate with each other. ------- play a vital role when it comes to the concept of inheritance"}]},
{"quest" : "Inheritance", "answers" : [{"answer":"----------- hierarchies super and sub classes, Member access rules, super keyword, preventing ---------: final classes and methods, the Object class and its methods"}]},
{"quest" : "Polymorphism", "answers" : [{"answer":"When one task is performed by different ways
dynamic binding, method overriding, abstract classes and methods.
Interfaces- Interfaces Vs Abstract classes, defining an interface, implement interfaces, accessing implementations through interface references, extending interface"}]},
{"quest" : "Encapsulation", "answers" : [{"answer":"Binding (or wrapping) code and data together into a single unit"}]},
{"quest" : "Constructor", "answers" : [{"answer":"special type of method that is used to initialize the object
invoked at the time of object creation"}]},
{"quest" : "Garbage Collection", "answers" : [{"answer":"process of reclaiming the runtime unused memory automatically. In other words, it is a way to destroy the unused objects."}]},
{"quest" : "super", "answers" : [{"answer":"is used to refer immediate parent class instance variable"}]},
{"quest" : "final", "answers" : [{"answer":"It can be initialized in the constructor only
The blank ------- variable can be static also which will be initialized in the static block only"}]},
{"quest" : "Method overriding", "answers" : [{"answer":"provide specific implementation of a method that is already
provided by its super class"}]},
{"quest" : "Exception Handling", "answers" : [{"answer":"powerful mechanism to handle the runtime errors so that normal flow of the application can be maintained"}]},
{"quest" : "Error", "answers" : [{"answer":"irrecoverable , OutOfMemoryError, VirtualMachineError, AssertionError"}]},
{"quest" : "finally block", "answers" : [{"answer":"block that is used to execute important code such as closing connection, stream .  always executed whether exception is handled or not"}]},
{"quest" : "final", "answers" : [{"answer":"It can be initialized in the constructor only
The blank ------- variable can be static also which will be initialized in the static block only"}]},
{"quest" : "Method overriding", "answers" : [{"answer":"provide specific implementation of a method that is already
provided by its super class"}]},
{"quest" : "Exception Handling", "answers" : [{"answer":"powerful mechanism to handle the runtime errors so that normal flow of the application can be maintained"}]},
{"quest" : "Error", "answers" : [{"answer":"irrecoverable , OutOfMemoryError, VirtualMachineError, AssertionError"}]},
{"quest" : "finally block", "answers" : [{"answer":"block that is used to execute important code such as closing connection, stream .  always executed whether exception is handled or not"}]},
{"quest" : "Method Area", "answers" : [{"answer":"클래스 정보를 처음 메모리로 올릴 때 초기화 되는 대상을 저장하기 위한 메모리 공간. 클래스와 인터페이스에 대한 런타임 상수 풀, 멤버변수, 클래스 변수 등을 저장. 메소드의 컴파일된 바이트코드, static 변수가 저장되는 시점이 클래스가 메모리에 올라가는 시점이다."}]},
{"quest" : "Heap Area", "answers" : [{"answer":"new 키워드, 인스턴스, 배열 등 생성된 객체에 대한 메모리를 동적으로 할당. 애플리케이션 영역에 접근할 수 있는 메모리의 메인 영역이다. Thread 에서 공유하는 영역. 참조하는 변수나 필드가 없다면 GC(Garbage Collection) 의 대상이 된다"}]},
{"quest" : "Stack Area", "answers" : [{"answer":"지역변수, 매개변수 (메소드 내에서만 유효한 변수), 객체의 참조, 메소드를 저장. 메소드 실행이 완료되면 전부 소멸한다"}]},
{"quest" : "Personal Cloud", "answers" : [{"answer":"소비자들이 스마트폰, 미디어 태블릿, 텔레비전, PC 같은 다수의 커넥티드 단말을 통해 인터넷에 연결하여 자신의 콘텐츠를 완벽하게 저장, 동기화, 스트림, 공유할 수 있도록 해주는 서비스"}]},
{"quest" : "Connected Device", "answers" : [{"answer":"무선랜 또는 3G같은 Wiress WAN 등의 무선 네트워크와 연결되어 새로운 서비스를 제공할 수 있는 휴대용 기기"}]},
{"quest" : "Crowdsourcing", "answers" : [{"answer":"대중(Crowd)와 외부자원(Outsourcing)의 합성어로 제품/서비스 개발 과정에 외부 전문가나 일반 대중이 참여할 수 있도록 하고,참여자 기여로 혁신을 달성할 경우 수익을 참여자와 공유하는 방법"}]},
{"quest" : "Map Reduce", "answers" : [{"answer":"페타바이트 이상의 대용량 데이터를 신뢰할 수 없는 컴퓨터로 구성된 클러스터 환경에서 병렬 처리를 지원하기 위해서 구글에서 개발한 소프트웨어 프레임워크(방법론)"}]},
{"quest" : "Hadoop", "answers" : [{"answer":"대량의 자료를 처리할 수 있는 큰 컴퓨터 클러스터에서 동작하는 분산 응용 프로그램을 지원하는 자유 자바 소프트웨어 프레임워크"}]},
{"quest" : "geosocial", "answers" : [{"answer":"소셜네트워크 서비스와 연동을 통해 현재 자신의 위치를 친구들과 공유하고 근처에 친구가 있는지를 알아보거나 자신의 방문 기록을 남길 수 있는 서비스"}]},
{"quest" : "Smartmeter", "answers" : [{"answer":"소비자들이 가정이나 회사 등에서 사용하는 에너지(전기, 가스 등) 사용량 및 사용요금 등을 모니터링 할 수 있는 계량기 및 데이터 전송시스템을 통칭"}]},
{"quest" : "Patene Trolls", "answers" : [{"answer":"개인 또는 기업으로부터 특허기술을 사들여 특허를 선점해 로열티를 받아내는 회사"}]},
{"quest" : "Malware", "answers" : [{"answer":"사용자의 의사와 이익에 반해 시스템을 파괴하거나 정보를 유출하는 등 악의적 활동을 수행하도록 의도적으로 제작된 소프트웨어로 malcious software(악의적 소프트웨어)의 약자"}]},
{"quest" : "Green Photonics", "answers" : [{"answer":"에너지 보존과 Carbon footprint(제품 생산에서 폐기까지의 과정에서 직간접적으로 발생하는 이산화탄소) 절감을 위해 포토닉스 기술을 활용하는 것으로 태양과 발전 기술, LED 고효율화 기술, 레이저를 이용한 정밀측정 기술 등을 총칭"}]},
{"quest" : "Google Effect", "answers" : [{"answer":"정보접근이 가능한 컴퓨터가 있는 경우, 인간은 정보 자체를 기억하려하기 보다 오히려 정보를 저장한 곳을 기억하려 함
사람들은 컴퓨터를 가장 중요한 정보 수집원으로 활용하며 이를 활용할 경우 주변인과 대화가 줄어드는 경향을 보임
인간은 찾기 쉬운 정보일수록 더욱 기억하지 못하는 경향이 있음"}]},
{"quest" : "Machine to Machine", "answers" : [{"answer":"‘사람과 사물’, ‘사물과 사물’간 지능통신 서비스를 언제 어디서나 안전하고 편리하게 실시간 이용할 수 있는 미래 방송통신 융합 ICT인프라"}]},
{"quest" : "Search Engine Optimization", "answers" : [{"answer":"검색엔진의 검색 결과에 악성코드가 삽입된 페이지를 노출하고, 이용자에게 허위 검색 결과를 보여주어 결제를 유도하는 공격"}]},
{"quest" : "Cyber-Bullying", "answers" : [{"answer":"이메일, 문자 메시지, 인터넷 메신저 등을 통해 친구에게 모욕이나 위협을 주는 메시지를 보내거나, 소문을 퍼뜨리고 모욕적인 사진 등을 공유하는 행위"}]},
{"quest" : "네트워크 준비지수(NIRI)", "answers" : [{"answer":"세계경제포럼(WEF)에서 각 국의 ICT 발전도와 경쟁력을 평가하는 지수로 각 국의 1)시장.규제.인프라 등 환경 2.개인.기업.정부의ICT 이용 준비도 3)실제 ICT 활용 등 3대 분야에서 7개 세부항목을 평가"}]},
{"quest" : "Infortainment", "answers" : [{"answer":"차량 내 내비게이션, 오디오와 비디오 그리고 인터넷을 결합한 시스템을 의미"}]},
{"quest" : "Yettie", "answers" : [{"answer":"젋고(Young) 기업가적(Enterpreneurial) 기술에 바탕을 둔(Tech-based) 인터넷 엘리트(Internet Elite)를 뜻하는 용어로 정보기술이 선도하는 디지털 시대의 새로운 인간군을 지칭"}]},
{"quest" : "니트(NEET)족", "answers" : [{"answer":"Not in Education, Employmentor Traning 의 약자로 일하지 않고 일할 의지도 없는 청년 무직자를 의미하는 신조어"}]},
{"quest" : "Universal Design", "answers" : [{"answer":"‘평생 디자인’이라고도 하며 비장애인 뿐 아니라 일시적 장애를 포함한 모든 장애인과 어린이, 노인이 사용할 수 있는 환경과 상품 창조를 추구하는 행위를 말하며, 최근 IT 관련 상품과 서비스 및 환경에도 적용"}]},
{"quest" : "스플로거", "answers" : [{"answer":"타인의 콘텐츠를 무단 복사하여 자신의 블로그에 게재하는 사람 또는 제품광고나 음란물 등을 유표하는 광고성 블로거"}]},
{"quest" : "인포데믹스", "answers" : [{"answer":"정보와 전염병의 합성어로 부정확한 정보 확산으로 발생하는 각종 부작용을 지칭"}]},
{"quest" : "벨크로 조직", "answers" : [{"answer":"지식, 경험을 뒷받침하는 정보시스템이 정착됨에 따라 역할에 따른 책임과 권한이 부여되는 유연,탄력적 조직 형태"}]},
{"quest" : "버즈 마케팅", "answers" : [{"answer":"소비자들이 자발적으로 상품 및 서비스에 대한 긍정적인 소문을 내도록 하는 마케팅 기법"}]},
{"quest" : "메타버스", "answers" : [{"answer":"가공, 추상을 의미하는 메타(meta)와 현실 세계를 의미하는 유니버스(Universe)의 합성어로 3차원 가상세계를 의미"}]},
{"quest" : "망중립성", "answers" : [{"answer":"통신망사업자가 특정 콘텐츠나 서비스를 고객이 이용하지 못하게 차단하거나, 전송속도 등을 이용하여 콘텐츠 제공업체를 차별해서는 안 된다는 개념"}]},
{"quest" : "USN", "answers" : [{"answer":"각종 센서에서 수집한 정보를 무선 네트워크를 통해 실시간 수집.활용하도록 구성된 네트워크"}]},
{"quest" : "세컨드 라이프", "answers" : [{"answer":"가입자들이 자신의 분신인 아바타를 통해 본인이 원하는 것을 창작하고 거래 하는 것이 가능하며 현실과 다름없는 경제활동을 영위하면서 제2의 삶을 사는 가상 세계
2003년 미국의 IT 기업인 린든 랩이 개설한 가상 현실 사이트로, 게임.커뮤니티.E-커머스, E-교육이 결합된 서비스를 제공하며, 상거래시 가상 화례인 린든달러를 사용"}]}

     ]
  }

# minimall

//웹에서 이벤트가 사용되는 경우는 다음과 같습니다

세션의 생선,소멸
속성의 변경 
컨텍스트초기화//


인사말//
(피피티가 켜진다

안녕하세요 우리는 1 팀 불꽃놀이 입니다.
저는 발표를 맡게된 ~~~입니다

~~~조원들 


목차//

일단 발표를 시작하기 앞서 목차를 살펴보겠습니다.

첫번째 리스너의 개념
두번째 리스너의 동작 구조
새번째 리스너의 종류와 인터페이스
네번째 인터페이스를 구현
마지막으로 예제를 들어 리스너에대해 알아보도록
하겠습니다

처음으로 설명할 것은 리스너의 개념입니다.

리스너란.

서블릿 컨테이너는 웹 어플리케이션의 상태를 모니터링 할 수 있도록
웹 어플리케이션의 시작에서 종료까지 주요한 사건이나 상태 변화에 대한 알림 기능을 제공합니다 

즉 서블릿 컨테이너가 상태 변화를 통지해 주는 기능을 하고

리스너 클래스는 이러한 변화에 응답하여 동작하는 일종의 서블릿으로 
웹 애플리케이션 시작 및 운영 종료 과정에서 발생하는 특정 상황에 필요한 작업을 처리하기 위해 사용 한다고 합니다.

흔히 말하는 이벤트 핸들러라고 할 수 있습니다.


리스너를 사용하기 위해서는 다음과 같은 과정이 필요한데,


첫번째. 리스너 인터페이스를 구현하는 서블릿 클래스 생성
두번째. xml에 리스너 엘리먼트를 사용하여 구현한 리스너 클래스를 등록
세번째. 애노테이션을 통해서 리스너 클래스 등록이 가능합니다.


동작구조//
다음으로 넘어가 리스너의 동작 구조를 설명하겠습니다.

웹 어플리케이션에서 이벤트가 발생할때 리스너 인터페이스를 구현한 리스너 클래스가 
해당 이벤트를 감지하고 참고할 수 있도록한다.

리스너 동작이 끝나면 Load-on-startup 으로 설정된 일반 서블릿이 실행됩니다.





리스너의 종류와 인터페이스//

다음으로 리스너의 종류와 인터페이스를 설명하겠습니다.

리스너는 세가지로 분류할수있는데 웹어플리케이션,세션,요청이 있습니다.


웹어플리케이션안에 서블릿 컨텍스트영역이란 웹 어플맄이션이 종료될때까지유지되는객체이고 여기에 담긴값들은 모든서블릿들이 공유할수잇습니다. 그럼으로 웹어플리 케이션이 실행되는 동안 모든서블릿의 공유를원한다면 이 객체안에 저장하는것이 유용합니다.



웹어플리케이션에 있는 인터페이스부터 설명하겠습니다.

ServletContextListener의 경우 인터페이스 구현을 통해 리스너 클래스는

서버 시작과 함께 서블릿 컨텍스트 객체가 생성되고

 리스너 클래스안의 contextInitialized(컨택스트이니셜라이즈) 메서드에서는 
웹 어플리케이션이 시작될때 
서블릿 컨텍스트 객체의 생성을 알려주는 메서드입니다.

 그리고 contextDestoryed(컨텍스트디스트로이)라는 메소드는 웹 어플리케이션이 종료될때 서블릿 컨텍스트의 객체가 사라짐을 알려주는 메소드입니다.

ServletContextAttributeListener의 경우 

서블릿 컨텍스트에 저장된 속성 값들의 변화가 있을 때 수행하기 위한 메소드를 정의한 인터페이스입니다.

attributeAdded(ServletContextAttributeEvent scae) : void (가르키며)값을 추가

attributeRemoved(ServletContextAttributeEvent scae) : void (가르키며)값을 삭제

attributeReplaced(ServletContextAttributeEvent scae) : void (가르키며)값을 변경할때

알려주는 메서드들 입니다.

3-2



다음으로 세션영역의 이벤트를 감지하는 HttpSessionListener 를 구현한 클래스 내에
sessionCreated(HttpSession se) : void 메서드는 세션 영역이 생성되었을때 알려주는 메서드 이고
sessionDestoryed(HttpSession se) : void 메서드는 세션영역이 소멸되었을때 알려주는 메서드입니다.


HttpSessionActivationListener 는 조사를 했는데 깊게 알수가 없어 간단하게 설명해드리겠습니다.
sessionDidActivate(HttpSessionEvent e) : void 는 세션이 활성화 될 때 실행
sessionWillPassivate(HttpSessionEvent e) : void	세션이 비활성화 되려고 할 때 실행된다고 합니다.


HttpSessionAttributeListener 는 HTTP 세션에 대한 속성 값이 변경되었을 경우에 수행하기 위한 인터페이스입니다.

attributeAdded(HttpSessionBindingEvent e) : void	세션에 새로운 속성 값이 추가
attributeRemoved(HttpSessionBindingEvent e) : void	제거
attributeReplaced(HttpSessionBindingEvent e) : void	변경될 때 실행 됩닙다.

3-3




다음으로 요청영역의 이벤트를 감지하는 ServletRequestListener를 구현한 클래스 내에 
requestDestroyed(ServletRequestEvent sre) :void 요청이 서블릿으로 넘어가기 전 실행

requestInitialized(ServletRequestEvent sre):void 요청이 없어지기 전 실행되는 메서드입니다.

ServletRequestAttributeListener는 ServletRequest에 값을 추가하고,제거하고, 대체하기위한 인터페이습니다.

attributeAdded(HttpSessionBindingEvent event)
(세션에 새로운 속성 값이 추가될 때 실행)
attributeRemoved(HttpSessionBindingEvent event)
(세션의 속성 값이 제거될 실행)
attributeReplaced(HttpSessionBindingEvent event)
(세션의 속성 값이 변경될 때 실행)


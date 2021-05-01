# shopingmall
=============

*개발환경*

JAVA 1.8 

SPRING 5.0.7 RELEASE

ORACLE DB

PLUGIN - HTTP5, CSS, JS

사용한 API - 카카오 주소

---------------------------------------

*2021/04/22
회원가입 버튼 클릭시 false를 return 하는 상황 발생.   
브라우저 개발자도구로 디버깅해보니 입력한 이메일 데이터를 받아오지 못하는 문제 확인 -> script상 선택자 변경으로 해결완료.   
이후 회원가입 재시도 하였으나, 이번에도 동작하지 않음.(false를 return함)   
다시 브라우저 개발자 도구로 확인 -> 최종 유효성 검사 과정에서 검사하는 boolean 값들중 false를 반환하여 최종 return이 false가 됨으로써 회원가입 진행되지 않음 확인.   
Error log 확인시 주소api 사용하여 addr2에 null값이 계속 들어가는것 확인.   
register.jsp 확인시 disabled로 되어있음 확인. -> readonly로 변경   
Fix완료   

*2021/05/01
팀프로젝트 진행으로 개인프로젝트 잠시 

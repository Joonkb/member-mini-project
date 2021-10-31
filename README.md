# 🔆member-mini-project🔆

## 개요
- 회원 관리 기능을 수행할 수 있는 프로젝트입니다.

  - 기능 : 로그인, 로그아웃, 회원가입(아이디 중복확인), 회원정보수정, 회원리스트 조회, 아이디 찾기, 비밀번호 찾기

- 본 프로젝트는 교육 수료 중 복습의 일환으로 시작되었으며 필요에 따라 부가적인 기능을 추가 및 변경하는 방식으로 진행되었습니다.

  - 기능 추가 : 비밀번호 보안강도 표시, 회원가입시 보안질문 추가

### 개발기간
---
- 약 3주 (2021.10.10 ~ 2021.11.~)

### 기술스택
---
- `java` v1.8
- `oracle db`
- `apache tomcat` v8.5
- `html`, `css`, `bootstrap4`
- `javascript(es6)`
- `eclipse`
- `github`

### 👨‍👩‍👦‍👦구성원 및 구현 기능
---
- `김병준` / [Joonkb](https://github.com/Joonkb): 메인개발자 및 Project Manager <br>
- `이 용` / [nogy21](https://github.com/nogy21): 메인개발자 <br>
- `김서연` / [westkitekim](https://github.com/westkitekim): 메인개발자 <br><br>

🌈 모든 기능을 개별적으로 100% 구현하지 않고 __서로 도와가며__ 구현하였습니다.

### 요구사항
---
  1. 회원정보검색(email)
      - 비로그인 상태에서 등록된 이메일로 검색하면 __아이디 찾기__ 가 가능하다.
 
  2. 회원정보검색(보안질문)
      - 회원은 최초 가입시 저장해둔 보안질문과 답이 일치할 경우 __비밀번호 찾기__ 가 가능하다.(new)
      
  3. 로그인/ 로그아웃
      - 로그인 : `index.jsp` 에서 로그인 폼 제공 로그인 시 세션 정보를 통해서 xxx님 안녕하세요
      - 로그아웃 - `index.jsp` 에서 로그아웃 폼 제공, 로그아웃 시 다시 로그인 폼 제공
      
  4. 회원리스트 조회
      - 비로그인 : 링크로 페이지 제공
      - 로그인 : 로그인 후 페이지에 제공
      
  5. 회원가입
      - 비로그인 상태에서 회원가입이 가능하다.
      - 회원가입시 반드시 __아이디 중복확인 과정__ 을 거쳐서 중복된 아이디가 아닐 경우에만 회원가입이 가능하게 한다.
      - 고객이 원할 경우 선택적으로 프로필 사진 업로드가 가능하도록 한다.(2차 구현)
  
  6. 회원정보수정
      - 회원은 자신의 __회원정보를 수정__ 할 수 있다.(아이디는 제외, 비밀번호, 이름, 주소, 이메일)


### ⚒️트러블 슈팅
---

<details>
<summary>표 펼치기/접기</summary>
<div markdown="1">

| 이슈 내용                                                    | 해결 방안                                                    |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| `findmemberlist-result.jsp`에서 회원 리스트 정보 중 현재 회원 아이디와 일치하는 아이디가 있는지 확인하는 과정에서 `NullPointerException` 발생 | 스트링 타입의 변수를 선언하였기에 `equals()` 메서드를 사용하여 일치 여부 판단을 시도. 그런데 직후 `NullPointerException`이 발생했고, 동등연산자 `==`을 활용하여 비교를 시도하니 정상적인 작동을 확인. 이후 의문이 남아 다시 `equals()` 사용하여 판별하니 정상 작동하여 보다 `==`에서 `equals()`로 재수정|
| 아이디 찾기 기능 구현 중 FindIdServlet에서 `request.setAttribute("memberId", id);` 를 통해서 request 객체에 찾은 id값을 설정해주었고 `response.sendRedirect(path)` 방식을 통해서 `findid-ok`에서 출력을 하였으나 id 값이 정상적으로 출력되지 않음 | 이는 `forward` 방식으로 데이터를 `findid-ok`로 넘겨야 새로운 `request`, `response`가 아닌 기존의  `request`, `response` 객체를 이용해 설정한 값들을 넘겨 받을 수 있음|
  
  
</div>
</details>      

### 📐개발 프로세스 및 설계
---
<details>
<summary>💶Usecase Diagram</summary>
<div markdown="1">

![member-usecase-diagram](https://user-images.githubusercontent.com/88620416/138929408-5bf72317-fd8a-4762-8f78-2fcf084c2db6.png)

</div>
</details>
  
  
  
<br>

### 파일리스트 
---

  1. Controller 

     - `LoginServlet` : 로그인
     - `LogoutServlet` : 로그아웃
     - `FindIdByEmailServlet` : 이메일로 아이디 찾기
     - `UpdateMemberInfoServlet` : 회원 정보 수정
     - `RegisterMemberServlet`: 회원가입
     - `FindPassByInquiryServlet` : 질문으로 비밀번호 찾기
     - `CheckIdServlet` : 아이디 중복 확인
     - `FindMemberListServlet` : 회원 리스트 조회

  2. Model

     - `memberDAO.java`
     - `memberVO.java`

  3. View

     - `index.jsp`
         - 홈화면
         - 로그인: 로그아웃, 회원정보 수정, 회원 리스트 조회  링크
         - 비로그인: 로그인 폼, 아이디 찾기, 비밀번호 찾기, 회원가입, 회원 리스트 조회 링크
     - 회원리스트조회 
         - `findmemberlist-result.jsp`
         - `findidbyemail.jsp`
         - `findpassbyinquiry.jsp`
         - `login-fail.jsp`
         - `update-form.jsp`

     - 회원정보수정 
         - `update-form.jsp`
         - `update-result.jsp`
     
     - 회원가입
         - `register-form.jsp`
         - `register-result.jsp`
         - `idcheck-ok.jsp` (팝업)
         - `idcheck-fail.jsp` (팝업)
<br>

### 리팩토링
--- 
🌈 1차 구현 완료 후 현재를 기준으로 새롭게 배운 사항들을 적용하여 점증적으로 리팩토링 해나갈 예정입니다.

1. Front Controller Design Pattern
2. Singleton Design Pattern
3. DBCP
4. EL, JSTL
5. CSS(bootstrap) 통합









 



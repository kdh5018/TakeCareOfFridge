# 냉장고를 부탁해(가명) / 마지막 수정 : 2022.11.25

### 유통기한을 알려주는 앱 개발

## 1. 프로젝트 개요
> 냉장고에 음식을 넣어놓고 까먹은 상태에서 유통기한이 지나는 일이 많은데 그런 상황을 방지하기 위해 음식 사진과 유통기한을 설정하고 유통기한이 임박하면 알람이 가게끔 하는 앱 개발이 목표!

## 2. 프로토타입
<img width="459" alt="prototype" src="https://user-images.githubusercontent.com/104900735/201655058-9f86ba72-ef61-4a8a-a5fa-90faefdcf831.png">
<img width="286" alt="스크린샷 2022-11-25 오후 5 01 36" src="https://user-images.githubusercontent.com/104900735/203932007-0654f0dd-eea9-46aa-92f9-91cfde15934e.png">

- 현재 앱의 프로토타입이며, 메인페이지의 테이블 셀 선택시 수정, 삭제를 할 수 있는 버튼을 제작할 예정입니다.
- 메인페이지의 각 레이블에서 위부터 순서대로 음식의 카테고리(ex)냉동식품, 육류, 유제품 등등 )과 유통기한이 들어갈 예정입니다.
- 음식을 추가한 뒤, 수정할 사항이 생겼을 때 수정할 수 있는 수정 페이지 UI를 제작하였습니다.
- 기존에 디자인 패턴을 사용하지 않고 코딩을 하였는데, 코드가 길어질 수록 불편함을 느껴 MVC 패턴을 공부하고 간단하게 MVC 패턴으로 수정하였습니다.

## 3. 앱을 개발하며 새로 알게 된 기능, 기술들
- 사진을 asset이 아닌 핸드폰(카메라, 앨범)을 통해 추가하는 방법에 대해 알게 되었고, 각 기능에 필요한 기술들을 배웠습니다(카메라, 앨범에 접근하기 위해 접근 권한 설정을 반드시 해줘야 함)
- Pop Up Button을 사용하여 목록을 보여주고 그 중 원하는 것을 선택할 수 있다는 것을 알았습니다.
- 또한 Pop Up Button과 비슷한 Pull Down Button도 있는데 두 버튼은 비슷하지만 애플에서 각 버튼마다 쓰임새가 다른 것을 공식적으로 명시한 부분도 알게 되었습니다.
  - Pop Up Button = 상호 배타적인 옵션(mutually exclusive) 또는 상태의 무계층 목록(flat list)을 표시한다. 팝업 버튼은 사용자가 자신의 콘텐츠에 영향을 미치는 선택을 할 수 있도록 도와줍니다
  - Pull Down Button = 풀다운 버튼은 사람들이 선택하는 메뉴 항목(item)에 관계없이 항상 동일한 내용을 표시다.
 
 ## 4. 아쉬운 점..?
 - MVC 패턴으로 앱 개발을 하고 싶었지만 혼자 처음 만드는 프로젝트여서 바로바로 개발을 하는 것이 어려워 우선 뷰컨트롤러에 개발을 한 뒤 MVC 패턴으로 리팩토링을 할 계획입니다.
 - 음식 사진과 음식 카테고리, 날짜 데이터를 받아 메인 뷰컨트롤러 테이블셀에 올려야 하는데 그 부분이 마음처럼 되지 않아 고생을 하는 중입니다..!
 

### 위 README 파일은 지속적으로 업데이트를 할 예정입니다!

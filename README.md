# 빛, 그리고 그리다(JSP MVC2 기반의 사진공유 사이트)

<img src="https://user-images.githubusercontent.com/91710897/150929829-10bd84d6-1ebc-44fd-bfc7-1366e1b921bd.png" width="500">

> **사이트** : 사진공유 사이트 (중앙정보기술인재개발원 교육과정 중간 프로젝트)

> **개발모델** : JSP MVC2 모델

> **개발기간** : 2021.09.29 ~ 2021.10.21 (3주)

> **개발인원** : 5명



# 개발환경
 <img src="https://user-images.githubusercontent.com/91710897/150970465-4d40e2f7-9739-4f19-816a-6220fef36393.png" width="400">

> **사용기술** : 
 - 프론트엔드 : html, css, javascript, jquery,
 - 백엔드 : java, jsp/servlet, oracle sql, ajax


# 기획의도
‘빛, 그리고 그리다’는 고퀄리티 이미지를 공유 및 다운로드 받을 수 있는 사이트입니다. 이미 픽사베이나 언스플래쉬 등의 해외 사이트들에서 이런 서비스를 제공하고 있지만, 이 사이트들을 보면 자료들에 한계가 있습니다. 해외 사이트이다 보니 인물 사진이나 배경 사진들이 서구적인 것들이 대부분이었고 동양적인 자료가 매우 미비했습니다. 그렇기 때문에 한국에서 이런 사이트가 만들어져서 활성화 된다면 자연스럽게 한국 자료나 동양권 자료가 채워질 수 있을 거란 생각으로 기획하게 되었습니다.

 
>	**대상고객** : 유튜버, 디자이너, 대학생, 직장인 등

>	**서비스목표** : 
-	이미지 업로드 및 다운로드
-	댓글, 좋아요 등 커뮤니티 기능 제공
-	태그 및 연관이미지를 통한 이미지 검색


# 담당역할
1. **이미지 상세페이지**

|<상세페이지>|
|:-:|
|<img src="https://user-images.githubusercontent.com/91710897/150970670-01cfd1e3-ac2f-417a-9c7c-b3b99a84038d.png" width="400">|

    - 이미지 수정 및 삭제
    - 좋아요 기능
    - 태그
    - 다운로드 기능
    - 댓글 UI 및 CRUD
    - 연관이미지
    
2. **이미지 업로드** 

|<이미지업로드>|
|:-:|
|<img src="https://user-images.githubusercontent.com/91710897/150942164-95086050-7650-4f69-820e-32e15fa58350.png" width="400">|

    - 이미지 업로드
    - 태그 유효성 검사
    - 파일 미리보기 기능


# 노력과정


|노력1. 기능 구현방식 이해|노력2. 프로젝트 관리|노력3. 코드 리팩토링|
|--|--|--|
|<img src="https://user-images.githubusercontent.com/91710897/151131772-5d955ef4-e87e-4ce4-b0ec-8f35b49e477d.png" width="400"><br>- 다양한 기능구현을 위해 JS 공부<br>- 이미지 업로드 기능에 필요한 인터페이스 지식공부<br>|<img src="https://user-images.githubusercontent.com/91710897/151132115-cb91eed5-575b-412b-9e6f-25283d0472ee.png" width="400"><br>- 기능구현과 함께 기능관리대장 작성<br>- JSP/servlet 프로젝트 이해 및 환경설정<br>- 팀원들과 코드리뷰<br>|<img src="https://user-images.githubusercontent.com/91710897/151134279-e675370d-9e67-416f-9912-f3fecd5cd9d7.png" width="400"><br>- 좋아요 기능 비동기 방식으로 변경<br>- 반복함수 제거 및 코드 간결화<br>- 연관이미지 추가|



    













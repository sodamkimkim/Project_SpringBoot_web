## 1. 프로젝트 - Oaga 오늘 어디가지?
  #### 여행을 좋아하는 사람들을 위한 국내 여행지 정보 조회 및 커뮤니티 사이트
  ![home](https://user-images.githubusercontent.com/102580742/181429315-df682a42-395e-47c5-8709-529a3e5dc651.gif)
---
### 💡 프로젝트 설계 배경
  ##### 코로나19로 인해 해외여행을 자유롭게 갈 수 없기 때문에 요즘 국내여행에 대한 수요가 늘고있습니다. 
  ##### 그래서 사람들이 국내여행에 대한 정보를 한눈에 볼 수 있는 사이트가 있으면 좋을 것 같다는 의견을 나누어 Oaga 사이트를 만들게 되었습니다.
  ##### 국내 여행지에 대한 정보 뿐만 아니라 사용자들이 자신이 다녀온 여행 리뷰를 자유롭게 게시할 수 있도록 하여, 다양한 정보를 주고받을 수 있는 사이트가 되도록 설계했으며,
  ##### 댓글기능과 좋아요 기능들을 추가하여 하나의 여행 커뮤니티 사이트가 될 수 있도록 구현하였습니다.
---
 ### 📌 핵심기능
 #### 🙍‍♀️ 사용자 페이지 
   - #### 회원가입, 로그인( Oauth 2.0 카카오 로그인)
   ##### 회원가입
![join](https://user-images.githubusercontent.com/102580742/181425657-ceddd2e9-2e22-4a7f-82a2-3efe518a80dd.gif)

  ##### 로그인
  ![login](https://user-images.githubusercontent.com/102580742/181426268-a25daa61-71b9-4303-93a7-f4c15ce7110d.gif)
  ![image](https://user-images.githubusercontent.com/100888879/181204779-08b38dab-eb52-4d32-9385-5f9cec3cdfc6.png)
---
   -  #### 좋아요 기능
  ##### 다른 사용자들에 좋아요를 누를 수 있다. 
![3](https://user-images.githubusercontent.com/102580742/181439184-4b416e48-9c02-4599-9124-0f2048bffc55.gif)
---
   -  #### 국내 도시별 핫플레이스 정보 조회
  ##### 도시에 어떤 구들이 있는지 보여주는 페이지
  ##### 한 구의 (카페/식당 + 놀거리) 정보
  ##### 카페/식당 or 놀거리에 대한 자세한 정보
   ![1](https://user-images.githubusercontent.com/102580742/181444178-a6d09d1d-8602-4055-9223-2da41f2ce370.gif)
 ##### 해당 도시/구에 내용이 없다면 업데이트 중 이라고 알려 주기
  ![Screenshot_2](https://user-images.githubusercontent.com/102271558/181396938-2e472f5e-781d-4e94-975b-64b73d8090b9.png)

  ---
   - #### 여행자 리뷰 작성 및 조회, 수정, 임시저장, 등록
   ![2](https://user-images.githubusercontent.com/102580742/181444653-75730564-dc40-4b28-afc4-4109b2a74f91.gif)
 ##### 로그인이 되어있는 사용자의 경우, 자신의 정보를 화면에서 볼 수 있다.
  ![4](https://user-images.githubusercontent.com/102580742/181399015-d0f53f79-a029-47a0-81f2-abca7a52042b.png)
---
   - #### 베스트 리뷰 조회
   ##### 조회수가 많은 순으로 베스트 리뷰 조회
   ![1](https://user-images.githubusercontent.com/102580742/181399001-9c9cb19b-fa2f-45a7-a55a-ce7839708997.png)
---
   - #### 베스트 리뷰어 조회
   ##### 좋아요 수가 많은 순으로 베스트 리뷰어 조회
   ![2](https://user-images.githubusercontent.com/102580742/181399004-b2415077-e9d0-4514-a640-7dc45bb14ec7.png)
---
   - #### 리뷰 검색
![s](https://user-images.githubusercontent.com/102580742/181446716-270292e0-e1f9-4704-93d1-1498db663d8a.gif)
---
   - #### 댓글 기능
   ##### 리뷰에 댓글을 달고 삭제할 수 있다.
   ![d](https://user-images.githubusercontent.com/102580742/181446757-c3a6e7ba-825c-4c7b-a9f7-6dea48ec1fee.gif)
---
   - #### 여행지 정보 검색
   ##### 지역을 검색하여 여행지 정보를 볼 수 있다. 
   ##### 검색어 자동완성 기능
   ![s1](https://user-images.githubusercontent.com/102580742/181447768-2127dc4e-dd2d-4231-8b0e-4680c6e3dca2.gif)
---   
#### 🙍‍♀️ 관리자 페이지 
![ddd](https://user-images.githubusercontent.com/100888879/181393741-34b605c1-091d-43d9-b533-88b52dc366f5.jpg)
 - 여행지 정보 CRUD
##### 데이터 추가
  ##### 위에 카페/식당 or 놀거리 클릭 후 추가할 도시선택 > 구 선택 > 추가할 내용 및 이미지 작성
  ![Screenshot_9](https://user-images.githubusercontent.com/102271558/181395375-811b92cb-8502-40b5-a690-f14aedbe122c.png)
  ![Screenshot_10](https://user-images.githubusercontent.com/102271558/181395387-0fbe7063-63e2-46ea-b8db-1ea7d94f25dc.png)
  ![Screenshot_11](https://user-images.githubusercontent.com/102271558/181395411-47e28436-61c1-4841-b779-2b8b72d98514.png)
  ![Screenshot_12](https://user-images.githubusercontent.com/102271558/181395425-cb5b911d-36d2-4c7f-8f67-e62b2bcfadb2.png)
  ##### 데이터 수정
  ##### 위에 카페/식당 or 놀거리 클릭 후 추가할 도시선택 > 구 선택 > 수정 할 곳 선택 > 수정할 내용 작성
  ![Screenshot_13](https://user-images.githubusercontent.com/102271558/181396548-391e855e-649e-4eb1-8cd2-0a49ce2d1d8a.png)
  ![Screenshot_14](https://user-images.githubusercontent.com/102271558/181395541-47355efd-b2e7-45c3-ae01-9715f6e931b5.png)
  ![Screenshot_15](https://user-images.githubusercontent.com/102271558/181395463-479a3141-5cc5-4a70-98a2-c79c50010ff7.png)

  ##### 데이터 삭제
  ![Screenshot_17](https://user-images.githubusercontent.com/100888879/181204618-f7558954-4325-4e02-81af-36ee3999935c.png)

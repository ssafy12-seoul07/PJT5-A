# SSAFit_BE 디렉토리 구조

```plaintext
 SSAFit_BE
    ├──  BE_README.md
    └── 󱧼 src
        ├──  main
        │   ├──  java
        │   │   ├──  controller
        │   │   │   ├──  ReviewController.java
        │   │   │   ├──  UserController.java
        │   │   │   └──  VideoController.java
        │   │   └──  model
        │   │       ├──  dao
        │   │       │   ├──  ReviewDao.java
        │   │       │   ├──  ReviewDaoImpl.java
        │   │       │   ├──  UserDao.java
        │   │       │   ├──  UserDaoImpl.java
        │   │       │   ├──  VideoDao.java
        │   │       │   └──  VideoDaoImpl.java
        │   │       ├──  dto
        │   │       │   ├──  ReviewDto.java
        │   │       │   ├──  UserDto.java
        │   │       │   └──  VideoDto.java
        │   │       └──  service
        │   │           ├──  ReviewService.java
        │   │           ├──  ReviewServiceImpl.java
        │   │           ├──  UserService.java
        │   │           ├──  UserServiceImpl.java
        │   │           ├──  VideoService.java
        │   │           └──  VideoServiceImpl.java
        │   └──  webapp
        │       ├──  index.jsp
        │       ├──  META-INF
        │       │   └──  MANIFEST.MF
        │       └──  WEB-INF
        │           ├──  review
        │           │   ├──  detail.jsp
        │           │   ├──  review_item.jsp
        │           │   ├──  updateform.jsp
        │           │   └──  writeform.jsp
        │           ├──  user
        │           │   ├──  favorite.jsp
        │           │   ├──  profile.jsp
        │           │   ├──  registerform.jsp
        │           │   └──  updateform.jsp
        │           └──  video
        │               ├──  player.jsp
        │               └──  review_section.jsp
        └──  test
            └──  java
                ├──  controller
                │   ├──  ReviewControllerTest.java
                │   ├──  UserControllerTest.java
                │   └──  VideoControllerTest.java
                ├──  dao
                │   ├──  ReviewDaoTest.java
                │   ├──  UserDaoTest.java
                │   └──  VideoDaoTest.java
                └──  service
                    ├──  ReviewServiceTest.java
                    ├──  UserServiceTest.java
                    └──  VideoServiceTest.java
```

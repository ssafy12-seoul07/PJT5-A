# SSAFit_BE 디렉토리 구조

```plaintext
SSAFit_BE/
└── src/
    ├── main/
    │   ├── java/
    │   │   ├── controller/
    │   │   │   ├── UserController.java
    │   │   │   ├── ReviewController.java
    │   │   │   └── VideoController.java
    │   │   └── model/
    │   │       ├── dto/
    │   │       │   ├── UserDto.java
    │   │       │   ├── ReviewDto.java
    │   │       │   └── VideoDto.java
    │   │       ├── dao/
    │   │       │   ├── UserDao.java
    │   │       │   ├── UserDaoImpl.java
    │   │       │   ├── ReviewDao.java
    │   │       │   ├── ReviewDaoImpl.java
    │   │       │   ├── VideoDao.java
    │   │       │   └── VideoDaoImpl.java
    │   │       └── service/
    │   │           ├── UserService.java
    │   │           ├── UserServiceImpl.java
    │   │           ├── ReviewService.java
    │   │           ├── ReviewServiceImpl.java
    │   │           ├── VideoService.java
    │   │           └── VideoServiceImpl.java
    │   ├── resources/
    │   │   └── application.properties
    │   └── webapp/
    │       ├── META-INF/
    │       │   └── MANIFEST.MF
    │       ├── WEB-INF/
    │       │   ├── lib/
    │       │   │   ├── jakarta.servlet.jsp.jstl-3.0.1.jar
    │       │   │   ├── jakarta.servlet.jsp.jstl-api-3.0.0.jar
    │       │   │   └── mysql-connector-j-8.0.33.jar
    │       │   ├── video/
    │       │   │   ├── player.jsp
    │       │   │   └── review_section.jsp
    │       │   ├── review/
    │       │   │   ├── review_item.jsp
    │       │   │   ├── detail.jsp
    │       │   │   ├── updateform.jsp
    │       │   │   └── writeform.jsp
    │       │   ├── user/
    │       │   │   ├── profile.jsp
    │       │   │   ├── favorite.jsp
    │       │   │   ├── updateform.jsp
    │       │   │   └── registerform.jsp
    │       │   └── web.xml
    │       ├── resources/
    │       │   ├── css
    │       │   ├── js
    │       │   └── images
    │       └── index.jsp
    └── test/
        └── java/
            ├── controller/
            ├── service/
            └── dao/
```

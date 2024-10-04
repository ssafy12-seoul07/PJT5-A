여기 당신의 프로젝트 회고록을 예쁘게 정리한 버전입니다:

# SSAFIT 프로젝트 회고록

## 1. 프로젝트 개요

이번 관통 프로젝트는 운동 영상 리뷰 사이트인 SSAFIT의 데이터베이스 스키마를 설계하고 구현하는 것이었습니다. 기존 프로젝트의 연장선상에 있어 팀원들 모두 기능에 대한 이해도가 높았고, 이를 바탕으로 테이블 구조와 필드값 설계에 큰 어려움 없이 합의할 수 있었습니다.

## 2. 협업 방법

1. 회의를 통한 테이블 및 필드값 결정
2. 데이터 입력 방식 논의
3. 업무 분담
4. Git을 활용한 코드 통합

## 3. 데이터베이스 설계

### 테이블 구조

총 4개의 주요 테이블을 설계했습니다:

1. `user` : 사용자 정보
2. `video` : 영상 정보
3. `review` : 리뷰 정보
4. `favorite` : 즐겨찾기 정보

### 관계 설정

- user ↔ review : 1:N (강한 관계)
- video ↔ review : 1:N (강한 관계)
- user ↔ favorite : 1:N (강한 관계)
- video ↔ favorite : 1:N (강한 관계)

### 테이블 상세 설계

<details>
<summary><strong>user 테이블</strong></summary>

| Column Name | Data Type    | Constraints                           | 비고                                              |
| ----------- | ------------ | ------------------------------------- | ------------------------------------------------- |
| user_id     | INT          | NOT NULL, AUTO_INCREMENT, PRIMARY KEY |                                                   |
| id          | VARCHAR(45)  | NOT NULL, UNIQUE                      |                                                   |
| password    | VARCHAR(45)  | NOT NULL                              |                                                   |
| name        | VARCHAR(16)  | NOT NULL                              |                                                   |
| email       | VARCHAR(255) | NOT NULL                              |                                                   |
| status      | INT          | NOT NULL, DEFAULT 1                   | 0: 탈퇴, 1: 일반 회원, 2: 휴면 회원, 3: 정지 회원 |
| created_at  | TIMESTAMP    | NOT NULL, DEFAULT CURRENT_TIMESTAMP   |                                                   |

</details>

<details>
<summary><strong>video 테이블</strong></summary>

| Column Name  | Data Type    | Constraints                   | 비고                                           |
| ------------ | ------------ | ----------------------------- | ---------------------------------------------- |
| video_id     | VARCHAR(45)  | NOT NULL, PRIMARY KEY, UNIQUE |                                                |
| title        | VARCHAR(255) | NOT NULL                      |                                                |
| part         | VARCHAR(45)  | NULL                          |                                                |
| channel_name | VARCHAR(45)  | NOT NULL                      |                                                |
| url          | TEXT         | NOT NULL                      |                                                |
| thumbnail    | TEXT         | NULL                          |                                                |
| views        | INT          | NOT NULL, DEFAULT 0           |                                                |
| status       | INT          | NULL, DEFAULT 1               | 0: 삭제, 1: 전체 공개, 2: 비공개, 3: 일부 공개 |

</details>

<details>
<summary><strong>review 테이블</strong></summary>

| Column Name    | Data Type    | Constraints                                                     | 비고                                                 |
| -------------- | ------------ | --------------------------------------------------------------- | ---------------------------------------------------- |
| review_id      | INT          | NOT NULL, AUTO_INCREMENT, PRIMARY KEY, UNIQUE                   |                                                      |
| video_id       | VARCHAR(255) | NOT NULL                                                        |                                                      |
| user_id        | VARCHAR(45)  | NOT NULL                                                        |                                                      |
| content        | TEXT         | NOT NULL                                                        |                                                      |
| parent         | INT ZEROFILL | NOT NULL                                                        | 0: 기본 댓글, review_id: 대댓글을 위한 원댓글 아이디 |
| created_at     | TIMESTAMP    | NOT NULL, DEFAULT CURRENT_TIMESTAMP                             |                                                      |
| modified_at    | TIMESTAMP    | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP |                                                      |
| user_user_id   | INT          | NOT NULL, FOREIGN KEY REFERENCES `user`(`user_id`)              |                                                      |
| video_video_id | VARCHAR(45)  | NOT NULL, FOREIGN KEY REFERENCES `video`(`video_id`)            |                                                      |

</details>

<details>
<summary><strong>favorite 테이블</strong></summary>

| Column Name    | Data Type   | Constraints                                          |
| -------------- | ----------- | ---------------------------------------------------- |
| user_id        | INT         | NOT NULL, PRIMARY KEY                                |
| video_id       | VARCHAR(45) | NOT NULL, PRIMARY KEY                                |
| updated_at     | TIMESTAMP   | NOT NULL, DEFAULT CURRENT_TIMESTAMP                  |
| user_user_id   | INT         | NOT NULL, FOREIGN KEY REFERENCES `user`(`user_id`)   |
| video_video_id | VARCHAR(45) | NOT NULL, FOREIGN KEY REFERENCES `video`(`video_id`) |

</details>

## 4. 주요 고려사항

1. 사용자 상태 관리
   사용자의 상태(정상, 휴면, 탈퇴, 정지 등)를 효과적으로 관리하기 위해 정수형 필드를 도입했습니다.
   단순히 탈퇴 여부만을 true/false로 관리하는 대신, 0부터 3까지의 정수로 다양한 상태를 표현하기로 결정했습니다.
   이 방식은 향후 새로운 상태 추가 시 확장성이 뛰어나며, 외래 키 관계를 유지하면서도 유연한 사용자 관리가 가능합니다.

2. 영상 공개 설정
   실제 유튜브 동영상처럼 다양한 공개 상태(전체 공개, 일부 공개, 비공개 등)를 지원하기 위해
   video 테이블에 status 필드를 추가하고 정수값으로 상태를 관리하기로 했습니다.
   이를 통해 단순한 공개/비공개 구분을 넘어 더 세밀한 접근 제어가 가능해졌습니다.

3. 댓글과 대댓글 구조
   대댓글 기능을 구현하기 위해 review 테이블에 parent 필드를 추가했습니다.
   parent 필드의 기본값을 0으로 설정하여 일반 댓글과 대댓글을 구분하고,
   대댓글의 경우 해당 필드에 부모 댓글의 review_id를 저장하는 방식을 채택했습니다.

## 5. 느낀 점

• 실제 상황 시뮬레이션의 가치
다양한 사용자 시나리오를 가정하고 이를 데이터베이스 설계에 반영하는 과정이 매우 흥미로웠습니다.
모든 경우를 만족시키는 DB를 구성하려는 노력을 통해 서비스의 복잡성과 현실성을 체감할 수 있었습니다.
이러한 접근 방식은 단순히 기능을 구현하는 것을 넘어 실제 서비스 운영 시 발생할 수 있는 다양한 상황을 고려할 수 있게 해주었습니다.

• 프론트엔드와 백엔드의 연결고리
프론트엔드 엔지니어로서의 경험을 바탕으로, 프론트엔드 개발 시 느꼈던 데이터 관련 갈증이 어느 정도 해소되는 느낌이었습니다.
특히, 실제 백엔드에서 필요한 API를 상상하면서 SQL을 테스트하면서, 어떤 API가 필요하고 어떻게 구현해야 할지 지속적으로 고민하게 되었습니다.
이 과정을 통해 프론트엔드와 백엔드 개발이 얼마나 밀접하게 연관되어 있는지, 그리고 전체 시스템 설계의 중요성을 다시 한번 깨닫게 되었습니다.

• 실무 적용에 대한 호기심과 타 플랫폼에 대한 관심
실제 현업에서도 우리가 설계한 방식으로 데이터베이스를 구성하는지에 대한 궁금증이 생겼습니다.
비록 직접적인 피드백을 받지 못해 아쉬웠지만, 이번 경험을 통해 다른 인기 있는 플랫폼들의 데이터베이스 구조에 대해 생각하게 되었습니다.

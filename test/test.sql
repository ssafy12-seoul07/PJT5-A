# 만든 테이블을 테스트 해볼 수 있는 테스트 코드

-- 1. user 테이블에서 id에 해당하는 회원의 정보를 출력한다.
SELECT * 
FROM user u
WHERE u.id=id;

-- 2. video 테이블에서 views 내림차순으로 9개만 출력한다.
SELECT * 
FROM video 
ORDER BY views DESC 
LIMIT 9;

-- 3. video 테이블에서 part(ex. 전신, 상체, 하체, 복부)에 맞는 비디오를 9개만 출력한다.
SELECT *
FROM video v
WHERE v.part = part
LIMIT 9;

-- 4. video 테이블에서 videoId에 해당하는 정보와 현재 로그인한 유저의 찜 여부를 출력한다.
SELECT *, 
	CASE 
         WHEN EXISTS (SELECT 1
                      FROM favorite f 
                      WHERE f.userId = userId 
                        AND f.videoId = v.videoId) 
         THEN true 
         ELSE false 
	END AS myfavorite
FROM video v
WHERE v.videoId=videoId;

-- 5. review 테이블에서 videoId에 해당하는 review만 출력한다.
SELECT * 
FROM review r
WHERE r.videoId = videoId
ORDER BY parent ASC, modified_at DESC; -- review 성격순, 최근 수정 순으로 정렬

-- 6. video 테이블에서 userId가 찜한 영상을 출력한다.
SELECT *
FROM video v
WHERE v.userId = userId;

-- 7. review 테이블에서 userId가 작성한 리뷰를 출력한다.
SELECT *
FROM review r
WHERE r.userId = userId;

-- 8. video 테이블에서 userId가 리뷰를 작성한 영상을 출력한다.
SELECT *
FROM video v
WHERE v.videoId IN (
	SELECT videoId
    FROM review r
    WHERE r.userId = userId
);

-- 9. review 테이블에 (video_id, user_id, content)을 추가한다.

-- 10. review 테이블에 (video_id, user_id, content, parent)을 추가한다.

-- 11. favorite 테이블에 (user_id, video_id)를 추가한다.

-- 12. 





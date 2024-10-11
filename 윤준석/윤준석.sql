/* 
과제 A:
주어진 요구사항에 맞게 SQL 질의문을 만드세요
강의 자료로 주어진 테이블을 통해 만드시면 됩니다.
 */
-- 1. 전공 이름이 '소프트웨어공학전공'인 남학생을 모두 조회하세요
SELECT s.*
FROM student s 
JOIN major m ON s.major_id = m.major_id
WHERE m.major_name = '소프트웨어공학전공' AND s.gender = 'male';

-- 2. 30000원이 넘는 책의 이름과 가격을 조회하세요(가격에 대해 내림차순으로 정렬해야 합니다)
SELECT b.title, b.price
FROM book b
WHERE b.price > 30000
ORDER BY price DESC;

-- 3. 모든 학생의 수를 조회하세요
SELECT COUNT(*) AS total_students
FROM student;

-- 4. 저자 이름이 '김영한' 혹은 '이일민'인 책의 개수를 조회하세요
SELECT b.author, COUNT(*)
FROM book b
WHERE b.author = '김영한' OR b.author = '이일민'
GROUP BY b.author;

/*
과제 B:
1. 자신만의 데이터베이스를 만드세요.
	- 주제 무관(2주차 과제에 사용한 주제를 재사용해도 상관 없습니다)
    - 한 주제에 대해 데이터베이스를 구성하되, 테이블을 2개 이상 사용해야 합니다(반드시 기본키-외래키로 테이블을 연결할 필요는 없습니다)
	- 예시) 학교 데이터베이스 구성 -> 학생 테이블, 전공 테이블 사용
2. 1번에서 만든 데이터베이스를 통해 CRUD 질의문을 만드세요
	- Create, Read, Update, Delete에 각각 1개 이상의 질의문을 만들어야 합니다
    - Read, Update, Delete는 기본키를 이용한 질의문을 사용해도 좋고, 본인만의 방식으로 자유롭게 만드셔도 좋습니다.
*/
-- 자신만의 데이터베이스 만들기(테이블 2개 이상 생성)
CREATE TABLE jejuair (
jejuair_id int PRIMARY KEY,
jejuair_name varchar(50),
jejuair_passportnumber varchar(50)
);
/* 제주항공 고객관리 데이터베이스 테이블 생성 */

CREATE TABLE FL7C131 (
FL7C131_id int PRIMARY KEY,
FL7C131_name varchar(50),
FL7C131_passportnumber varchar(50),
FL7C131_price int
);
/* 김포에서 제주로가는 제주항공 편명7C131 에 대한 탑승객 정보 테이블 생성 */

-- Create(1개 이상)
INSERT INTO jejuair
VALUES (1, '김영한', '77N123X456');

INSERT INTO jejuair
VALUES (2, 'TomHoland', '12N123X454');

INSERT INTO jejuair
VALUES (3, '엄준식','UM12JU4N13');

INSERT INTO jejuair
VALUES (4, '김지석','75K123A455');

INSERT INTO jejuair
VALUES (5, '장나라','75K646B636');

INSERT INTO FL7C131
VALUES (1, '엄준식','UM12JU4N13',88000);

INSERT INTO FL7C131
VALUES (2, 'TomHoland', '12N123X454',93200);

INSERT INTO FL7C131
VALUES (3, '김영한', '77N123X456',67500);

INSERT INTO FL7C131
VALUES (4, '김지석','75K123A455',88900);

INSERT INTO FL7C131
VALUES (5, '한유리','75K134C556',56800);


-- Read(1개 이상)
SELECT A.jejuair_name AS '예약자명', A.jejuair_passportnumber AS '여권번호'
FROM jejuair A
JOIN FL7C131 B ON A.jejuair_passportnumber = B.FL7C131_passportnumber;
/* jejuair 멤버 중 FL7C131편에 탑승한 승객의 이름과 여권번호를 가져옴 */

SELECT A.jejuair_name AS '예약자명', A.jejuair_passportnumber AS '여권번호', B.FL7C131_price AS '티켓구입금액'
FROM jejuair A
JOIN FL7C131 B ON A.jejuair_passportnumber = B.FL7C131_passportnumber;
/* 가격 정보도 같이 보기 위해서 jejuair 멤버 중 7C131편에 탑승한 승객의 이름과 여권 번호, 구매한 티켓 가격을 표출하는 쿼리문도 작성해보았음 */

-- Update(1개 이상)
UPDATE jejuair
SET jejuair_passportnumber = 'UM2JU5NSIK3'
WHERE jejuair_id = 3;

SELECT jejuair_passportnumber AS '변경된엄준식고객여권번호'
FROM jejuair
WHERE jejuair_name = '엄준식';
-- 잘 변경되었는지 확인
/* 엄준식 승객의 여권번호를 수정하는 쿼리문*/

-- Delete(1개 이상)
SET SQL_SAFE_UPDATES = 0;  -- 안전 모드 비활성화
DELETE FROM FL7C131
WHERE FL7C131_name = '한유리';
SET SQL_SAFE_UPDATES = 1;  -- 안전 모드 활성화

SELECT *
FROM FL7C131
WHERE FL7C131_name = '한유리';
-- 잘 제거되었는지 확인
/*한유리 승객의 예약취소로 편명테이블에서 한유리 승객을 제거*/

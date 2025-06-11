-- Q1
create table departments (
    department_id INT unsigned auto_increment PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Q2
ALTER TABLE people ADD department_id int unsigned AFTER email;

-- Q3
INSERT INTO departments (`name`)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (`department_id`, `email`, `name`, `age`, `gender`)
VALUES
(1,'sakamoto@gizumo.jp','坂本',30,1),
(1,'yamada@gizumo.jp','山田',20,1),
(1,'yamasita@gizumo.jp','山下',49,1),
(2,'yamamoto@gizumo.jp','山本',20,1),
(2,'itou@gizumo.jp','伊藤',9,1),
(2,'satou@gizumo.jp','佐藤',98,2),
(2,'katou@gizumo.jp','加藤',68,2),
(3,'oota@gizumo.jp','大田',30,2),
(4,'kimura@gizumo.jp','木村',56,2),
(5,'murakami@gizumo.jp','村上',66,2);


INSERT INTO reports(`person_id`, `content`)
VALUES
(1,'モンハン'),
(2,'リオレウス'),
(3,'リオレイア'),
(4,'ジンオウガ'),
(1,'ミラボレアス'),
(2,'アルバトリオン'),
(3,'ゴアマガラ'),
(4,'ラージャン'),
(1,'ハンター'),
(5,'アイルー');


-- Q4
UPDATE people SET department_id = 1 WHERE name = '不思議沢みちこ';

-- Q5
SELECT name, age, gender FROM people WHERE gender = 1 ORDER BY age DESC;

-- Q6
SELECT
    `name`, `email`, `age`
-- name、email、ageカラムの選択
FROM
  `people`
-- peopleテーブルの選択
WHERE
  `department_id` = 1
-- このレコードに当てはまるもの営業部
ORDER BY
  `created_at`;
-- データ挿入時の昇順で並べる


-- Q7
SELECT
    *
FROM
    people
WHERE
    gender=1 AND age >= 40  AND age <= 49
OR
    gender=2 AND age >= 20 AND age <=29;

-- Q8
SELECT * FROM people WHERE `department_id` = 1 ORDER BY `age`;

-- Q9
SELECT
    AVG(age) AS average_age
FROM people
WHERE `department_id` =2 AND `gender`=2 GROUP BY gender;

-- Q10
SELECT
    people.`name`, departments.`name`, reports.`content`
FROM
    people
INNER JOIN
    departments
ON
    people.`department_id`=departments.`department_id`
INNER JOIN
    reports
ON
    people.`person_id`=reports.`person_id`;


-- Q11
SELECT
    people.`name`, reports.`content`
FROM
    people
LEFT OUTER JOIN
    eports
ON
    people.`person_id` = reports.`person_id`
WHERE
    reports.`content` IS NULL;
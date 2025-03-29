-- 1. 테이블 생성
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    is_deleted BOOLEAN DEFAULT FALSE
);

-- 2. 데이터 삽입
INSERT INTO users (name, age) VALUES ('John', 25);
INSERT INTO users (name, age) VALUES ('Jane', 30);
INSERT INTO users (name, age) VALUES ('Mike', 22);
INSERT INTO users (name, age) VALUES ('Alice', 27);

-- 3. 데이터 조회 (SELECT)
-- 3-1. 모든 사용자 조회
SELECT * FROM users;

-- 3-2. 나이가 25 이상인 사용자 조회
SELECT * FROM users WHERE age >= 25;

-- 3-3. 나이를 오름차순으로 정렬
SELECT * FROM users ORDER BY age ASC;

-- 4. 데이터 업데이트 (UPDATE)
-- 4-1. 사용자의 나이 업데이트
UPDATE users SET age = 28 WHERE name = 'John';

-- 5. 데이터 삭제 (DELETE)
-- 5-1. 나이가 25 미만인 사용자 삭제
DELETE FROM users WHERE age < 25;

-- 6. 물리 삭제 대신 논리 삭제 (is_deleted 필드 업데이트)
UPDATE users SET is_deleted = TRUE WHERE name = 'Mike';

-- 7. 그룹화된 데이터 조회 (GROUP BY)
-- 7-1. 나이별 사용자 수 조회
SELECT age, COUNT(*) FROM users GROUP BY age;

-- 8. 조인 예제 (JOIN)
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 8-1. 주문 데이터 삽입
INSERT INTO orders (user_id, amount) VALUES (1, 100.50);
INSERT INTO orders (user_id, amount) VALUES (2, 200.75);
INSERT INTO orders (user_id, amount) VALUES (3, 50.30);

-- 8-2. 사용자의 이름과 주문 금액 조회 (JOIN)
SELECT users.name, orders.amount
FROM users
JOIN orders ON users.id = orders.user_id;

-- 9. 제한된 결과 조회 (LIMIT)
-- 9-1. 상위 2명의 사용자 조회
SELECT * FROM users LIMIT 2;

-- 10. 데이터 반올림 (ROUND 함수)
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    price DECIMAL(10, 2)
);

-- 10-1. 가격 데이터를 삽입
INSERT INTO products (price) VALUES (19.99);
INSERT INTO products (price) VALUES (25.99);
INSERT INTO products (price) VALUES (12.49);

-- 10-2. 가격 반올림하여 조회
SELECT ROUND(price, 2) FROM products;

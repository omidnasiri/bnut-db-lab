-- لیست جدیدترین کارت های اضافه شده به سیستم
SELECT * FROM "cards" ORDER BY create_date_time DESC

-- لیست تعداد کارت های موجود در هر لیست
SELECT lists.list_id AS list, COUNT(*) FROM "lists" JOIN "cards" ON lists.list_id = cards.list_id GROUP BY lists.list_id;

-- لیست دوستان یک کاربر
SELECT users.user_id, users.email, A.user_id, A.email  FROM "users" JOIN (SELECT * FROM "users" JOIN "user_added_friends"
ON users.user_id = user_added_friends.first_user_id) A ON users.user_id = A.second_user_id
WHERE A.first_user_id = 'd0673119-2b33-4277-87e5-18b69968c0fb' OR users.user_id = 'd0673119-2b33-4277-87e5-18b69968c0fb'

-- لیست برد های یک کاربر
SELECT boards.board_id, boards.title FROM "boards" JOIN "users" ON boards.creator_user_id = users.user_id
WHERE users.user_id = 'f09e45a6-9b2a-4e93-9278-93ea59388a1c'
UNION
SELECT A.board, A.title FROM "users" JOIN (SELECT *, boards.board_id AS board FROM "boards"
JOIN "user_joined_boards" ON boards.board_id = user_joined_boards.board_id) A
ON users.user_id = A.user_id WHERE users.user_id = 'f09e45a6-9b2a-4e93-9278-93ea59388a1c'

-- لیست اعضای یک برد
SELECT users.user_id, users.email FROM "users" JOIN "boards" ON users.user_id = boards.creator_user_id
WHERE boards.board_id = '30fa8cca-26e5-4d6f-83ba-9bba4c207264' UNION
SELECT users.user_id, users.email FROM "users" JOIN (SELECT *, boards.board_id AS board FROM "boards"
JOIN "user_joined_boards" ON boards.board_id = user_joined_boards.board_id) A
ON users.user_id = A.user_id WHERE A.board = '30fa8cca-26e5-4d6f-83ba-9bba4c207264'

-- لیست کارت های موجود در یک برد به همراه نام لیست هایشان 
SELECT cards.card_id, cards.title, A.list_id, A.list_title, A.boardid, A.board_title FROM "cards" JOIN
(SELECT *, boards.title AS board_title, boards.board_id AS boardid, lists.title AS list_title FROM "boards"
JOIN "lists" ON boards.board_id = lists.board_id WHERE boards.board_id = '952849dd-35e9-4195-b368-cf94d03fb41a')
A ON cards.list_id = A.list_id

-- لیست کاربرانی که برد ساخته اند و تعداد برد هایشان
SELECT users.email, COUNT(*) FROM "users" JOIN "boards" ON users.user_id = boards.creator_user_id GROUP BY users.email

-- لیست کارت های محول شده به یک کاربر
SELECT cards.card_id, cards.title FROM "cards" JOIN (SELECT *, users.user_id AS userid FROM "user_assigned_cards"
JOIN "users" ON user_assigned_cards.user_id = users.user_id)
A ON A.card_id = cards.card_id WHERE A.userid = 'f09e45a6-9b2a-4e93-9278-93ea59388a1c'

-- لیست کارت هایی که مهلت اتمام آنها به پایان رسیده است
SELECT cards.card_id, cards.title, cards.due_date_time FROM "cards" WHERE due_date_time < CURRENT_TIMESTAMP

-- لیست لیست هایی که کارتی ندارند 
SELECT * FROM "lists" WHERE lists.list_id NOT IN (SELECT DISTINCT lists.list_id FROM "lists" JOIN "cards" ON lists.list_id = cards.list_id)

-- لیست کاربران اضافه شده به یک کارت
SELECT users.user_id, users.email FROM "users" JOIN (SELECT *, cards.card_id AS cardid FROM "user_assigned_cards"
JOIN "cards" ON user_assigned_cards.card_id = cards.card_id)
A ON A.user_id = users.user_id WHERE A.cardid = '88363a53-bb21-43e5-9a04-d260508e0eda'

-- لیست برد هایی که در ماه گذشته ساخته شده اند
SELECT * FROM "boards" WHERE create_date_time > (CURRENT_TIMESTAMP - INTERVAL '1 MONTH') AND create_date_time < CURRENT_TIMESTAMP

-- لیست برد های خصوصی بک کاربر
SELECT * FROM "users" JOIN "boards" ON users.user_id = boards.creator_user_id
WHERE users.user_id = 'd0673119-2b33-4277-87e5-18b69968c0fb' AND boards.is_private = true

-- لیست برد های موجوددر سیستم به ترتیب تعداد کاربرهایشان
SELECT B.board, COUNT(*) FROM (SELECT users.user_id, users.email, boards.board_id AS board FROM "users"
JOIN "boards" ON users.user_id = boards.creator_user_id
UNION SELECT users.user_id, users.email, A.board AS board FROM "users" JOIN (SELECT *, boards.board_id AS board FROM "boards"
JOIN "user_joined_boards" ON boards.board_id = user_joined_boards.board_id) A ON users.user_id = A.user_id) B
GROUP BY B.board ORDER BY COUNT DESC

-- لیست برد هایی که در نام آنها کلمه (his) وجود دارد
SELECT * FROM "boards" WHERE title LIKE '%his%'
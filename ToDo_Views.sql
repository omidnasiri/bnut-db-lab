---- Views

-- 1
create view board_members as
SELECT users.user_id, users.email FROM "users" JOIN "boards" ON users.user_id = boards.creator_user_id
WHERE boards.board_id = '30fa8cca-26e5-4d6f-83ba-9bba4c207264' UNION
SELECT users.user_id, users.email FROM "users" JOIN (SELECT *, boards.board_id AS board FROM "boards"
JOIN "user_joined_boards" ON boards.board_id = user_joined_boards.board_id) A
ON users.user_id = A.user_id WHERE A.board = '30fa8cca-26e5-4d6f-83ba-9bba4c207264';


-- 2
create view cards_list as
SELECT cards.card_id, cards.title, A.list_id, A.list_title, A.boardid, A.board_title FROM "cards" JOIN
(SELECT *, boards.title AS board_title, boards.board_id AS boardid, lists.title AS list_title FROM "boards"
JOIN "lists" ON boards.board_id = lists.board_id WHERE boards.board_id = '952849dd-35e9-4195-b368-cf94d03fb41a')
A ON cards.list_id = A.list_id;

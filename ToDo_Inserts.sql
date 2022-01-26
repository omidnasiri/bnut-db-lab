INSERT INTO users (user_id, email, create_date_time) VALUES ('d0673119-2b33-4277-87e5-18b69968c0fb', 'aa@aa.com', '1999-01-08 04:05:06');
INSERT INTO users (user_id, email, create_date_time) VALUES ('27d71435-5145-4f96-86b2-5d43a6ac924a', 'bb@bb.com', '2005-01-08 04:05:06');
INSERT INTO users (user_id, email, create_date_time) VALUES ('51e09e6d-3023-4bf6-91af-d64b361068f3', 'cc@cc.com', '2012-01-08 04:05:06');
INSERT INTO users (user_id, email, create_date_time) VALUES ('f09e45a6-9b2a-4e93-9278-93ea59388a1c', 'dd@dd.com', '2020-01-08 04:05:06');
INSERT INTO users (user_id, email, create_date_time) VALUES ('e66c39e8-bbd7-42e2-b549-86a104e33622', 'ee@ee.com', '2021-01-08 04:05:06');

INSERT INTO user_added_friends (user_added_friend_id, first_user_id, second_user_id)
VALUES ('354298bb-bacc-4420-9a65-96945e7a96e6', 'd0673119-2b33-4277-87e5-18b69968c0fb', '27d71435-5145-4f96-86b2-5d43a6ac924a');
INSERT INTO user_added_friends (user_added_friend_id, first_user_id, second_user_id)
VALUES ('011c55f0-8abc-4835-8e2c-d26beda4e0a5', 'd0673119-2b33-4277-87e5-18b69968c0fb', '51e09e6d-3023-4bf6-91af-d64b361068f3');
INSERT INTO user_added_friends (user_added_friend_id, first_user_id, second_user_id)
VALUES ('14c2a3a2-a6f1-47c0-9b95-951d6cfba6e1', 'f09e45a6-9b2a-4e93-9278-93ea59388a1c', 'e66c39e8-bbd7-42e2-b549-86a104e33622');
INSERT INTO user_added_friends (user_added_friend_id, first_user_id, second_user_id)
VALUES ('b42d7f33-9ff7-4d68-a50e-650395af0682', 'e66c39e8-bbd7-42e2-b549-86a104e33622', '51e09e6d-3023-4bf6-91af-d64b361068f3');
INSERT INTO user_added_friends (user_added_friend_id, first_user_id, second_user_id)
VALUES ('7f853145-4e16-4c52-b3af-681611aca46d', 'e66c39e8-bbd7-42e2-b549-86a104e33622', '27d71435-5145-4f96-86b2-5d43a6ac924a');

INSERT INTO boards (board_id, creator_user_id, title, create_date_time, is_private)
VALUES ('952849dd-35e9-4195-b368-cf94d03fb41a', 'd0673119-2b33-4277-87e5-18b69968c0fb', 'myBoard', '2002-01-08 04:05:06', true);
INSERT INTO boards (board_id, creator_user_id, title, create_date_time, is_private)
VALUES ('38088c23-792c-4f82-bc74-9ffd1f697fa0', 'd0673119-2b33-4277-87e5-18b69968c0fb', 'hisBoard', '2003-01-08 04:05:06', true);
INSERT INTO boards (board_id, creator_user_id, title, create_date_time, is_private)
VALUES ('f0008ba9-99e3-4e33-b7b0-954ffcbf03cf', '51e09e6d-3023-4bf6-91af-d64b361068f3', 'herBoard', '2013-01-08 04:05:06', true);
INSERT INTO boards (board_id, creator_user_id, title, create_date_time, is_private)
VALUES ('30fa8cca-26e5-4d6f-83ba-9bba4c207264', '51e09e6d-3023-4bf6-91af-d64b361068f3', 'theirBoard', '2014-01-08 04:05:06', false);
INSERT INTO boards (board_id, creator_user_id, title, create_date_time, is_private)
VALUES ('4f34684e-3256-49fb-bc6e-3fe6cec2720c', 'f09e45a6-9b2a-4e93-9278-93ea59388a1c', 'ourBoard', '2021-02-08 04:05:06', false);

INSERT INTO user_joined_boards (user_joined_board_id, user_id, board_id)
VALUES ('522ee69d-8286-4dd7-880e-5c084db4f753', '27d71435-5145-4f96-86b2-5d43a6ac924a', '30fa8cca-26e5-4d6f-83ba-9bba4c207264');
INSERT INTO user_joined_boards (user_joined_board_id, user_id, board_id)
VALUES ('557c27e7-aa92-4e8d-8ca2-364cc9f985e1', '27d71435-5145-4f96-86b2-5d43a6ac924a', '4f34684e-3256-49fb-bc6e-3fe6cec2720c');
INSERT INTO user_joined_boards (user_joined_board_id, user_id, board_id)
VALUES ('456e5dee-785c-4981-adb7-7c9e0de845fb', 'e66c39e8-bbd7-42e2-b549-86a104e33622', '30fa8cca-26e5-4d6f-83ba-9bba4c207264');
INSERT INTO user_joined_boards (user_joined_board_id, user_id, board_id)
VALUES ('43786c32-b2ee-4c9d-9ac6-001eed16fdc5', 'e66c39e8-bbd7-42e2-b549-86a104e33622', '4f34684e-3256-49fb-bc6e-3fe6cec2720c');
INSERT INTO user_joined_boards (user_joined_board_id, user_id, board_id)
VALUES ('a3613147-4ba3-4d40-bd1a-112953b70422', 'f09e45a6-9b2a-4e93-9278-93ea59388a1c', '30fa8cca-26e5-4d6f-83ba-9bba4c207264');

INSERT INTO lists (list_id, creator_user_id, board_id, title, create_date_time)
VALUES ('c06538cf-931d-4a28-9f95-dfc914de99ea', 'd0673119-2b33-4277-87e5-18b69968c0fb', '952849dd-35e9-4195-b368-cf94d03fb41a',
'alpha', '2002-02-08 04:05:06');
INSERT INTO lists (list_id, creator_user_id, board_id, title, create_date_time)
VALUES ('80fa7386-6bbc-44c1-826f-c43b31545f97', 'd0673119-2b33-4277-87e5-18b69968c0fb', '952849dd-35e9-4195-b368-cf94d03fb41a',
'beta', '2002-03-08 04:05:06');
INSERT INTO lists (list_id, creator_user_id, board_id, title, create_date_time)
VALUES ('0e2d3489-a575-4cd8-a25e-3aa931f9a7d1', 'd0673119-2b33-4277-87e5-18b69968c0fb', '38088c23-792c-4f82-bc74-9ffd1f697fa0',
'gamma', '2003-02-08 04:05:06');
INSERT INTO lists (list_id, creator_user_id, board_id, title, create_date_time)
VALUES ('26a8ff94-b32d-40b1-a07a-aa404594bb2a', 'e66c39e8-bbd7-42e2-b549-86a104e33622', '4f34684e-3256-49fb-bc6e-3fe6cec2720c',
'delta', '2021-03-08 04:05:06');
INSERT INTO lists (list_id, creator_user_id, board_id, title, create_date_time)
VALUES ('a4b5a62b-678f-4ec0-b577-1c4fdc3de606', 'f09e45a6-9b2a-4e93-9278-93ea59388a1c', '4f34684e-3256-49fb-bc6e-3fe6cec2720c',
'epsilon', '2021-11-08 04:05:06');

INSERT INTO cards (card_id, creator_user_id, list_id, title, create_date_time, due_date_time)
VALUES ('c69528ae-4f5e-47aa-80e7-220602c8f887', 'd0673119-2b33-4277-87e5-18b69968c0fb', 'c06538cf-931d-4a28-9f95-dfc914de99ea',
'ace', '2002-02-09 04:05:06', '2022-10-10 00:00:00');
INSERT INTO cards (card_id, creator_user_id, list_id, title, create_date_time, due_date_time)
VALUES ('a6256747-cd25-4974-ac38-1ba075fca4aa', 'd0673119-2b33-4277-87e5-18b69968c0fb', 'c06538cf-931d-4a28-9f95-dfc914de99ea',
'king', '2002-02-10 04:05:06', '2022-11-11 00:00:00');
INSERT INTO cards (card_id, creator_user_id, list_id, title, create_date_time, due_date_time)
VALUES ('88363a53-bb21-43e5-9a04-d260508e0eda', 'e66c39e8-bbd7-42e2-b549-86a104e33622', '26a8ff94-b32d-40b1-a07a-aa404594bb2a',
'queen', '2021-04-08 04:08:06', '2022-12-12 00:00:00');
INSERT INTO cards (card_id, creator_user_id, list_id, title, create_date_time, due_date_time)
VALUES ('d0d0115c-08e7-44a2-a979-7b48817d1e47', 'e66c39e8-bbd7-42e2-b549-86a104e33622', 'a4b5a62b-678f-4ec0-b577-1c4fdc3de606',
'jack', CURRENT_TIMESTAMP, NULL);
INSERT INTO cards (card_id, creator_user_id, list_id, title, create_date_time, due_date_time)
VALUES ('b3204f16-3ca1-4f2b-a790-9adc4b8b92eb', '27d71435-5145-4f96-86b2-5d43a6ac924a', '26a8ff94-b32d-40b1-a07a-aa404594bb2a',
'joker', '2021-04-08 04:05:06', NULL);

INSERT INTO user_assigned_cards (user_assigned_card_id, user_id, card_id)
VALUES ('350119db-b7b7-46c3-bd47-f5db28ed2fa2', '27d71435-5145-4f96-86b2-5d43a6ac924a', 'd0d0115c-08e7-44a2-a979-7b48817d1e47');
INSERT INTO user_assigned_cards (user_assigned_card_id, user_id, card_id)
VALUES ('eac9043c-b316-4c48-bc5f-acd6abbb942e', 'e66c39e8-bbd7-42e2-b549-86a104e33622', 'b3204f16-3ca1-4f2b-a790-9adc4b8b92eb');
INSERT INTO user_assigned_cards (user_assigned_card_id, user_id, card_id)
VALUES ('aa23f8cd-7457-476a-b129-f7291013f8f2', '27d71435-5145-4f96-86b2-5d43a6ac924a', '88363a53-bb21-43e5-9a04-d260508e0eda');
INSERT INTO user_assigned_cards (user_assigned_card_id, user_id, card_id)
VALUES ('f85eaa37-c563-43df-adae-98ad7c6cfbb7', 'f09e45a6-9b2a-4e93-9278-93ea59388a1c', '88363a53-bb21-43e5-9a04-d260508e0eda');
INSERT INTO user_assigned_cards (user_assigned_card_id, user_id, card_id)
VALUES ('9ee56670-6cbe-486b-86d8-79fd697f12cb', 'f09e45a6-9b2a-4e93-9278-93ea59388a1c', 'd0d0115c-08e7-44a2-a979-7b48817d1e47');
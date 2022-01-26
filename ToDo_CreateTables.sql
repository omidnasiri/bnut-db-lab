CREATE TABLE users (
	user_id UUID PRIMARY KEY NOT NULL,
	email VARCHAR(64) UNIQUE NOT NULL,
	create_date_time TIMESTAMP NOT NULL
);

CREATE TABLE user_added_friends (
	user_added_friend_id UUID PRIMARY KEY NOT NULL,
	first_user_id UUID NOT NULL,
	second_user_id UUID NOT NULL,
	FOREIGN KEY (first_user_id) REFERENCES users (user_id),
  FOREIGN KEY (second_user_id) REFERENCES users (user_id)
);

CREATE TABLE boards (
	board_id UUID PRIMARY KEY NOT NULL,
	creator_user_id UUID NOT NULL,
	title VARCHAR(32) NOT NULL,
	create_date_time TIMESTAMP NOT NULL,
	is_private BOOLEAN NOT NULL,
	FOREIGN KEY (creator_user_id) REFERENCES users (user_id) 
);

CREATE TABLE user_joined_boards (
	user_joined_board_id UUID PRIMARY KEY NOT NULL,
	user_id UUID NOT NULL,
	board_id UUID NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (board_id) REFERENCES boards (board_id)
);

CREATE TABLE lists (
	list_id UUID PRIMARY KEY NOT NULL,
	creator_user_id UUID NOT NULL,
	board_id UUID NOT NULL,
	title VARCHAR(32) NOT NULL,
	create_date_time TIMESTAMP NOT NULL,
	FOREIGN KEY (creator_user_id) REFERENCES users (user_id),
	FOREIGN KEY (board_id) REFERENCES boards (board_id)
);

CREATE TABLE cards (
	card_id UUID PRIMARY KEY NOT NULL,
	creator_user_id UUID NOT NULL,
	list_id UUID NOT NULL,
	title VARCHAR(32) NOT NULL,
	create_date_time TIMESTAMP NOT NULL,
	due_date_time TIMESTAMP,
	FOREIGN KEY (creator_user_id) REFERENCES users (user_id),
	FOREIGN KEY (list_id) REFERENCES lists (list_id)
);

CREATE TABLE user_assigned_cards (
	user_assigned_card_id UUID PRIMARY KEY NOT NULL,
	user_id UUID NOT NULL,
	card_id UUID NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (card_id) REFERENCES cards (card_id)
);
---- Triggers

-- برسی تاریخ مهلت کارت هنگام اضافه کردن
CREATE OR REPLACE FUNCTION card_due_date_check() RETURNS TRIGGER AS $$
BEGIN
	if new.due_date_time <= current_date then
	raise notice 'due date is incorrect';
	return null;
	end if;
	return new;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER  card_due_date_check_trigger
	BEFORE INSERT ON cards
FOR EACH ROW
EXECUTE PROCEDURE card_due_date_check();

-- برسی این شرط که کاربر به برد های ساخته شده توسط خودش نپیوندد
CREATE OR REPLACE FUNCTION user_join_board_check() RETURNS TRIGGER AS $$
BEGIN
	if new.user_id = (select creator_user_id from boards where board_id = new.board_id) then
	raise notice 'user cannot join baords that were created by him/herself.';
	return null;
	end if;
	return new;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER  user_join_board_check_trigger
	BEFORE INSERT ON user_joined_boards
FOR EACH ROW
EXECUTE PROCEDURE user_join_board_check();

-- برسی این شرط که به غیر از اعضای برد کاربری اجازه ساخت لیست نداشته باشد
CREATE OR REPLACE FUNCTION user_create_list_check() RETURNS TRIGGER AS $$
BEGIN
	if new.creator_user_id not in (SELECT users.user_id FROM "users" JOIN "boards" ON users.user_id = boards.creator_user_id
	WHERE boards.board_id = new.board_id UNION
	SELECT users.user_id FROM "users" JOIN (SELECT *, boards.board_id AS board FROM "boards"
	JOIN "user_joined_boards" ON boards.board_id = user_joined_boards.board_id) A
	ON users.user_id = A.user_id WHERE A.board = new.board_id) then
		raise notice 'user not joined to the board cannot create lists';
		return null;
	end if;
	return new;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER  user_create_list_check_trigger
	BEFORE INSERT ON lists
FOR EACH ROW
EXECUTE PROCEDURE user_create_list_check();

-- برسی این شرط که کارت به کاربری غیر از اعضای برد محول نشود
CREATE OR REPLACE FUNCTION user_card_assign_check() RETURNS TRIGGER AS $$
declare b_id UUID;
BEGIN
	select board_id into b_id from lists where list_id in (select list_id from cards where card_id = new.card_id);
	if new.user_id not in (SELECT users.user_id FROM "users" JOIN "boards" ON users.user_id = boards.creator_user_id
	WHERE boards.board_id = b_id UNION
	SELECT users.user_id FROM "users" JOIN (SELECT *, boards.board_id AS board FROM "boards"
	JOIN "user_joined_boards" ON boards.board_id = user_joined_boards.board_id) A
	ON users.user_id = A.user_id WHERE A.board = b_id) then
		raise notice 'can not assign a card to a user that is not a member of the board yet.';
		return null;
	end if;
	return new;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER  user_card_assign_check_trigger
	BEFORE INSERT ON user_assigned_cards
FOR EACH ROW
EXECUTE PROCEDURE user_card_assign_check();

-- برسی این شرط که کاربری نتواند آیدی خودش را به عنوان دوست ثبت کند
CREATE OR REPLACE FUNCTION user_add_friend_check() RETURNS TRIGGER AS $$
BEGIN
	if new.first_user_id = new.second_user_id then
		raise notice 'user can not add him/herself as a friend.';
		return null;
	end if;
	return new;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER  user_add_friend_check_trigger
	BEFORE INSERT ON user_assigned_cards
FOR EACH ROW
EXECUTE PROCEDURE user_add_friend_check();
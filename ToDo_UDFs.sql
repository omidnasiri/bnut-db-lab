---- User Defined Functions

-- دریافت لیستی از تمام کارت های موجود در یک برد
CREATE OR REPLACE FUNCTION get_cards_of_a_board(b_id UUID)
RETURNS TABLE(c_id UUID, c_title varchar) AS
$$
BEGIN
    return query select card_id, title from cards where list_id in (select list_id from lists where board_id = b_id);
END;
$$ LANGUAGE plpgsql;

SELECT * from get_cards_of_a_board('952849dd-35e9-4195-b368-cf94d03fb41a');

-- دریافت لیستی از تمام برد های یک کاربر
CREATE OR REPLACE FUNCTION get_user_boards(u_id UUID)
RETURNS TABLE(bordId UUID, title varchar) AS
$$
BEGIN
    return query SELECT boards.board_id, boards.title FROM "boards" JOIN "users" ON boards.creator_user_id = users.user_id
	WHERE users.user_id = u_id
	UNION
	SELECT A.board, A.title FROM "users" JOIN (SELECT *, boards.board_id AS board FROM "boards"
	JOIN "user_joined_boards" ON boards.board_id = user_joined_boards.board_id) A
	ON users.user_id = A.user_id WHERE users.user_id = u_id;
END;
$$ LANGUAGE plpgsql;

SELECT * from get_user_boards('51e09e6d-3023-4bf6-91af-d64b361068f3');

-- دریافت لیستی از کارت های محول شده به یک کاربر
CREATE OR REPLACE FUNCTION get_user_assigned_cards(u_id UUID)
RETURNS TABLE(cardId UUID, title varchar) AS
$$
BEGIN
    return query SELECT cards.card_id, cards.title FROM "cards" JOIN (SELECT *, users.user_id AS userid FROM "user_assigned_cards"
	JOIN "users" ON user_assigned_cards.user_id = users.user_id)
	A ON A.card_id = cards.card_id WHERE A.userid = u_id;
END;
$$ LANGUAGE plpgsql;

SELECT * from get_user_assigned_cards('27d71435-5145-4f96-86b2-5d43a6ac924a');
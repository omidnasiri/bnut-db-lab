---- Cursors

-- 1
create or replace FUNCTION get_boards_user_count()
returns void AS $$
declare count int;
declare b_id UUID;
declare c CURSOR for(SELECT B.board, COUNT(*) FROM (SELECT users.user_id, users.email, boards.board_id AS board FROM "users"
					JOIN "boards" ON users.user_id = boards.creator_user_id
					UNION SELECT users.user_id, users.email, A.board AS board FROM "users" JOIN (SELECT *, boards.board_id AS board FROM "boards"
					JOIN "user_joined_boards" ON boards.board_id = user_joined_boards.board_id) A ON users.user_id = A.user_id) B
					GROUP BY B.board ORDER BY COUNT DESC);
begin
	open c;
	FOR i in 1 .. (SELECT count(*) from boards)
	LOOP
		FETCH c INTO b_id, count;
		raise notice 'board % has % users',b_id, count;
	END LOOP;
	close c;
end;
$$ language plpgsql;

SELECT get_boards_user_count();

-- 2
create or replace FUNCTION get_user_boards_with_cursor(u_id uuid)
returns void AS $$
declare u_email varchar;
declare b_id UUID;
declare b_title varchar;

declare c CURSOR for(SELECT boards.board_id, boards.title FROM "boards" JOIN "users" ON boards.creator_user_id = users.user_id
						WHERE users.user_id = u_id
						UNION
						SELECT A.board, A.title FROM "users" JOIN (SELECT *, boards.board_id AS board FROM "boards"
						JOIN "user_joined_boards" ON boards.board_id = user_joined_boards.board_id) A
						ON users.user_id = A.user_id WHERE users.user_id = u_id);
begin
	open c;
	select email into u_email from users where user_id = u_id;
	
	FOR i in 1 .. (SELECT count(*) from boards)
	LOOP
		FETCH c INTO b_id, b_title;
		if b_id is NULL then
			return;
		end if;
		raise notice 'user % has board % (board id : %)', u_email, b_title, b_id;
	END LOOP;
	close c;
end;
$$ language plpgsql;

SELECT get_user_boards_with_cursor('27d71435-5145-4f96-86b2-5d43a6ac924a');
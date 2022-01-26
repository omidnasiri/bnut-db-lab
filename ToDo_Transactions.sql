---- Transactions

-- 1
begin transaction;
	insert into user_add_friend values('350119db-b7b7-46c3-bd47-f5db28ed2fa2', '9ee56670-6cbe-486b-86d8-79fd697f12cb');
	insert into user_add_friend values('9ee56670-6cbe-486b-86d8-79fd697f12cb', '350119db-b7b7-46c3-bd47-f5db28ed2fa2');
commit;

-- 2
begin transaction;
	delete from cards where list_id = 'c06538cf-931d-4a28-9f95-dfc914de99ea';
	delete from lists where list_id = 'c06538cf-931d-4a28-9f95-dfc914de99ea';
commit;
---- Stored Procedurs

-- اضافه کردن <_deprecated> به عنوان کارت های منقضی شده
CREATE OR REPLACE PROCEDURE set_deprication()
LANGUAGE plpgsql
AS
$$
BEGIN
	UPDATE cards SET title = CONCAT(title, ' ', '_deprecated') where due_date_time < current_date;
END;
$$;

CALL set_deprication();

-- افزایش مهلت یک کارت با آیدی مشخص به مدت یک هفته
CREATE OR REPLACE PROCEDURE add_extra_week(c_id UUID)
LANGUAGE plpgsql
AS
$$
BEGIN
	UPDATE cards SET due_date_time = due_date_time + INTERVAL'7days' where card_id = c_id;
END;
$$;

CALL add_extra_week('d0d0115c-08e7-44a2-a979-7b48817d1e47');
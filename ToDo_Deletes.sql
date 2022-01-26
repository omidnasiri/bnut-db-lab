---- Deletes

-- حذف کارت‌هایی که مهلتشان تمام شده است
delete from cards where due_date_time < current_date ;

-- حذف تمام برد های خصوصی یک کاربر با آیدی مشخص
delete from boards where creator_user_id = '51e09e6d-3023-4bf6-91af-d64b361068f3' and is_private = true;
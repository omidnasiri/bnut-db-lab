---- Indexes

-- ایندکس بر روی ایمیل کاربران
create index idx_user_email on users(email);

-- ایندکس بر روی مهلت کارت‌ها
create index idx_due_date on cards(due_date_time);
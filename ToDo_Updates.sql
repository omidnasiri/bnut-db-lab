---- Updates

-- تغییر نام یک لیست با آیدی مشخص
update lists set title = 'new title' where list_id = '0e2d3489-a575-4cd8-a25e-3aa931f9a7d1';

-- افزایش مهلت یک کارت با آیدی مشخص به مدت ۲ روز
update cards set due_date_time = due_date_time + INTERVAL'2days' where card_id = '88363a53-bb21-43e5-9a04-d260508e0eda';

-- خصوصی کردن یک برد با آیدی مشخص
update boards set is_private = true where board_id = '30fa8cca-26e5-4d6f-83ba-9bba4c207264';
use quan_ly_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * 
from subjects 
where credit = ( select max(credit)
				 from subjects);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select distinct s.*
from mark m
join subjects s 
on m.sub_id = s.sub_id
where mark = (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên

select s.*, ifnull(avg(mark),0) avg_mark
from mark m
right join student s
on m.student_id = s.student_id
group by student_id
order by avg_mark desc;








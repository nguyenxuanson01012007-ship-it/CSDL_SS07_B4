SELECT c.* FROM Courses c
LEFT JOIN Enrollments e 
ON c.id = e.course_id
WHERE e.course_id IS NULL;

-- Dùng LEFT JOIN để lấy giữ liệu bảng Courses 
-- Dùng WHERE e.course_id IS NULL để lấy những dữ liệu NUll bỏ trống ở bảng

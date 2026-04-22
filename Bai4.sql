SELECT h.hotel_name, COUNT(b.booking_id) AS DonHang, AVG(b.total_price) AS DoanThuTB
FROM Hotels AS h
INNER JOIN Bookings AS b 
ON h.hotel_id = b.hotel_id
WHERE b.status = 'COMPLETED'
GROUP BY h.hotel_id, h.hotel_name
HAVING COUNT(b.booking_id) >= 50 AND AVG(b.total_price) > 3000000;

-- SELECT h.hotel_name, COUNT(b.booking_id) AS DonHang, AVG(b.total_price) AS DoanThuTB: Chọn tên khách sạn, đếm tổng số đơn hàng (COUNT) và tính giá trị trung bình của mỗi đơn hàng (AVG).
-- FROM Hotels AS h INNER JOIN Bookings AS b ON h.hotel_id = b.hotel_id: Kết nối bảng Hotels và Bookings thông qua khóa ngoại hotel_id. Chỉ những khách sạn có ít nhất một đơn hàng mới xuất hiện trong tập hợp này.
-- WHERE b.status = 'COMPLETED': Chỉ tính toán dựa trên các đơn hàng đã hoàn tất (trạng thái 'COMPLETED'). Các đơn hàng hủy hoặc đang chờ xử lý sẽ bị loại bỏ trước khi tính toán.
-- GROUP BY h.hotel_id, h.hotel_name: Gom nhóm các dữ liệu theo từng khách sạn để các hàm tổng hợp (COUNT, AVG) có thể thực hiện trên từng nhóm riêng biệt.
-- HAVING COUNT(b.booking_id) >= 50 AND AVG(b.total_price) > 3000000: Đây là điều kiện lọc sau khi đã gom nhóm. Câu lệnh chỉ giữ lại những khách sạn thỏa mãn đồng thời hai điều kiện:
-- Có ít nhất 50 đơn hàng đã hoàn tất.
-- Giá trị trung bình mỗi đơn hàng phải lớn hơn 3.000.000.
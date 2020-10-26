MVP

Trong mô hình MVP UIViewController đóng vai trò là View chứ không phải là Presenter. Do đó tăng khả năng test, đổi lại thì việc phát triển ứng dụng sẽ mất thời gian hơn do chúng ta phải tạo các kết nối data và event thủ công.

Đặc điểm của mô hình MVP:
- Phân phối: phần lớn các trách nhiệm được chia đều giữa Presenter và Model, View có rất ít vai trò, chủ yếu để hiển thị dữ liệu.
- Khả năng test: chúng ta có thể test phần lớn các code logic do ít phụ thuộc vào View.
- Tính dễ dùng: số lượng code gấp 2 so với mô hình MVC truyền thống, tuy nhiên về mặt ý tưởng thì mô hình MVP rất rõ ràng.

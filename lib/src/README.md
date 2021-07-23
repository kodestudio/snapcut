## Mục tiêu
File này giúp mọi người có thể dễ dàng contribute cho project.
### app.dart
- Điểm khởi đầu của dự án.
### _internal
- Thư mục chứa các plugin có thể sử dụng lại được, phần này không hề phụ thuộc vào dự án.
### controllers
- Thư mục chứa các class điều khiển của màn hình.
- Cầu nối giữa thư mục `views`, `db` và `repositories`.
### models
- Chứa các đối tượng.
   - `filter_tool`
      - `custom_filter_tool`
         - Chứa các custom filter và các phần code generation cho Hive.
      - Chứa interface FilterTool phục vụ cho việc tạo các custom filter khác.
      - `preset_filter_tool.dart` các filter được tạo sẵn của nhà phát triển.
      - `tool_type.dart` và `tool_type.g.dart`
         - Enum của các tool chỉnh sửa và file code generate cho Hive.
      - `.filter.dart` 
         - Export các file cần thiết tránh việc phải import nhiều file một lần. 
   - `blend_mode_adapter.dart`
      - Adapter của BlendMode cho Hive.
   - `snapcut_image`
      - Do có sự khác biệt một chút ở xử lí ảnh trên Web và ở Mobile, Desktop nên sử dụng locator pattern.
      - `snapcut_image_locator.dart` chứa hàm locator để khởi tạo object.
      - `snapcut_image.dart` chứa interface SnapcutImage.
      - `io_snapcut_image.dart` implement SnapcutImage cho mobile và desktop.
      - `web_snapcut_image.dart` implement SnapcutImage cho web.
### repositories
   - Chứa các repo kết nối với cloud.
### utils
   - Chứa các tiện ích nhỏ giúp code clean và đồng nhất hơn.
   - `globals.dart`
      - Chứa 3 khóa điều hướng chính của ứng dụng.
      - `appNav` khóa chính của ứng dụng.
      - `bodyNav` khóa của phần image editor.
   - `hive_id.dart`
      - class chứa các id khởi tạo cho HiveAdapter tránh trùng lặp id.
   - `router.dart`
      - Phần điều hướng cho app.
   - `styles.dart`
      - Quy định khoảng cách cho phần Padding giúp đồng nhất thiết kế. 
### views
   - `screens`
      - Chứa toàn bộ màn hình của dự án.
   - `widgets`
      - Chứa các widget nhỏ có thể dùng lại.
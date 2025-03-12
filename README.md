# Weather App

## Giới thiệu
Weather App là một ứng dụng thời tiết cho phép người dùng xem thông tin thời tiết hiện tại và dự báo cho các ngày tiếp theo. Ứng dụng hỗ trợ nền tảng iOS (từ iOS 12) và Android (từ API 24) trở lên.

## Công nghệ sử dụng
- **Flutter**: Framework chính để phát triển ứng dụng đa nền tảng.
- **Dart**: Ngôn ngữ lập trình chính.
- **BLoC (Business Logic Component)**: Kiến trúc quản lý trạng thái giúp tách biệt UI và logic ứng dụng.
- **Dio**: Thư viện HTTP client để gọi API.
- **Intl**: Xử lý định dạng ngày tháng và ngôn ngữ.

## Kiến trúc
Ứng dụng được thiết kế theo mô hình **MVVM + BLoC**:
- **Model**: Chứa các class dữ liệu như `ForecastModel`, `WeatherData`.
- **ViewModel (BLoC)**: Quản lý logic ứng dụng và dữ liệu hiển thị.
- **View**: Hiển thị UI và nhận dữ liệu từ ViewModel.

## Các tính năng chính
- Xem thời tiết hiện tại theo vị trí của người dùng.
- Dự báo thời tiết trong 4 ngày tới.

## Cài đặt
### Yêu cầu
- **Flutter SDK**: Phiên bản mới nhất.
- **Android Studio / Xcode** để chạy ứng dụng trên máy ảo.
- **API Key** từ OpenWeatherMap.

### Hướng dẫn cài đặt
1. Clone repo:
   ```sh
   git clone https://github.com/letruclam/weather_test.git
   ```
2. Cài đặt dependencies:
   ```sh
   flutter pub get
   ```
3. Chạy ứng dụng:
   ```sh
   flutter run
   ```






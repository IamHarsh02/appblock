import 'package:get/get.dart';
import 'package:mybloackapp/presentation/weather_ui.dart';

class AppPages {
  static final all = [
    GetPage(
      name: "/weatherApp",
      page: () => WeatherUiPage(),
    )
  ];
}

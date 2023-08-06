import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as Response;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mybloackapp/domain/weather_data_modal.dart';

class WeatherAppRepo extends GetxController {
  final Response.Dio dio = Response.Dio();
  Future<Either<String, WeatherData>> fetchweatherData() async {
    try {
      Response.Response response = await dio.get(
          "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=3b95417800bf6bdaf852d23e37ef3cbf");
      if (response.statusCode == 200) {
        WeatherData weatherData = WeatherData.fromJson(response.data);
        debugPrint("data received is '${weatherData.toString()}' ");
        return right(weatherData);
      } else {
        return left("error bro!~!1");
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}

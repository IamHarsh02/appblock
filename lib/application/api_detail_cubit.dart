import 'package:flutter/foundation.dart';
import 'package:mybloackapp/domain/weather_data_modal.dart';

abstract class ApiDetailState {
  const ApiDetailState();
}

class ApiDetailInitial extends ApiDetailState {
  const ApiDetailInitial();
}

class ApiDetailLoading extends ApiDetailState {
  const ApiDetailLoading();
}

class ApiDetailError extends ApiDetailState {
  const ApiDetailError();
}

class ApiDetailSuccess extends ApiDetailState {
  final WeatherData? weatherData;
  const ApiDetailSuccess({this.weatherData});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiDetailSuccess;
  }

  @override
  int get hashCode {
    return weatherData.hashCode;
  }
}

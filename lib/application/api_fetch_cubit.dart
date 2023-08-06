import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybloackapp/application/api_detail_cubit.dart';
import 'package:mybloackapp/domain/weather_data_modal.dart';
import 'package:mybloackapp/repository/weather_app_repo.dart';

class ApiFetchCubit extends Cubit<ApiDetailState> {
  final WeatherAppRepo weatherAppRepo;
  ApiFetchCubit(this.weatherAppRepo) : super(const ApiDetailInitial());

  bool isLoading = false;
  Future<void> fetchData() async {
    Either<String, WeatherData> failorSucces;
    emit(ApiDetailLoading());
    failorSucces = await weatherAppRepo.fetchweatherData();
    failorSucces.fold((l) => emit(ApiDetailError()),
        (r) => emit(ApiDetailSuccess(weatherData: r)));
  }
}

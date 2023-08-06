import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mybloackapp/application/api_detail_cubit.dart';
import 'package:mybloackapp/application/api_fetch_cubit.dart';

class WeatherUiPage extends StatefulWidget {
  const WeatherUiPage({this.ctxx});
  final BuildContext? ctxx;
  @override
  State<WeatherUiPage> createState() => _WeatherUiPageState();
}

class _WeatherUiPageState extends State<WeatherUiPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ApiFetchCubit>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApiFetchCubit, ApiDetailState>(
      listener: (context, state) {
        if (state is ApiDetailLoading) {
          const CircularProgressIndicator();
        }
        if (state is ApiDetailError) {
          const Center(
            child: Text("Error Occured please Wait SomeTime !!"),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Weather App!!!"),
        ),
        body: const Center(
          child: Text("hi Its a Weather page bro!!"),
        ),
      ),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybloackapp/logic/cubit_logic/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitState(0));

  void increment() async {
    int value = state.value;
    value++;

    emit(CounterResultState(value));
  }
}

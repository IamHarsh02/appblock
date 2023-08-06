import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybloackapp/logic/bloc_logic/counter_event.dart';
import 'package:mybloackapp/logic/cubit_logic/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event.runtimeType) {
      case CounterIncrementEvent:
        int value = state.value;
        value++;
        yield CounterResultState(value);
        break;
      default:
    }
  }
}

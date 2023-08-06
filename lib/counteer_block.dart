import 'counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitState(2));

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

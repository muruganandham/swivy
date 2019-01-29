import 'package:bloc/bloc.dart';
import 'package:swivy/counter_event.dart';
import 'package:swivy/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  void onIncrement() {
    dispatch(IncrementCounterEvent());
  }

  void onDecrement() {
    dispatch(DecrementCounterEvent());
  }

  @override
  CounterState get initialState => new CounterState(0);

  @override
  Stream<CounterState> mapEventToState(
    CounterState currentState,
    CounterEvent event,
  ) async* {
    if (event is IncrementCounterEvent) {
      yield new CounterState(currentState.counter + 1);
    } else if (event is DecrementCounterEvent) {
      yield new CounterState(currentState.counter - 1);
    }
  }
}

import 'package:bloc_example/counter/bloc/counter.event.dart';
import 'package:bloc_example/counter/bloc/counter.state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(value: 0)) {
    on<CounterIncrementPressed>(_onIncrement);
    on<CounterDecrementPressed>(_onDecrement);
  }

  void _onIncrement(CounterIncrementPressed event, Emitter<CounterState> emit) {
    debugPrint('INCREMENT: ${state.toString()}');
    emit(CounterState(value: state.value + 1));
  }

  void _onDecrement(CounterDecrementPressed event, Emitter<CounterState> emit) {
    debugPrint('DECREMENT: ${state.toString()}');
    emit(CounterState(value: state.value - 1));
  }
}

// Possible FUTURE mit static meta-programming
// @Bloc
// CounterBloc on int with CounterEvent {
//   default is 0;

//   on Increment => emit(state + 1);
//   on Decrement => emit(state - 1);
// }

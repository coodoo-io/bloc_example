import 'package:bloc_example/counter/bloc/counter.bloc.dart';
import 'package:bloc_example/counter/bloc/counter.event.dart';
import 'package:bloc_example/counter/bloc/counter.state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterBloc', () {
    test('initial state is 0', () {
      expect(CounterBloc().state.value, 0);
    });

    group('increment', () {
      blocTest<CounterBloc, CounterState>(
        'emits [1] when state is 0',
        build: CounterBloc.new,
        act: (bloc) => bloc..add(CounterIncrementPressed()),
        expect: () => const <CounterState>[CounterUpdatedState(value: 1)],
      );

      blocTest<CounterBloc, CounterState>(
        'emits [1, 2] when state is 0 and invoked twice',
        build: CounterBloc.new,
        act: (bloc) => bloc
          ..add(CounterIncrementPressed())
          ..add(CounterIncrementPressed()),
        expect: () => const <CounterState>[CounterUpdatedState(value: 1), CounterUpdatedState(value: 2)],
      );

      blocTest<CounterBloc, CounterState>(
        'emits [42] when state is 41',
        build: CounterBloc.new,
        seed: () => const CounterUpdatedState(value: 41),
        act: (bloc) => bloc..add(CounterIncrementPressed()),
        expect: () => const <CounterState>[CounterUpdatedState(value: 42)],
      );
    });

    group('decrement', () {
      blocTest<CounterBloc, CounterState>(
        'emits [-1] when state is 0',
        build: CounterBloc.new,
        act: (bloc) => bloc..add(CounterDecrementPressed()),
        expect: () => const <CounterState>[CounterUpdatedState(value: -1)],
      );

      blocTest<CounterBloc, CounterState>(
        'emits [-1, -2] when state is 0 and invoked twice',
        build: CounterBloc.new,
        act: (bloc) => bloc
          ..add(CounterDecrementPressed())
          ..add(CounterDecrementPressed()),
        expect: () => const <CounterState>[CounterUpdatedState(value: -1), CounterUpdatedState(value: -2)],
      );

      blocTest<CounterBloc, CounterState>(
        'emits [42] when state is 43',
        build: CounterBloc.new,
        seed: () => const CounterUpdatedState(value: 43),
        act: (bloc) => bloc..add(CounterDecrementPressed()),
        expect: () => const <CounterState>[CounterUpdatedState(value: 42)],
      );
    });
  });
}

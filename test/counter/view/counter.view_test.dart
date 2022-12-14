import 'package:bloc_example/counter/bloc/counter.bloc.dart';
import 'package:bloc_example/counter/bloc/counter.event.dart';
import 'package:bloc_example/counter/bloc/counter.state.dart';
import 'package:bloc_example/counter/view/counter.view.dart';
import 'package:bloc_example/main.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterBloc extends MockBloc<CounterEvent, CounterState> implements CounterBloc {}

void main() {
  late CounterBloc counterBloc;

  setUp(() {
    counterBloc = MockCounterBloc();
  });

  group('CounterView', () {
    testWidgets('renders current CounterBloc state', (tester) async {
      when(() => counterBloc.state).thenReturn(const CounterState(value: 42));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterBloc,
            child: const CounterView(),
          ),
        ),
      );
      expect(find.text('42'), findsOneWidget);
    });

    testWidgets('tapping increment button invokes increment', (tester) async {
      when(() => counterBloc.state).thenReturn(const CounterState(value: 0));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterBloc,
            child: const CounterView(),
          ),
        ),
      );
      final incrementFinder = find.byKey(keyButtonIncrement);
      await tester.ensureVisible(incrementFinder);
      await tester.tap(incrementFinder);
      verify(() => counterBloc.add(CounterIncrementPressed())).called(1);
    });

    testWidgets('tapping decrement button invokes decrement', (tester) async {
      when(() => counterBloc.state).thenReturn(const CounterState(value: 0));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterBloc,
            child: const CounterView(),
          ),
        ),
      );
      final decrementFinder = find.byKey(keyButtonDecrement);
      await tester.ensureVisible(decrementFinder);
      await tester.tap(decrementFinder);
      verify(() => counterBloc.add(CounterDecrementPressed())).called(1);
    });
  });
}

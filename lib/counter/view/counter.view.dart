import 'package:bloc_example/counter/bloc/counter.bloc.dart';
import 'package:bloc_example/counter/bloc/counter.event.dart';
import 'package:bloc_example/counter/bloc/counter.state.dart';
import 'package:bloc_example/counter/view/widgets/counter_text.widget.dart';
import 'package:bloc_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            CounterText(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: keyButtonIncrement,
            onPressed: () => counterBloc.add(CounterIncrementPressed()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            key: keyButtonDecrement,
            onPressed: () => counterBloc.add(CounterDecrementPressed()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

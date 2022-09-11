import 'package:bloc_example/counter/bloc/counter.bloc.dart';
import 'package:bloc_example/counter/bloc/counter.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final counterValue = context.select((CounterBloc bloc) => bloc.state.value);
    return Column(
      children: [
        Text(
          '$counterValue',
          style: Theme.of(context).textTheme.headline4,
        ),
        BlocBuilder<CounterBloc, CounterState>(
          buildWhen: (context, state) {
            bool isTen = state is CounterIsTenState;
            return isTen;
          },
          builder: (context, state) {
            if (state is CounterIsTenState) {
              return const Text('ZEHN');
            }
            return Container();
          },
        ),
      ],
    );
  }
}

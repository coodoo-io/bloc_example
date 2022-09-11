import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  const CounterState({required this.value});
  final int value;

  @override
  List<Object?> get props => [value];
}

class CounterInitializedState extends CounterState {
  const CounterInitializedState({required super.value});
}

class CounterUpdatedState extends CounterState {
  const CounterUpdatedState({required super.value});
}

class CounterIsTenState extends CounterState {
  const CounterIsTenState({required super.value});
}

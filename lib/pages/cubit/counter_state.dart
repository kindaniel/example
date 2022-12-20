part of 'counter_cubit.dart';

class CounterState {
  var value = 0;
}

class CounterInitial extends CounterState {}

class CounterError extends CounterState {}

class CounterLoading extends CounterState {}

class CounterSuccess extends CounterState {
  @override
  // ignore: overridden_fields
  final int value;

  CounterSuccess({required this.value});
}

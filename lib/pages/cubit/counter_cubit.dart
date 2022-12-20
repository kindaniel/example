import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment() async {
    //emit(CounterSuccess(value: state.value + 1));
    emit(CounterError());
  }
}

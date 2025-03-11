import 'package:bloc_practice/bloc/counter_event.dart';
import 'package:bloc_practice/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<Increment>((event, emit) {
      emit(CounterState(count: state.count + event.count));
    });
    on<Decrement>((event, emit) {
      if (state.count > 50) {
        emit(CounterState(count: state.count-event.count));
      }
    });
  }
}

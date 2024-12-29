import 'package:cubit_341/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit() : super(0); ///initial state
  List<Map<String, dynamic>> data = [];

  /// events
  void incrementCount() {
    emit(state+1);
  }

  void decrementCount() {
    if(state>0) {
      emit(state - 1);
    }
  }

}
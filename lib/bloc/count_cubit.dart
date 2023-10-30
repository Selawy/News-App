import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'count_states.dart';

class CountCubit extends Cubit<CountStates>{
  CountCubit():super(CountInitState());
  static CountCubit get(context)=>BlocProvider.of(context);
  int count = 0;
  void inc(){
    count++;
    emit(CountChangeState());
  }
  void dec(){
    count-- ;
    emit(CountChangeDecState());
  }
}
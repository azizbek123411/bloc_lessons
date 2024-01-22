import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int>{
    CounterBloc(): super(10){
      on<CounterIncEvent>(_onInc);
      on<CounterDecEvent>(_onDec);
    }

    _onInc(CounterIncEvent event,Emitter<int> emitter){
      emit(state+1);
    }
    _onDec(CounterDecEvent event,Emitter<int> emitter){
      if(state<=0){
        return;
      }
      emit(state-1);
    }

}

abstract class CounterEvent{}
class CounterIncEvent extends CounterEvent{}
class CounterDecEvent extends CounterEvent{}
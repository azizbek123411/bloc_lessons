import 'package:bloc/bloc.dart';
import 'package:bloc_lessons/user_bloc/user_event.dart';

import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState()) {
    on<UserGetUsersEvent>(_onGetUser);
    on<UserGetJobEvent>(_onGetJob);
  }

  _onGetJob(UserGetJobEvent event, Emitter<UserState> emit) async {
    emit(
      state.copyWith(isLoading: true),
    );
    await Future.delayed(const Duration(seconds: 2));
    final job = List.generate(
      event.count,
      (index) => Jobs(name: 'developer', id: index.toString()),
    );
    emit(
      state.copyWith(jobs: job),
    );
  }

  _onGetUser(UserGetUsersEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    final users = List.generate(
      event.count,
      (index) => Users(
        name: 'user name',
        id: index.toString(),
      ),
    );
    emit(state.copyWith(user: users));
  }
}

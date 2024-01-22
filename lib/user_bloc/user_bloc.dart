import 'package:bloc/bloc.dart';
import 'package:bloc_lessons/user_bloc/user_event.dart';

import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserGetUsersEvent>(_onGetUser);
  }

  _onGetUser(UserGetUsersEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    final users = List.generate(
      event.count,
      (index) => Users(
        name: 'user name',
        id: index.toString(),
      ),
    );
    emit(
      UserLoadState(users: users),
    );
  }
}

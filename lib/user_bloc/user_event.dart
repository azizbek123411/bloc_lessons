import 'package:flutter/material.dart';

@immutable
abstract class UserEvent {}

class UserGetUsersEvent extends UserEvent {
  final int count;

  UserGetUsersEvent(this.count);
}

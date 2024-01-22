import 'package:flutter/material.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadState extends UserState {
  final List<Users> users;

  UserLoadState({required this.users});
}
class UserLoadingState extends UserState{}

class Users {
  final String name;
  final String id;

  Users({required this.name, required this.id});
}

import 'package:flutter/material.dart';

class UserState {
  final List<Users> user;
  final List<Jobs> jobs;
  final bool isLoading;

  UserState({
    this.user = const [],
    this.jobs = const [],
    this.isLoading = false,
  });

  UserState copyWith(
      {
        List<Users>? user,
        List<Jobs>? jobs,
        bool isLoading = false
      }) {
    return UserState(
      user: user??this.user,
      jobs: jobs??this.jobs,
      isLoading: isLoading,
    );
  }
}

class Users {
  final String name;
  final String id;

  Users({required this.name, required this.id});
}

class Jobs {
  final String name;
  final String id;

  Jobs({required this.name, required this.id});
}

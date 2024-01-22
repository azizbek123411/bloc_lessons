import 'package:bloc_lessons/counter_bloc/counter_bloc.dart';
import 'package:bloc_lessons/user_bloc/user_bloc.dart';
import 'package:bloc_lessons/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../user_bloc/user_event.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final counterBloc=CounterBloc();
    final userBloc=UserBloc();
    return BlocProvider<UserBloc>(
      create: (BuildContext context)=>userBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'User Bloc',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
          ),
        ),
        body:  Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<UserBloc,UserState>(
                  bloc: userBloc,
                  builder: (context,state){
                    final user=state.user;
                    final job=state.jobs;
                return Column(
                  children: [
                    if(user.isEmpty&&state.isLoading)
                      const CircularProgressIndicator(),
                    if(user.isNotEmpty)...user.map((e) => Text(e.name)),
                    if(user.isNotEmpty)...job.map((e) => Text(e.name)),
                  ],
                );
              })
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButton(
              onPressed: () {
                userBloc.add(UserGetUsersEvent(counterBloc.state));
              },
              child: const Icon(Icons.person),
            ),
            FilledButton(
              onPressed: () {
                userBloc.add(UserGetJobEvent(counterBloc.state));
              },
              child: const Icon(Icons.work),
            ),
          ],
        ),
      ),
    );
  }
}

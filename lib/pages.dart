import 'package:bloc_lessons/counter_bloc.dart';
import 'package:bloc_lessons/user_bloc/user_bloc.dart';
import 'package:bloc_lessons/user_bloc/user_event.dart';
import 'package:bloc_lessons/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = CounterBloc();
    final userBloc=UserBloc();
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => counterBloc,
        ),
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Flutter Bloc",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              BlocBuilder<CounterBloc, int>(
                bloc: counterBloc,
                builder: (context, state) {
                  return Text(
                    state.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 55,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
              BlocBuilder<UserBloc,UserState>(
                  bloc:userBloc,
                  builder: (context,state){
                  return  Column(
                    children: [
                      if(state is UserLoadingState)
                        const CircularProgressIndicator(),
                      if(state is UserLoadState)
                        ...state.users.map((e) => Text(e.name)),
                    ],
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FilledButton(
              onPressed: () {
                counterBloc.add(CounterIncEvent());
              },
              child: const Icon(Icons.plus_one),
            ),
            FilledButton(
              onPressed: () {
                counterBloc.add(CounterDecEvent());
              },
              child: const Icon(Icons.exposure_minus_1),
            ),
            FilledButton(
              onPressed: () {
                userBloc.add(UserGetUsersEvent(counterBloc.state));
              },
              child: const Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}

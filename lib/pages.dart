import 'package:bloc_lessons/counter_bloc.dart';
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
    final bloc=CounterBloc();
    return BlocProvider<CounterBloc>(
      create: (BuildContext context) =>bloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Flutter Bloc",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: BlocBuilder<CounterBloc,int>(
            bloc: bloc,
            builder: (context,state){
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
        ),
        floatingActionButton:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FilledButton(
              onPressed: () {
                bloc.add(CounterIncEvent());
              },
              child: const Icon(Icons.plus_one),
            ),
            FilledButton(
              onPressed: () {
                bloc.add(CounterDecEvent());
              },
              child: const Icon(Icons.exposure_minus_1),
            ),
          ],
        ),
      ),
    );
  }
}

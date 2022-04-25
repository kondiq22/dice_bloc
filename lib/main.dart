import 'package:dice_bloc/blocs/cubit/game_history_cubit.dart';
import 'package:dice_bloc/blocs/cubit/new_round_cubit.dart';
import 'package:dice_bloc/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/cubit/win_counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewRoundCubit(),
        ),
        BlocProvider(
          create: (context) => GameHistoryCubit(),
        ),
        BlocProvider(
          create: (context) => WinCounterCubit(),
          child: Container(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const HomePage(),
      ),
    );
  }
}

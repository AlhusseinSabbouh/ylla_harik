// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ylla_harik/constants/constants.dart';
import 'package:ylla_harik/data/dataProvider/games/games_local_data_base.dart';
import 'package:ylla_harik/data/repositories/gamesRepo.dart';
import 'package:ylla_harik/logic/bloc/games_bloc.dart';

import 'package:ylla_harik/logic/cubit/counter_cubit.dart';
import 'package:ylla_harik/logic/cubit/language_cubit.dart';
import 'package:ylla_harik/presentation/router/app_router.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _c = await SharedPreferences.getInstance();
  final Constants cc = Constants();
  cc.lang = _c.getString("lang") ?? 'en';
  // int a = await cc.getWord();
  runApp(MyApp(cc
      // connectivity: Connectivity(),
      ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();
  final Constants _c;

  MyApp(this._c);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (BuildContext context) => CounterCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => GamesBloc(),
        ),
        BlocProvider<LanguageCubit>(
          create: (BuildContext context) => LanguageCubit(_c),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}

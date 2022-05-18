import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ylla_harik/constants/constants.dart';
import 'package:ylla_harik/logic/cubit/counter_cubit.dart';
import 'package:ylla_harik/logic/cubit/internet_cubit.dart';
import 'package:ylla_harik/logic/cubit/language_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.title, required this.color});

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedRadio = 0;
  @override
  void initState() {
    super.initState();
    if (context.read<LanguageCubit>().getLang() == 'en')
      selectedRadio = 2;
    else
      selectedRadio = 1;
  }

  saveData(String lang) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('lang', lang);
  }

  GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // return BlocListener<InternetCubit, InternetState>(
    //   listener: (context, state) {
    //     if (state is InternetConnected &&
    //         state.connectionType == ConnectionType.Mobile)
    //       BlocProvider.of<CounterCubit>(context).increment();
    //     else if (state is InternetConnected &&
    //         state.connectionType == ConnectionType.Mobile)
    //       BlocProvider.of<CounterCubit>(context).increment();
    //   },
    // child:
    return Scaffold(
      key: homeScreenKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 3, 50, 95),
        title: Text(context.read<LanguageCubit>().homePage!),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Text(
              //   'You have pushed the button this many times:',
              // ),
              // BlocConsumer<CounterCubit, CounterState>(
              //   listener: (context, state) {
              //     if (state.wasIncremented == true) {
              //       ScaffoldMessenger.of(context).removeCurrentSnackBar();
              //       ScaffoldMessenger.of(context)
              //           .showSnackBar(SnackBar(content: Text('increment')));
              //     } else {
              //       ScaffoldMessenger.of(context).removeCurrentSnackBar();
              //       ScaffoldMessenger.of(context)
              //           .showSnackBar(SnackBar(content: Text('decrement')));
              //     }
              //   },
              //   builder: (context, state) {
              //     if (state.counterValue < 0) {
              //       return Text(
              //         'BRR, NEGATIVE ' + state.counterValue.toString(),
              //         style: Theme.of(context).textTheme.headline4,
              //       );
              //     } else if (state.counterValue % 2 == 0) {
              //       return Text(
              //         'YAAAY ' + state.counterValue.toString(),
              //         style: Theme.of(context).textTheme.headline4,
              //       );
              //     } else if (state.counterValue == 5) {
              //       return Text(
              //         'HMM, NUMBER 5',
              //         style: Theme.of(context).textTheme.headline4,
              //       );
              //     } else
              //       return Text(
              //         state.counterValue.toString(),
              //         style: Theme.of(context).textTheme.headline4,
              //       );
              //   },
              // ),
              // SizedBox(
              //   height: 24,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     FloatingActionButton(
              //       heroTag: Text('${widget.title}'),
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).decrement();
              //         // context.bloc<CounterCubit>().decrement();
              //       },
              //       tooltip: 'Decrement',
              //       child: Icon(Icons.remove),
              //     ),
              //     FloatingActionButton(
              //       heroTag: Text('${widget.title} 2nd'),
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).increment();
              //         // context.bloc<CounterCubit>().increment();
              //       },
              //       tooltip: 'Increment',
              //       child: Icon(Icons.add),
              //     ),
              //   ],
              // ),
              // BlocBuilder<InternetCubit, InternetState>(
              //     builder: (context, state) {
              //   if (state is InternetConnected &&
              //       state.connectionType == ConnectionType.Mobile)
              //     return Text("Mobile");
              //   else if (state is InternetConnected &&
              //       state.connectionType == ConnectionType.Wifi)
              //     return Text("Mobile");
              //   else
              //     return Text("nothing");
              // }),
              // SizedBox(
              //   height: 24,
              // ),

              // MaterialButton(
              //   color: Colors.redAccent,
              //   child: Text(
              //     'Go to data picker',
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   onPressed: () {
              //     Navigator.of(context).pushNamed(
              //       '/dataPicker',
              //       // arguments: homeScreenKey,
              //     );
              //   },
              // ),
              // SizedBox(
              //   height: 24,
              // ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 3, 72, 136)),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/show_all_game',
                        // arguments: homeScreenKey,
                      );
                    },
                    child: Text(context.read<LanguageCubit>().showAllgames!)),
              ),
              // SizedBox(
              //   height: 24,
              // ),
              // MaterialButton(
              //   color: Colors.greenAccent,
              //   child: Text(
              //     'Go to Third Screen',
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   onPressed: () {
              //     Navigator.of(context).pushNamed(
              //       '/third',
              //     );
              //   },
              // ),

              SizedBox(
                height: 10,
              ),

              Card(
                color: Color.fromARGB(255, 3, 72, 136),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      context.read<LanguageCubit>().setLanguage!,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              context.read<LanguageCubit>().arabic!,
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Radio(
                              value: 1,
                              groupValue: selectedRadio,
                              activeColor: Color.fromARGB(255, 170, 210, 243),
                              onChanged: (val) {
                                setState(() {
                                  ScaffoldMessenger.of(context)
                                      .removeCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration: Duration(seconds: 1),
                                          content:
                                              Text('اللفة أصبحت العربية')));
                                  context
                                      .read<LanguageCubit>()
                                      .updateLang('ar');
                                  saveData('ar');
                                });

                                setSelectedRadio(1);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              context.read<LanguageCubit>().english!,
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Radio(
                              value: 2,
                              groupValue: selectedRadio,
                              activeColor: Color.fromARGB(255, 170, 210, 243),
                              onChanged: (val) {
                                setState(() {
                                  ScaffoldMessenger.of(context)
                                      .removeCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration: Duration(seconds: 1),
                                          content:
                                              Text('the language is english')));
                                  context
                                      .read<LanguageCubit>()
                                      .updateLang('en');
                                  saveData('en');
                                });

                                setSelectedRadio(2);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }
}

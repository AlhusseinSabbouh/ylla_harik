import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ylla_harik/data/models/games.dart';
import 'package:ylla_harik/logic/bloc/games_bloc.dart';
import 'package:ylla_harik/logic/cubit/game_page_cubit_cubit.dart';
import 'package:ylla_harik/logic/cubit/language_cubit.dart';
import 'package:ylla_harik/presentation/widgets/CustomTextFormField.dart';

import '../../data/dataProvider/games/games_local_data_base_helper.dart';

class AddNewGames extends StatelessWidget {
  GamePageCubitCubit _gamePageCubitCubit = GamePageCubitCubit();
  AddNewGames({Key? key}) : super(key: key);
  GlobalKey<FormState> _formDataKey = GlobalKey<FormState>();
  String date = "";
  DateTime initDate = DateTime.now();
  DateTime firstDate = DateTime.now();
  TimeOfDay initTime = TimeOfDay.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 0, minute: 0);
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    _gamePageCubitCubit.description = '';
    _gamePageCubitCubit.date = "";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 3, 50, 95),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/show_all_game');
          },
        ),
        title: Text(context.read<LanguageCubit>().addNewGame!),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                    key: _formDataKey,
                    child: Column(children: [
                      CustomTextFormField(
                          labelText: context.read<LanguageCubit>().enterTitle!,
                          onSaved: (title) {
                            _gamePageCubitCubit.title = title!;
                          },
                          validator: (value) {
                            if (value == null || value == "") {
                              return context.read<LanguageCubit>().errorTitle!;
                            }
                          }),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                          labelText: context.read<LanguageCubit>().enterDisc!,
                          onSaved: (desc) {
                            if (desc != null)
                              _gamePageCubitCubit.description = desc;
                          },
                          validator: (value) {
                            return null;
                          }),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        labelText:
                            context.read<LanguageCubit>().enterPlayerNumber!,
                        onSaved: (numberOfPlayer) {
                          _gamePageCubitCubit.numberOfPlayer =
                              int.parse(numberOfPlayer!);
                        },
                        validator: (value) {
                          if (value != null && int.tryParse(value) == null) {
                            return context
                                .read<LanguageCubit>()
                                .errorStringPlayer!;
                          }
                          if (int.parse(value!) > 50)
                            return context
                                .read<LanguageCubit>()
                                .errorNumberPlayer!;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ])),
                SizedBox(
                  height: 15,
                ),
                getImage(gamePageCubitCubit: _gamePageCubitCubit),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 3, 72, 136)),
                          child: Text(context.read<LanguageCubit>().addDate!),
                          onPressed: () async {
                            final DateTime? selected = await showDatePicker(
                              context: context,
                              initialDate: initDate,
                              firstDate: firstDate,
                              lastDate: DateTime(2025),
                            );
                            if (selected != null) {
                              selectedDate = selected;
                              initDate = selected;
                              // firstDate = selected;
                            }
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 3, 72, 136)),
                          child: Text(context.read<LanguageCubit>().addTime!),
                          onPressed: () async {
                            final TimeOfDay? selected1 = await showTimePicker(
                              context: context,
                              initialTime: initTime,
                              builder: (context, child) {
                                return MediaQuery(
                                  data: MediaQuery.of(context)
                                      .copyWith(alwaysUse24HourFormat: true),
                                  child: child ?? Container(),
                                );
                              },
                            );
                            if (selected1 != null) {
                              selectedTime = selected1;
                              initTime = selected1;
                            }
                          }),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 159, 193, 228),
          child: Icon(
            Icons.save,
            color: Color.fromARGB(255, 3, 72, 136),
          ),
          onPressed: () {
            if (_formDataKey.currentState!.validate() == true) {
              _formDataKey.currentState!.save();

              selectedDate = DateTime(selectedDate.year, selectedDate.month,
                  selectedDate.day, selectedTime.hour, selectedTime.minute);
              _gamePageCubitCubit.date = selectedDate.toIso8601String();
              _gamePageCubitCubit.saveGamesToDB();
              Navigator.of(context).popAndPushNamed('/show_all_game');
            } else {}
          }),
    );
  }
}

class getImage extends StatelessWidget {
  const getImage({
    Key? key,
    required GamePageCubitCubit gamePageCubitCubit,
  })  : _gamePageCubitCubit = gamePageCubitCubit,
        super(key: key);

  final GamePageCubitCubit _gamePageCubitCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 3, 72, 136)),
          onPressed: () async {
            final ImagePicker _picker = ImagePicker();
            final XFile? image =
                await _picker.pickImage(source: ImageSource.gallery);

            if (image == null) {
              _gamePageCubitCubit.image = "";
            } else {
              final Directory directory =
                  await getApplicationDocumentsDirectory();
              final String path = directory.path;
              await image.saveTo(path + "/${image.name}");
              _gamePageCubitCubit.image = "${path}/${image.name}";
            }
          },
          child: Text(context.read<LanguageCubit>().choseImage!)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylla_harik/data/models/games.dart';
import 'package:ylla_harik/logic/cubit/language_cubit.dart';
import 'package:ylla_harik/logic/cubit/sendsms_cubit.dart';
import 'package:ylla_harik/presentation/widgets/CustomTextFormField.dart';

class AddFriend extends StatelessWidget {
  SendsmsCubit smsCubit;
  GamesModel gamesModel;

  AddFriend({required this.gamesModel, required this.smsCubit, Key? key})
      : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final DateTime time = DateTime.parse(gamesModel.dateTime!);
    final String msg = context.read<LanguageCubit>().canYoucame! +
        " " +
        gamesModel.title +
        " " +
        context.read<LanguageCubit>().gameOn! +
        " " +
        time.year.toString() +
        "/" +
        time.month.toString() +
        "/" +
        time.day.toString() +
        " " +
        context.read<LanguageCubit>().at! +
        " " +
        time.hour.toString() +
        ":" +
        time.minute.toString();
    smsCubit.msgContent = msg;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 50, 95),
        centerTitle: true,
        title: Text(context.read<LanguageCubit>().inviteFriend!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                        labelText:
                            context.read<LanguageCubit>().yourFriendNumber!,
                        onSaved: (number) {},
                        validator: (number) {
                          if (int.tryParse(number!) != null &&
                              number.length > 8) {
                            smsCubit.msgContent = msg;
                            smsCubit.number = number;
                          } else if (number.length < 9) {
                            return context
                                .read<LanguageCubit>()
                                .errorShortNumber!;
                          } else {
                            return context
                                .read<LanguageCubit>()
                                .errorEnterRightValue!;
                          }
                        }),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 3, 72, 136)),
                  onPressed: () async {
                    if (_formKey.currentState!.validate() == true) {
                      await smsCubit.sendSms();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(context.read<LanguageCubit>().sendSms!)),
            )
          ],
        ),
      ),
    );
  }
}

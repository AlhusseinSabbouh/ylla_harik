import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ylla_harik/data/models/games.dart';
import 'package:ylla_harik/logic/cubit/language_cubit.dart';
import 'package:ylla_harik/logic/cubit/sendsms_cubit.dart';
import 'package:ylla_harik/presentation/screens/invite_friend_by_sms.dart';

class OneGameDetal extends StatelessWidget {
  final GamesModel gamesModel;
  OneGameDetal({required this.gamesModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(gamesModel.dateTime!);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 3, 50, 95),
        title: Text(gamesModel.title),
      ),
      body: ListView(children: [
        Column(
          children: [
            SizedBox(
              height: 10,
            ),
            (gamesModel.image == "" || gamesModel.image == null)
                ? SizedBox(
                    height: 1,
                  )
                : Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border:
                            Border.all(color: Color.fromARGB(255, 3, 50, 95)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 80,
                              spreadRadius: 20,
                              color: Color.fromARGB(255, 185, 181, 180))
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.file(
                        File(gamesModel.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            (gamesModel.description != null && gamesModel.description != "")
                ? Container(
                    width: MediaQuery.of(context).size.width * 0.97,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 3, 50, 95),
                                width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 30,
                        color: Color.fromARGB(255, 159, 193, 228),
                        child: ListTile(
                          title: Text(
                            gamesModel.description!,
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        )),
                  )
                : SizedBox(
                    height: 0,
                  ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.97,
                child: Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Color.fromARGB(255, 3, 50, 95), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 30,
                  color: Color.fromARGB(255, 159, 193, 228),
                  child: ListTile(
                      title: RichText(
                    text: TextSpan(children: [
                      TextSpan(text: context.read<LanguageCubit>().maxPlayeris),
                      TextSpan(
                          text: gamesModel.numberOfPlayer.toString(),
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                      TextSpan(text: context.read<LanguageCubit>().player!)
                    ], style: TextStyle(fontSize: 16.5, color: Colors.black)),
                  )),
                )),

            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    // height: MediaQuery.of(context).size.width * 0.3,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 3, 50, 95), width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 30,
                      color: Color.fromARGB(255, 159, 193, 228),
                      child: Column(children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          context.read<LanguageCubit>().month!,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          DateTime.parse(gamesModel.dateTime!).month.toString(),
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        )
                      ]),
                    )),
                SizedBox(
                  width: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    // height: MediaQuery.of(context).size.width * 0.3,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 3, 50, 95), width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 30,
                      color: Color.fromARGB(255, 159, 193, 228),
                      child: Column(children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          context.read<LanguageCubit>().day!,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          DateTime.parse(gamesModel.dateTime!).day.toString(),
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        )
                      ]),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.97,
                child: Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Color.fromARGB(255, 3, 50, 95), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 30,
                  color: Color.fromARGB(255, 159, 193, 228),
                  child: ListTile(
                      title: Text(
                    time.hour.toString() + ' : ' + time.minute.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  )),
                ))

            // Center(child: Text(gamesModel.numberOfPlayer.toString())),
            // (gamesModel.dateTime != null && gamesModel.dateTime != null)
            //     ? Text(time.month.toString())
            //     : Text("there is no date"),
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 159, 193, 228),
          child: Icon(
            Icons.person_add,
            color: Color.fromARGB(255, 3, 50, 95),
          ),
          onPressed: () {
            SendsmsCubit smsCubit = SendsmsCubit();
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
              return AddFriend(gamesModel: gamesModel, smsCubit: smsCubit);
            })));
          }),
    );
  }
}

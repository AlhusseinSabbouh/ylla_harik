import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:ylla_harik/cubit/counter_cubit.dart';
import 'package:ylla_harik/logic/bloc/games_bloc.dart';
import 'package:ylla_harik/logic/cubit/language_cubit.dart';
import 'package:ylla_harik/presentation/screens/game_detail_page.dart';
import 'package:ylla_harik/presentation/screens/update_game.dart';

class GamesPage extends StatelessWidget {
  // GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GamesBloc>(context).add(DoNothin());
    BlocProvider.of<GamesBloc>(context).add(GetAllGames());

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 3, 50, 95),
          title: Text(context.read<LanguageCubit>().allGames!)),
      body: Center(
        child: BlocBuilder<GamesBloc, GamesState>(builder: (context, state) {
          if (state is GameLoading) {
            return Text("game Loading");
          } else if (state is GamesUpdated) {
            BlocProvider.of<GamesBloc>(context).add(GetAllGames());
            return CircularProgressIndicator();
          } else if (state is GamesLoaded) {
            GamesLoaded stat = state;

            return ListView.separated(
                separatorBuilder: ((context, index) {
                  return SizedBox(height: 10);
                }),
                itemCount: state.gamesModelList.length,
                itemBuilder: (context, i) {
                  return Container(
                    child: Card(
                      color: Color.fromARGB(255, 159, 193, 228),
                      child: Column(children: [
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 20,
                            shadowColor: Color.fromARGB(255, 128, 158, 184),
                            color: Color.fromARGB(255, 3, 72, 136),
                            margin: EdgeInsets.all(5),
                            child: Column(children: [
                              ListTile(
                                title: Center(
                                  child: Text(
                                    state.gamesModelList[i].title.substring(
                                        0,
                                        (state.gamesModelList[i].title.length >
                                                50)
                                            ? 50
                                            : state.gamesModelList[i].title
                                                .length),
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 207, 232, 238),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: ((context) {
                                    return OneGameDetal(
                                        gamesModel: state.gamesModelList[i]);
                                  })));
                                },
                              ),
                              SizedBox(
                                height: 1,
                              ),
                            ])),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 212, 219, 226)),
                                    onPressed: () {
                                      showDialogDelete(context, state, i);
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Color.fromARGB(255, 248, 0, 0),
                                    )),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary:
                                          Color.fromARGB(255, 212, 219, 226)),
                                  onPressed: () {
                                    {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) {
                                        return UpdateGame(
                                            gamesModel:
                                                state.gamesModelList[i]);
                                      })));
                                    }
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: Color.fromARGB(255, 226, 152, 40),
                                  ),
                                ),
                              ),
                            ])
                      ]),
                    ),
                  );
                });
          } else if (state is NoGames) {
            return Center(
              child: Text(context.read<LanguageCubit>().noGames!),
            );
          } else if (state is GamesDeleted) {
            BlocProvider.of<GamesBloc>(context).add(GetAllGames());
            return CircularProgressIndicator();
          } else if (state is GamesUpdated) {
            BlocProvider.of<GamesBloc>(context).add(GetAllGames());
            return CircularProgressIndicator();
          } else {
            return CircularProgressIndicator();
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 159, 193, 228),
          child: Icon(
            Icons.add,
            color: Color.fromARGB(255, 3, 50, 95),
          ),
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/add_new_game');
          }),
    );
  }

  Future<dynamic> showDialogDelete(
      BuildContext context, GamesLoaded state, int i) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          context.read<LanguageCubit>().applyDelete!,
          style: TextStyle(fontSize: 25, color: Colors.red),
          textAlign: TextAlign.center,
        ),
        content: Text(
          state.gamesModelList[i].title.toString() +
              context.read<LanguageCubit>().youWillDelete!,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 3, 72, 136)),
                onPressed: () async {
                  deleteFile(File(state.gamesModelList[i].image!));
                  Navigator.of(ctx).pop();
                  BlocProvider.of<GamesBloc>(context)
                      .add(DeleteGames(gamesId: state.gamesModelList[i].id));
                },
                child: Text(context.read<LanguageCubit>().yes!),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 3, 72, 136)),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text(context.read<LanguageCubit>().no!))
            ],
          ),
        ],
      ),
    );
  }

  Future<void> deleteFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      // Error in getting access to the file.
    }
  }
}

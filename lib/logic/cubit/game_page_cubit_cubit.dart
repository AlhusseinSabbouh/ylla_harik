// ignore_for_file: unnecessary_this

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylla_harik/data/models/games.dart';
import 'package:ylla_harik/logic/bloc/games_bloc.dart';
import 'package:ylla_harik/presentation/screens/add_new_game.dart';
import 'package:ylla_harik/presentation/screens/update_game.dart';

part 'game_page_cubit_state.dart';

class GamePageCubitCubit extends Cubit<GamePageCubitState> {
  GamePageCubitCubit() : super(GamePageCubitInitial());

  GamesBloc _gamesBloc = GamesBloc();

  int _id = 0;
  int _numberOfPlayer = 10;
  String _title = "";
  String _description = "";
  String _image = "";
  String _date = "";

  set id(int id) => this._id = id;
  set numberOfPlayer(int num) => this._numberOfPlayer = num;
  set title(String title) => this._title = title;
  set description(String desc) => this._description = desc;
  set image(String img) => this._image = img;
  set date(String dates) => this._date = dates;

  int get id => this._id;
  int get numberOfPlayer => this._numberOfPlayer;
  String get description => this._description;
  String get title => this._title;
  String get image => this._image;
  String get date => this._date;

  saveGamesToDB() {
    final GamesModel gamesModel = GamesModel(
        id: this._id,
        numberOfPlayer: this._numberOfPlayer,
        title: this._title,
        description: this._description,
        image: this._image,
        dateTime: this._date);

    _gamesBloc.add(CreateNewGames(gamesModel: gamesModel));
  }

  updateGameToDB() {
    final GamesModel gamesModel = GamesModel(
        id: this._id,
        numberOfPlayer: this._numberOfPlayer,
        title: this._title,
        description: this._description,
        image: this._image,
        dateTime: this._date);

    _gamesBloc.add(UpdateOneGame(
      gamesModel: gamesModel,
      gamesId: gamesModel.id,
    ));
  }
}

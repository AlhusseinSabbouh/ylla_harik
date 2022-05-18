import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ylla_harik/data/models/games.dart';
import 'package:ylla_harik/data/repositories/gamesRepo.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final gamesRepo = GamesRepo();
  GamesBloc() : super(GameLoading()) {
    on<GamesEvent>((event, emit) async {
      if (event is GetAllGames) {
        try {
          final List<GamesModel> gamesModel = await gamesRepo.getAllGames();

          if (gamesModel.length != 0)
            emit(GamesLoaded(gamesModelList: gamesModel));
          else
            emit(NoGames());
        } catch (e) {
          emit(NoGames());
        }
      } else if (event is CreateNewGames) {
        CreateNewGames eventsNow = event;
        try {
          final int gamesId =
              await gamesRepo.createNewGames(eventsNow.gamesModel);
        } catch (e) {}
      } else if (event is DeleteGames) {
        try {
          final int gamesIdDeleted =
              await gamesRepo.deleteGamesById(event.gamesId);
          emit(GamesDeleted());
        } catch (e) {}
      } else if (event is UpdateOneGame) {
        try {
          final int gamesIdDeleted =
              await gamesRepo.updateGamesById(event.gamesModel);

          emit(GamesUpdated());
        } catch (e) {}
      } else if (event is DoNothin)
        emit(GamesDeleted());
      else {
        emit(GamesDeleted());
      }
    });
  }
}

part of 'games_bloc.dart';

abstract class GamesState extends Equatable {
  const GamesState();

  @override
  List<Object> get props => [];
}

class GameLoading extends GamesState {}

class GamesLoaded extends GamesState {
  List<GamesModel> gamesModelList;
  GamesLoaded({required this.gamesModelList});
}

class OneGamesLoaded extends GamesState {
  GamesModel gamesModel;
  OneGamesLoaded({required this.gamesModel});
}

class GamesDeleted extends GamesState {}

class GamesUpdated extends GamesState {}

class NoGames extends GamesState {}

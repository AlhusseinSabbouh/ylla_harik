part of 'games_bloc.dart';

class GamesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DeleteGames extends GamesEvent {
  int gamesId;
  DeleteGames({required this.gamesId});
}

class GetAllGames extends GamesEvent {}

class GetOneGame extends GamesEvent {
  int gamesId;
  GetOneGame({required this.gamesId});
}

class UpdateOneGame extends GamesEvent {
  GamesModel gamesModel;
  int gamesId;
  UpdateOneGame({required this.gamesModel, required this.gamesId});
}

class DoNothin extends GamesEvent {}

class CreateNewGames extends GamesEvent {
  GamesModel gamesModel;
  CreateNewGames({required this.gamesModel});
}

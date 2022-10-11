part of 'movies_details_bloc.dart';

@immutable
abstract class MoviesDetailsEvent {

  const MoviesDetailsEvent();
}

class GetMoviesDetailsEvent extends MoviesDetailsEvent{

  final int  id;

  const GetMoviesDetailsEvent({required this.id});
}

class GetMoviesRecommendationEvent extends MoviesDetailsEvent{

  final int  id;

  const GetMoviesRecommendationEvent({required this.id});
}

import 'package:bloc_clean_architecture/core/utilis/enums.dart';
import 'package:bloc_clean_architecture/moves/data/models/movies_model.dart';

class MoviesState {
  final MoviesModel? nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final MoviesModel? popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final MoviesModel? topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  MoviesState(
      {this.nowPlayingMovies,
      this.nowPlayingState = RequestState.loading,
      this.nowPlayingMessage = '',
      this.popularMovies,
      this.popularMessage = '',
      this.popularState = RequestState.loading,
      this.topRatedMovies,
      this.topRatedMessage = '',
      this.topRatedState = RequestState.loading});

  MoviesState copyWith({
    MoviesModel? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    MoviesModel? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    MoviesModel? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }
}

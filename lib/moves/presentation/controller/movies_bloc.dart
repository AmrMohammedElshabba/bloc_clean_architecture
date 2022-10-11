import 'package:bloc_clean_architecture/core/utilis/enums.dart';
import 'package:bloc_clean_architecture/moves/domain/usecases/now_playing_movies_usecase.dart';
import 'package:bloc_clean_architecture/moves/domain/usecases/popular_movies_usecase.dart';
import 'package:bloc_clean_architecture/moves/domain/usecases/top_rated_movies_usecase.dart';
import 'package:bloc_clean_architecture/moves/presentation/controller/movies_event.dart';
import 'package:bloc_clean_architecture/moves/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getTopRatedMoviesUseCase,
      this.getPopularMoviesUseCase)
      : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.getPlayingNowMovies();
      result.fold(
          (errorMessage) => {
                emit(state.copyWith(
                  nowPlayingMessage: errorMessage,
                  nowPlayingState: RequestState.error,
                ))
              }, (movies) {
        emit(state.copyWith(
            nowPlayingMovies: movies, nowPlayingState: RequestState.loaded));
      });
    });
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.getPopularMovies();
      result.fold(
          (errorMessage) => {
                emit(state.copyWith(
                    popularMessage: errorMessage,
                    popularState: RequestState.error))
              }, (movies) {
        emit(state.copyWith(
            popularMovies: movies, popularState: RequestState.loaded));
      });
    });
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase.getTopRatedMovies();
      result.fold(
          (errorMessage) => {
                emit(state.copyWith(
                    topRatedMessage: errorMessage,
                    topRatedState: RequestState.error))
              }, (movies) {
        emit(state.copyWith(
            topRatedMovies: movies, topRatedState: RequestState.loaded));
      });
    });
  }
}

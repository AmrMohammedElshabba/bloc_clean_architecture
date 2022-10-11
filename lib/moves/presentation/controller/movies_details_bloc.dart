import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture/core/utilis/enums.dart';
import 'package:bloc_clean_architecture/moves/data/models/movies_details_model.dart';
import 'package:bloc_clean_architecture/moves/domain/usecases/movies_details_usecase.dart';
import 'package:bloc_clean_architecture/moves/domain/usecases/movies_recommendation_usecase.dart';
import 'package:meta/meta.dart';

import '../../data/models/movies_recommendation_model.dart';

part 'movies_details_event.dart';

part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  GetMoviesDetailsUseCase getMoviesDetailsUseCase;
  GetMoviesRecommendationUseCase getMoviesRecommendationUseCase;

  MoviesDetailsBloc(
      this.getMoviesDetailsUseCase, this.getMoviesRecommendationUseCase)
      : super(const MoviesDetailsState()) {
    on<GetMoviesDetailsEvent>((event, emit) async {
      final result = await getMoviesDetailsUseCase.getMoviesDetails(event.id);
      result.fold(
          (errorMessage) => {
                emit(state.copyWith(
                    moviesDetailsState: RequestState.error,
                    moviesDetailsMessage: errorMessage))
              }, (moviesDetails) {
        emit(state.copyWith(
            moviesDetailsModel: moviesDetails,
            moviesDetailsState: RequestState.loaded));
      });
    });

    on<GetMoviesRecommendationEvent>((event, emit) async {
      final result = await getMoviesRecommendationUseCase
          .getMoviesRecommendation(event.id);
      result.fold(
          (errorMessage) => {
                emit(state.copyWith(
                    moviesRecommendationState: RequestState.error,
                    moviesRecommendationMessage: errorMessage))
              }, (moviesRecommendation) {
        emit(state.copyWith(
            moviesRecommendationModel: moviesRecommendation,
            moviesRecommendationState: RequestState.loaded));
      });
    });
  }
}

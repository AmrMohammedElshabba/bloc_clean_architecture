part of 'movies_details_bloc.dart';

@immutable
class MoviesDetailsState {
  final RequestState moviesDetailsState;
  final String moviesDetailsMessage;
  final MoviesDetailsModel? moviesDetailsModel;
  final RequestState moviesRecommendationState;
  final String moviesRecommendationMessage;
  final MoviesRecommendationModel? moviesRecommendationModel;

  const MoviesDetailsState({
    this.moviesDetailsState = RequestState.loading,
    this.moviesDetailsMessage = '',
    this.moviesDetailsModel,
    this.moviesRecommendationState = RequestState.loading,
    this.moviesRecommendationMessage = '',
    this.moviesRecommendationModel,
  });

  MoviesDetailsState copyWith({
    RequestState? moviesDetailsState,
    String? moviesDetailsMessage,
    MoviesDetailsModel? moviesDetailsModel,
    RequestState? moviesRecommendationState,
    String? moviesRecommendationMessage,
    MoviesRecommendationModel? moviesRecommendationModel,
  }) {
    return MoviesDetailsState(
      moviesDetailsModel: moviesDetailsModel ?? this.moviesDetailsModel,
      moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
      moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
      moviesRecommendationModel:
          moviesRecommendationModel ?? this.moviesRecommendationModel,
      moviesRecommendationState:
          moviesRecommendationState ?? this.moviesRecommendationState,
      moviesRecommendationMessage:
          moviesRecommendationMessage ?? this.moviesRecommendationMessage,
    );
  }
}

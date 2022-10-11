import 'package:bloc_clean_architecture/core/api_client/api_client.dart';
import 'package:bloc_clean_architecture/core/api_client/api_constance.dart';
import 'package:bloc_clean_architecture/moves/data/models/movies_details_model.dart';
import 'package:bloc_clean_architecture/moves/data/models/movies_model.dart';
import 'package:bloc_clean_architecture/moves/data/models/movies_recommendation_model.dart';
import '../../../core/api_client/remote_response.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<RemoteResponse<MoviesModel>> getNowPlayingMovies();

  Future<RemoteResponse<MoviesModel>> getPopularMovies();

  Future<RemoteResponse<MoviesModel>> getTopRatedMovies();

  Future<RemoteResponse<MoviesDetailsModel>> getMoviesDetails(int id);

  Future<RemoteResponse<MoviesRecommendationModel>> getMoviesRecommendation(
      int id);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  RemoteService remoteService;

  MoviesRemoteDataSource(this.remoteService);

  @override
  Future<RemoteResponse<MoviesModel>> getNowPlayingMovies() async {
    final remoteResponse = await remoteService.httpGet(
      ApiConstance.nowPlayingMoviesPath,
    );
    return remoteResponse.when(
      noConnection: () => const RemoteResponse.noConnection(),
      failure: (message) => RemoteResponse.failure(message),
      data: (movies) {
        return RemoteResponse.data(MoviesModel.fromJson(movies));
      },
    );
  }

  @override
  Future<RemoteResponse<MoviesModel>> getPopularMovies() async {
    final remoteResponse = await remoteService.httpGet(
      ApiConstance.popularMoviesPath,
    );
    return remoteResponse.when(
      noConnection: () => const RemoteResponse.noConnection(),
      failure: (message) => RemoteResponse.failure(message),
      data: (movies) {
        print(movies);
        return RemoteResponse.data(MoviesModel.fromJson(movies));
      },
    );
  }

  @override
  Future<RemoteResponse<MoviesModel>> getTopRatedMovies() async {
    final remoteResponse = await remoteService.httpGet(
      ApiConstance.topRatedMoviesPath,
    );
    return remoteResponse.when(
      noConnection: () => const RemoteResponse.noConnection(),
      failure: (message) => RemoteResponse.failure(message),
      data: (movies) {
        return RemoteResponse.data(MoviesModel.fromJson(movies));
      },
    );
  }

  @override
  Future<RemoteResponse<MoviesDetailsModel>> getMoviesDetails(int id) async {
    final remoteResponse = await remoteService.httpGet(
      ApiConstance.moviesDetails(id),
    );
    return remoteResponse.when(
      noConnection: () => const RemoteResponse.noConnection(),
      failure: (message) => RemoteResponse.failure(message),
      data: (movies) {
        return RemoteResponse.data(MoviesDetailsModel.fromJson(movies));
      },
    );
  }

  @override
  Future<RemoteResponse<MoviesRecommendationModel>> getMoviesRecommendation(
      int id) async {
    final remoteResponse = await remoteService.httpGet(
      ApiConstance.moviesRecommendation(id),
    );
    return remoteResponse.when(
      noConnection: () => const RemoteResponse.noConnection(),
      failure: (message) => RemoteResponse.failure(message),
      data: (movies) {
        return RemoteResponse.data(MoviesRecommendationModel.fromJson(movies));
      },
    );
  }
}

import 'package:bloc_clean_architecture/moves/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/movies_model.dart';

class GetNowPlayingMoviesUseCase {
  BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  Future<Either<String, MoviesModel >> getPlayingNowMovies() async {
    return await baseMoviesRepository.getNowPlaying();
  }
}

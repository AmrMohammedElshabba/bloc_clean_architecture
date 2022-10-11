import 'package:bloc_clean_architecture/moves/data/models/movies_details_model.dart';
import 'package:dartz/dartz.dart';
import '../repository/base_movies_repository.dart';

class GetMoviesDetailsUseCase {
  BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCase(this.baseMoviesRepository);

  Future<Either<String, MoviesDetailsModel >> getMoviesDetails(int id) async {
    return await baseMoviesRepository.getMoviesDetails(id);
  }
}
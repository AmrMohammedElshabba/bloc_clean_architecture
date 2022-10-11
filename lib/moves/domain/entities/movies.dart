import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int id;
  final String backdrop;
  final List<int> genreId;
  final String overview;
  final String title;
  final double voteAverage;
  final String releaseDate;

  const Movies(
      {required this.id,
      required this.backdrop,
      required this.genreId,
      required this.overview,
      required this.title,
      required this.voteAverage,
      required this.releaseDate});

  @override
  List<Object> get props => [
        id,
        backdrop,
        genreId,
        overview,
        title,
        voteAverage,
        releaseDate,
      ];
}

import 'package:my_movie_box/features/movie_details/domain/entities/movie_details.dart';

abstract class MovieDetailsRepository {
  Future<MovieDetails> getMovieDetails(int movieId);
}

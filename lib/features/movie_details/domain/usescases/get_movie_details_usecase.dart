import 'package:my_movie_box/core/usecase/usecase.dart';
import 'package:my_movie_box/features/movie_details/domain/models/movie_details.dart';
import 'package:my_movie_box/features/movie_details/domain/repository/move_details_repository.dart';

class GetMovieDetailsUsecase extends FutureBaseUsecase<MovieDetails, int> {
  final MovieDetailsRepository _movieDetailsRepository;

  GetMovieDetailsUsecase(
      {required MovieDetailsRepository movieDetailsRepository})
      : _movieDetailsRepository = movieDetailsRepository;

  @override
  Future<MovieDetails> call({int? params}) async {
    final movieDetails = await _movieDetailsRepository.getMovieDetails(params!);
    return movieDetails;
  }

  // @override
  // Future<MovieDetails> call({void params}) async {
  //   final movieDetails = await _movieDetailsRepository.getMovieDetails();
  //   return movieDetails;
  // }
}

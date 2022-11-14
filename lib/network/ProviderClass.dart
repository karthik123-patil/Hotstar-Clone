import 'package:hotstar_clone/network/ApiService.dart';
import 'package:hotstar_clone/screens/models/similar_movies.dart';
import 'package:hotstar_clone/screens/models/top_rated.dart';
import 'package:hotstar_clone/screens/models/trending_movies.dart';
import 'package:hotstar_clone/screens/models/tv_shows.dart';

import '../screens/models/movie.dart';

class ProviderClass {
  ApiService apiService = ApiService();

  Future<Movie> getMovies() async {
    final response = await apiService.getMovies();
    return Movie.fromJson(response);
  }

  Future<TopRated> getTopRatedMovies() async {
    final response = await apiService.getTopRatedMovies();
    return TopRated.fromJson(response);
  }

  Future<TrendingMovies> getTrendingMovies() async {
    final response = await apiService.getTrendingMovies();
    return TrendingMovies.fromJson(response);
  }

  Future<TvShows> getTvShows() async {
    final response = await apiService.getTvShows();
    return TvShows.fromJson(response);
  }

  Future<SimilarMovies> getSimilarMovies(String movieId) async {
    final response = await apiService.getSimilarMovies(movieId);
    return SimilarMovies.fromJson(response);
  }
}
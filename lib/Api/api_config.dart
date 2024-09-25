import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/Api/end_points.dart';
import 'package:movies/screens/home_tab/Api/get_popular_movies_response.dart';
import 'package:movies/screens/home_tab/Api/get_similar_movies_response.dart';
import 'package:movies/screens/home_tab/Api/get_top_level_details_of_movies_response.dart';
import 'package:movies/screens/home_tab/Api/get_top_rated_movies_response.dart';
import 'package:movies/screens/home_tab/Api/get_upcoming_movies_response.dart';
import 'package:dartz/dartz.dart';
import '../screens/watchlist_tab/Api/GetMovieWatchListResponse.dart';
import '../tempelates/failures.dart';

class ApiConfig {
  /*
  https://api.themoviedb.org/3/movie/now_playing
  */

  //Bearer+token=>identify to the server that the token is used for Authorization

  static const baseUrl = 'api.themoviedb.org';
  static const String baseUrlBrowse = 'https://api.themoviedb.org/3';
  static const String apiKey = 'c83ed93775649d77ef86afd6196fcdcc';
  static Future<Either<Failure, GetUpcomingMoviesResponse>>
      getUpcomingMovies() async {
    Uri url = Uri.https(baseUrl, EndPoints.upcoming);
    try {
      var response = await http.get(url, headers: {
        'Authorization':
            ' Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0Y2JhNmUwOTJjMGIxMjE1ODFmODczNjY0ZWFmMGQ2NCIsIm5iZiI6MTcyNzA0MTkzMS4zODgzMTYsInN1YiI6IjY2ZjA5MGQxMDMxNWI5MWY0NjNhZGY3ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DYcNn1OAQ8qhY_KQONyoc7aawl-6FLtpen2vm-pAs5E'
      });
      var stringResponse = response.body;
      var json = jsonDecode(stringResponse);
      var getMovies = GetUpcomingMoviesResponse.fromJson(json);
      if (response.statusCode == 401) {
        return Left(SereverError(errorMsg: getMovies.status_message!));
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getMovies);
      } else {
        return Left(SereverError(errorMsg: getMovies.status_message!));
      }
    } catch (e) {
      return Left(SereverError(errorMsg: e.toString()));
    }
  }
  static Future<Either<Failure, bool>> isMovieInWatchlist({
    required int movieId,
  }) async {
    Uri url = Uri.https(baseUrl, '/3/movie/$movieId/account_states', {
      'api_key': apiKey,
    });

    try {
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjODNlZDkzNzc1NjQ5ZDc3ZWY4NmFmZDYxOTZmY2RjYyIsIm5iZiI6MTcyNjcyODQ4My43NzQwNTQsInN1YiI6IjY2ZTI3NTJkOTAxM2ZlODcyMjIzNmU2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0McKweUI35vyapA5g552I6VUGPCgVLF6O7tHLAZfK5c',
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        bool isInWatchlist = jsonResponse['watchlist'] ?? false;
        return Right(isInWatchlist);
      } else {
        var jsonResponse = jsonDecode(response.body);
        String errorMsg = jsonResponse['status_message'] ?? 'Unknown error';
        return Left(Failure(errorMsg: errorMsg));
      }
    } catch (e) {
      return Left(Failure(errorMsg: e.toString()));
    }
  }

  static Future<Either<Failure, GetTopRatedMoviesResponse>>
      getTopRatedMovies() async {
    Uri url = Uri.https(baseUrl, EndPoints.topRated);
    try {
      var response = await http.get(url, headers: {
        'Authorization':
            ' Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjODNlZDkzNzc1NjQ5ZDc3ZWY4NmFmZDYxOTZmY2RjYyIsIm5iZiI6MTcyNjcyODQ4My43NzQwNTQsInN1YiI6IjY2ZTI3NTJkOTAxM2ZlODcyMjIzNmU2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0McKweUI35vyapA5g552I6VUGPCgVLF6O7tHLAZfK5c'
      });
      var stringResponse = response.body;
      var json = jsonDecode(stringResponse);
      var getMovies = GetTopRatedMoviesResponse.fromJson(json);
      if (response.statusCode == 401) {
        return Left(SereverError(errorMsg: getMovies.status_message!));
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getMovies);
      } else {
        return Left(SereverError(errorMsg: getMovies.status_message!));
      }
    } catch (e) {
      return Left(SereverError(errorMsg: e.toString()));
    }
  }

  static Future<Either<Failure, GetTopRatedMoviesResponse>> setMovieWatchList({
    required int mediaId,
    required bool watchlist,
  }) async {
    Uri url = Uri.https(baseUrl, EndPoints.setWatchList, {
      'api_key': apiKey,
      });

    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjODNlZDkzNzc1NjQ5ZDc3ZWY4NmFmZDYxOTZmY2RjYyIsIm5iZiI6MTcyNjkyMDM5My44NDMyNDMsInN1YiI6IjY2ZTI3NTJkOTAxM2ZlODcyMjIzNmU2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OwCL316pYqiYR8mE_Sjc0zvOVHTo6nfA7KyNju2OaiA',
        },
        body: jsonEncode({
          "media_type": "movie",
          "media_id": mediaId,
          "watchlist": watchlist,
        }),
      );

      if (response.statusCode == 401) {
        return Left(Failure(errorMsg: "Unauthorized request. Check API Key, Session ID, and Bearer Token."));
      } else if (response.statusCode >= 200 && response.statusCode < 300) {

        var json = jsonDecode(response.body);
        var setWatchlistResponse = GetTopRatedMoviesResponse.fromJson(json);
        return Right(setWatchlistResponse);
      } else {
        var json = jsonDecode(response.body);
        return Left(Failure(errorMsg: json['status_message'] ?? "Unknown error"));
      }
    } catch (e) {
      return Left(Failure(errorMsg: e.toString()));
    }
  }
  static Future<Either<Failure, GetPopularMoviesResponse>>
      getPopularMovies() async {
    Uri url = Uri.https(baseUrl, EndPoints.popular);
    try {
      var response = await http.get(url, headers: {
        'Authorization':
            ' Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjODNlZDkzNzc1NjQ5ZDc3ZWY4NmFmZDYxOTZmY2RjYyIsIm5iZiI6MTcyNjcyODQ4My43NzQwNTQsInN1YiI6IjY2ZTI3NTJkOTAxM2ZlODcyMjIzNmU2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0McKweUI35vyapA5g552I6VUGPCgVLF6O7tHLAZfK5c'
      });
      var stringResponse = response.body;
      var json = jsonDecode(stringResponse);
      var getMovies = GetPopularMoviesResponse.fromJson(json);
      if (response.statusCode == 401) {
        return Left(SereverError(errorMsg: getMovies.status_message!));
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getMovies);
      } else {
        return Left(SereverError(errorMsg: getMovies.status_message!));
      }
    } catch (e) {
      return Left(SereverError(errorMsg: e.toString()));
    }
  }

  static Future<Either<Failure, GetSimilarMoviesResponse>> getSimilarMovies(
      String mId) async {
    Uri url = Uri.https(baseUrl, '${EndPoints.movie}$mId/similar');
    try {
      var response = await http.get(url, headers: {
        'Authorization':
            ' Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjODNlZDkzNzc1NjQ5ZDc3ZWY4NmFmZDYxOTZmY2RjYyIsIm5iZiI6MTcyNjcyODQ4My43NzQwNTQsInN1YiI6IjY2ZTI3NTJkOTAxM2ZlODcyMjIzNmU2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0McKweUI35vyapA5g552I6VUGPCgVLF6O7tHLAZfK5c'
      });
      var stringResponse = response.body;
      var json = jsonDecode(stringResponse);
      var getMovies = GetSimilarMoviesResponse.fromJson(json);
      if (response.statusCode == 401) {
        return Left(SereverError(errorMsg: getMovies.status_message!));
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getMovies);
      } else {
        return Left(SereverError(errorMsg: getMovies.status_message!));
      }
    } catch (e) {
      return Left(SereverError(errorMsg: e.toString()));
    }
  }

  static Future<Either<Failure, GetMovieWatchListResponse>>
      getMoviesWatchList() async {
    Uri url = Uri.https(baseUrl, EndPoints.getWatchList);
    try {
      var response = await http.get(url, headers: {
        'Authorization':
            ' Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjODNlZDkzNzc1NjQ5ZDc3ZWY4NmFmZDYxOTZmY2RjYyIsIm5iZiI6MTcyNjcyODQ4My43NzQwNTQsInN1YiI6IjY2ZTI3NTJkOTAxM2ZlODcyMjIzNmU2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0McKweUI35vyapA5g552I6VUGPCgVLF6O7tHLAZfK5c'
      });
      var stringResponse = response.body;
      var json = jsonDecode(stringResponse);
      var getMovies = GetMovieWatchListResponse.fromJson(json);
      if (response.statusCode == 401) {
        return Left(SereverError(errorMsg: getMovies.status_message!));
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getMovies);
      } else {
        return Left(SereverError(errorMsg: getMovies.status_message!));
      }
    } catch (e) {
      return Left(SereverError(errorMsg: e.toString()));
    }
  }

  static Future<Either<Failure, GetTopLevelDetailsOfMoviesResponse>>
      getTopLevelDetailsOfMovies(String mId) async {
    Uri url = Uri.https(baseUrl, '${EndPoints.movie}$mId');
    try {
      var response = await http.get(url, headers: {
        'Authorization':
            ' Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjODNlZDkzNzc1NjQ5ZDc3ZWY4NmFmZDYxOTZmY2RjYyIsIm5iZiI6MTcyNjcyODQ4My43NzQwNTQsInN1YiI6IjY2ZTI3NTJkOTAxM2ZlODcyMjIzNmU2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0McKweUI35vyapA5g552I6VUGPCgVLF6O7tHLAZfK5c'
      });
      var stringResponse = response.body;
      var json = jsonDecode(stringResponse);
      var getMovies = GetTopLevelDetailsOfMoviesResponse.fromJson(json);
      if (response.statusCode == 401) {
        return Left(SereverError(errorMsg: getMovies.status_message!));
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getMovies);
      } else {
        return Left(SereverError(errorMsg: getMovies.status_message!));
      }
    } catch (e) {
      return Left(SereverError(errorMsg: e.toString()));
    }
  }

  // Fetch genres from The Movie Database API
  static Future<List<dynamic>> getGenres() async {
    final url = Uri.parse('$baseUrlBrowse/genre/movie/list?api_key=$apiKey');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['genres'];
      } else {
        throw Exception('Failed to load genres');
      }
    } catch (error) {
      throw Exception('Error fetching genres: $error');
    }
  }

  // Fetch movies by genre from The Movie Database API
  static Future<List<dynamic>> getMoviesByGenre(int genreId) async {
    final url = Uri.parse(
        '$baseUrlBrowse/discover/movie?api_key=$apiKey&with_genres=$genreId');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['results']; // Return list of movies
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      throw Exception('Error fetching movies: $error');
    }
  }
}

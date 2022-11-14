import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  dynamic responseJson;
  Future<dynamic> getMovies() async {
    try {
      final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/550?api_key=729e1a7c701b80aed0ea8cecdfe9b475"));
      responseJson = _response(response);
      return responseJson;
    }on TimeoutException catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<dynamic> getTopRatedMovies() async {
    try {
      final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=729e1a7c701b80aed0ea8cecdfe9b475&language=en-US&page=1"));
      responseJson = _response(response);
      return responseJson;
    }on TimeoutException catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
  Future<dynamic> getTrendingMovies() async {
    try {
      final response = await http.get(Uri.parse("https://api.themoviedb.org/3/trending/all/day?api_key=729e1a7c701b80aed0ea8cecdfe9b475"));
      responseJson = _response(response);
      return responseJson;
    }on TimeoutException catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<dynamic> getTvShows() async {
    try {
      final response = await http.get(Uri.parse("https://api.themoviedb.org/3/tv/popular?api_key=729e1a7c701b80aed0ea8cecdfe9b475&language=en-US&page=1"));
      responseJson = _response(response);
      return responseJson;
    }on TimeoutException catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<dynamic> getSimilarMovies(String movieId) async {
    try {
      final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$movieId/similar?api_key=729e1a7c701b80aed0ea8cecdfe9b475&language=en-US&page=1"));
      responseJson = _response(response);
      return responseJson;
    }on TimeoutException catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        {
          var responseJson = json.decode(response.body.toString());
          return responseJson;
        }
      case 201:
        {
          var responseJson = json.decode(response.body.toString());
          return responseJson;
        }
      case 400:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 401:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 403:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 404:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 500:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
    }
  }
}
import 'package:dio/dio.dart';
import 'package:peliculas/config/constants/environment.dart';
import 'package:peliculas/domain/datasources/movie_datasource.dart';
import 'package:peliculas/domain/entities/movie.dart';

// Esta es la implementacion del Datasource
class MoviedbDatasource extends MovieDatasource{

  // definimos dio acá
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    // Extraer la data. Pero se debe transformar en Movie[]
    final response = await dio.get('/movie/now_playing');

    final List<Movie> movies = [];
    
    return movies;
  }

}
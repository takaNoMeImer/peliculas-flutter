import 'package:peliculas/domain/datasources/movie_datasource.dart';
import 'package:peliculas/domain/entities/movie.dart';
import 'package:peliculas/domain/repositories/movie_respository.dart';

// Asi como ya hay implementancion de datasource, tambien debe haber del repository
// Como repository es el que llama a datasource para controlarlo, por eso se ve asi. Para que cuando usemos un gestor de estado, llamando esta clase, ya tome datasource
class MovieRepositoryImpl extends MovieRepository {
  final MovieDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}

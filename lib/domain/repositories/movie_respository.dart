import 'package:peliculas/domain/entities/movie.dart';

// Repositories son los que llaman al datasource
// por eso son casi identicos

// El repository es el que nos permite cambiar el origen de datos (datasource)
// de esa forma solo cambia el respository
abstract class MovieRepository {

  Future<List<Movie>> getNowPlaying({ int page = 1 });

}
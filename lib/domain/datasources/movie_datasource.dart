// Como es una regla meramente es abstracta
// no se requieren instancias de esta

// Datasource son los origenes de datos
import 'package:peliculas/domain/entities/movie.dart';

abstract class MovieDatasource {

  // getNowPlaying: son las peliculas actualmente en cartelera
  // esto se sabe porque la api lo ofrece. 
  Future<List<Movie>> getNowPlaying({ int page = 1 });

}
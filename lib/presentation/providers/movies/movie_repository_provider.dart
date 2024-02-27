import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/insfrastructure/datasources/moviedb_datasource.dart';
import 'package:peliculas/insfrastructure/repositories/movie_repository_impl.dart';

// Revirpod tiene distintos Provider. Este es de solo lectura
final movieRepositoryProvider = Provider((ref) {
  // Es asi ya que Repository es el que contiene a datasource. 
  // Y se le pasa la implementacion del datasource. que son los datos en si.
  return MovieRepositoryImpl(MoviedbDatasource());
});
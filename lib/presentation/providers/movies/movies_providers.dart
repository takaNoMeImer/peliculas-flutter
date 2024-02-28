// Esta clase es para manejar los providers

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/domain/entities/movie.dart';
import 'package:peliculas/presentation/providers/movies/movie_repository_provider.dart';

// Este es el provider como tal. Y MoviesNotifier es la clase que lo controla. List<Movie> es solo el tipo de la data que fluye por el provider
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

// Este es solo un caso de uso. 
typedef MovieCallback = Future<List<Movie>> Function({int page});

// Este se llama MoviesNotifier, para que nos pueda servir para los otros provider. 
// Tambien podria llamarse NowPlayingMovies...
class MoviesNotifier extends StateNotifier<List<Movie>> {

  // Esta MoviesNotifier nos va a servir para saber cual es la pagina actual
  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}): super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }

}
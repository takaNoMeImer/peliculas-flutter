import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/config/constants/environment.dart';
import 'package:peliculas/presentation/providers/movies/movies_providers.dart';
import 'package:peliculas/presentation/widgets/shared/custom_appbar.dart';
import 'package:peliculas/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
    );
  }
}

// ConsumerStateful es para poder usar riverpod dentro del Stateful Widget
class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  // State<_HomeView> createState() => _HomeViewState();
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    // Debemos acceder a un provider de los creados
    // y a la funcion para tener los datos
    // Si no le pongo el .notifier regresa el estado actual, es decir, el valor actual
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    return Column(
      children: [
        const CustomAppbar(),
        MoviesSlideshow(movies: nowPlayingMovies)
      ],
    );
  }
}

import 'package:brincar_e_conectar_flutter/app/models/brincadeiras.dart';
import 'package:brincar_e_conectar_flutter/app/view/edit/edit.view.dart';
import 'package:go_router/go_router.dart';
import 'view/details/details.view.dart';
import 'view/home/home.view.dart';
import 'view/splash/splash.view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashView()),
    GoRoute(path: '/home', builder: (context, state) => HomeView()),
    GoRoute(
      path: '/brincadeira_detail',
      builder: (context, state) {
        final brincadeiras = state.extra as Brincadeiras;
        return BrincadeiraDetalhesView(brincadeiras: brincadeiras);
      },
    ),
    GoRoute(
      path: '/edit',
      builder: (context, state) {
        final brincadeiras = state.extra as Brincadeiras;
        return EditView(brincadeiras: brincadeiras);
      },
    ),
  ],
);

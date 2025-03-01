import 'package:go_router/go_router.dart';
import 'view/home/home.view.dart';
import 'view/splash/splash.view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashView()),
    GoRoute(path: '/home', builder: (context, state) => HomeView()),
  ],
);

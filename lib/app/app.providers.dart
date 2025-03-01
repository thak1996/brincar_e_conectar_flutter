import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'core/service/brincadeiras.service.dart';
import 'view/home/home.controller.dart';

final List<SingleChildWidget> appProviders = [
  Provider<HomeController>(create: (_) => HomeController()),
  Provider<BrincadeirasService>(create: (_) => BrincadeirasService()),
];

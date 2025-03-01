import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'view/home/home.controller.dart';

final List<SingleChildWidget> appProviders = [
  Provider(create: (_) => HomeController()),
];


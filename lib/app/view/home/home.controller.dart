import 'package:brincar_e_conectar_flutter/app/core/service/brincadeiras.service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/brincadeiras.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(HomeInitial());

  final BrincadeirasService _service = BrincadeirasService();

  Future<void> getBrincadeiras() async {
    emit(HomeLoading());
    await Future.delayed(Duration(seconds: 2));
    final result = await _service.getBrincadeiras();
    result.fold(
      (brincadeiras) => emit(HomeLoaded(brincadeiras)),
      (error) => emit(HomeError(error.toString())),
    );
  }
}

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  HomeLoaded(this.brincadeiras);

  final List<Brincadeiras> brincadeiras;
}

class HomeError extends HomeState {
  HomeError(this.message);

  final String message;
}

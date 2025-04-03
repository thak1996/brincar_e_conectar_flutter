import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/brincadeiras.dart';
import '../../core/service/brincadeiras.service.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(HomeInitial());

  final BrincadeirasService _service = BrincadeirasService();
  List<Brincadeiras> _allBrincadeiras = [];

  Future<void> getAllBrincadeiras() async {
    emit(HomeLoading());
    await Future.delayed(Duration(seconds: 1));
    final result = await _service.getAllBrincadeiras();
    result.fold((brincadeiras) {
      _allBrincadeiras = brincadeiras;
      emit(HomeLoaded(brincadeiras: brincadeiras, faixaEtariaFilter: 'todas'));
    }, (error) => emit(HomeError(error.toString())));
  }

  void filterBrincadeiras(String? faixaEtaria) {
    emit(HomeLoading());
    if (faixaEtaria == null || faixaEtaria == 'todas') {
      emit(
        HomeLoaded(brincadeiras: _allBrincadeiras, faixaEtariaFilter: 'todas'),
      );
    } else {
      final filteredBrincadeiras =
          _allBrincadeiras
              .where((brincadeira) => brincadeira.faixaEtaria == faixaEtaria)
              .toList();
      emit(
        HomeLoaded(
          brincadeiras: filteredBrincadeiras,
          faixaEtariaFilter: faixaEtaria,
        ),
      );
    }
  }
}

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  HomeLoaded({required this.brincadeiras, required this.faixaEtariaFilter});

  final List<Brincadeiras> brincadeiras;
  final String faixaEtariaFilter;
}

class HomeError extends HomeState {
  HomeError(this.message);

  final String message;
}

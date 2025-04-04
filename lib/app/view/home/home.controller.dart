import 'package:brincar_e_conectar_flutter/app/core/utils/enum.utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/brincadeiras.dart';
import '../../core/service/brincadeiras.service.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(HomeInitial());

  final BrincadeirasService _service = BrincadeirasService();
  List<Brincadeiras> _allBrincadeiras = [];

  void filterBrincadeiras(String? faixaEtaria) {
    emit(HomeLoading());
    if (faixaEtaria == null || faixaEtaria == 'todas') {
      emit(
        HomeLoaded(brincadeiras: _allBrincadeiras, faixaEtariaFilter: 'todas'),
      );
    } else {
      final faixaEtariaEnum = FaixaEtariaExtension.fromString(faixaEtaria);
      if (faixaEtariaEnum != null) {
        final filteredBrincadeiras =
            _allBrincadeiras.where((brincadeira) {
              return brincadeira.faixaEtaria == faixaEtariaEnum;
            }).toList();
        emit(
          HomeLoaded(
            brincadeiras: filteredBrincadeiras,
            faixaEtariaFilter: faixaEtaria,
          ),
        );
      } else {
        emit(HomeError('Faixa etária inválida'));
      }
    }
  }

  Future<void> getAllBrincadeiras() async {
    emit(HomeLoading());
    await Future.delayed(Duration(seconds: 1));
    final result = await _service.getAllBrincadeiras();
    result.fold((brincadeiras) {
      _allBrincadeiras = brincadeiras;
      emit(HomeLoaded(brincadeiras: brincadeiras, faixaEtariaFilter: 'todas'));
    }, (error) => emit(HomeError(error.toString())));
  }

  void deleteBrincadeira(Brincadeiras brincadeira) async {
    emit(HomeLoading());
    final result = await _service.delBrincadeira(brincadeira.id!);
    result.fold((sucess) {
      _allBrincadeiras.remove(brincadeira);
      emit(
        HomeLoaded(brincadeiras: _allBrincadeiras, faixaEtariaFilter: 'todas'),
      );
    }, (error) => emit(HomeError('Erro ao deletar a brincadeira: $error')));
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

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/service/brincadeiras.service.dart';
import '../../models/brincadeiras.dart';

class EditController extends Cubit<EditState> {
  EditController() : super(EditInitial());

  final BrincadeirasService _service = BrincadeirasService();

  void saveBrincadeira(Brincadeiras brincadeira) async {
    emit(EditLoading());
    await Future.delayed(Duration(seconds: 1));
    final result = await _service.addBrincadeira(brincadeira);
    result.fold(
      (sucess) => emit(EditSuccess(sucess.toString())),
      (error) => emit(EditError(error.toString())),
    );
  }

  void updateBrincadeira(Brincadeiras brincadeira) async {
    emit(EditLoading());
    await Future.delayed(Duration(seconds: 1));
    final result = await _service.editBrincadeira(brincadeira);
    result.fold(
      (sucess) => emit(EditSuccess(sucess.toString())),
      (error) => emit(EditError(error.toString())),
    );
  }
}

abstract class EditState {}

class EditInitial extends EditState {}

class EditLoading extends EditState {}

class EditSuccess extends EditState {
  EditSuccess(this.message);

  final String message;
}

class EditError extends EditState {
  EditError(this.message);

  final String message;
}

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/brincadeiras.dart';

class EditController extends Cubit<EditState> {
  EditController() : super(EditInitial());

  // final BrincadeirasService _service = BrincadeirasService();

}

abstract class EditState {}

class EditInitial extends EditState {}

class EditLoading extends EditState {}

class EditLoaded extends EditState {
  EditLoaded({required this.brincadeira});

  final Brincadeiras brincadeira;
}

class EditSuccess extends EditState {
  EditSuccess(this.message);

  final String message;
}

class EditError extends EditState {
  EditError(this.message);

  final String message;
}
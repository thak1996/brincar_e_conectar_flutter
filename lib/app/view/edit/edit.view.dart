import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/brincadeiras.dart';
import '../widgets/app.bar.widget.dart';
import 'edit.controller.dart';

class EditView extends StatelessWidget {
  final Brincadeiras? brincadeiras;

  const EditView({super.key, this.brincadeiras});

  @override
  Widget build(BuildContext context) {
    final TextEditingController tituloController = TextEditingController(
      text: brincadeiras?.titulo ?? '',
    );
    final TextEditingController descricaoController = TextEditingController(
      text: brincadeiras?.descricao ?? '',
    );

    return BlocProvider(
      create: (_) => EditController(),
      child: Scaffold(
        appBar: AppBarWidget(
          title:
              brincadeiras == null
                  ? 'Nova Brincadeira' //
                  : 'Editar Brincadeira',
        ),
        body: BlocConsumer<EditController, EditState>(
          listener: (context, state) {
            if (state is EditSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
              Navigator.pop(context);
            } else if (state is EditError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Erro: ${state.message}')));
            }
          },
          builder: (context, state) {
            if (state is EditLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: tituloController,
                    decoration: const InputDecoration(
                      labelText: 'Título',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: descricaoController,
                    decoration: const InputDecoration(
                      labelText: 'Descrição',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // context.read<EditController>().saveBrincadeira(
                      //   updatedBrincadeira,
                      // );
                    },
                    child: Text(brincadeiras == null ? 'Criar' : 'Salvar'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

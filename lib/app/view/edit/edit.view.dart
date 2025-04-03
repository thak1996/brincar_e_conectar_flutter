import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/brincadeiras.dart';
import 'edit.controller.dart';

class EditView extends StatelessWidget {
  final Brincadeiras? brincadeira;

  const EditView({super.key, this.brincadeira});

  @override
  Widget build(BuildContext context) {
    final TextEditingController tituloController = TextEditingController(
      text: brincadeira?.titulo ?? '',
    );
    final TextEditingController descricaoController = TextEditingController(
      text: brincadeira?.descricao ?? '',
    );

    return BlocProvider(
      create: (_) => EditController(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            brincadeira == null ? 'Nova Brincadeira' : 'Editar Brincadeira',
          ),
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
                      final updatedBrincadeira =
                          brincadeira?.copyWith(
                            titulo: tituloController.text,
                            descricao: descricaoController.text,
                            updatedAt: DateTime.now().toString(),
                          ) ??
                          Brincadeiras(
                            id: null,
                            titulo: tituloController.text,
                            descricao: descricaoController.text,
                            categoria: '',
                            custo: '',
                            dificuldade: '',
                            duracao: '',
                            faixaEtaria: '',
                            favorito: false,
                            imagem: null,
                            materiais: [],
                            updatedAt: DateTime.now().toString(),
                          );
                      // context.read<EditController>().saveBrincadeira(
                      //   updatedBrincadeira,
                      // );
                    },
                    child: Text(brincadeira == null ? 'Criar' : 'Salvar'),
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

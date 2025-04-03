import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/enum.dart';
import '../../core/utils/validator.dart';
import '../../models/brincadeiras.dart';
import '../widgets/app.bar.widget.dart';
import 'edit.controller.dart';

class EditView extends StatelessWidget {
  final Brincadeiras? brincadeiras;

  const EditView({super.key, this.brincadeiras});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final TextEditingController tituloController = TextEditingController(
      text: brincadeiras?.titulo,
    );
    final TextEditingController descricaoController = TextEditingController(
      text: brincadeiras?.descricao,
    );
    final TextEditingController custoController = TextEditingController(
      text: brincadeiras?.custo,
    );
    final TextEditingController duracaoController = TextEditingController(
      text: brincadeiras?.duracao,
    );
    Categoria? categoriaSelecionada = brincadeiras?.categoria;
    FaixaEtaria? faixaEtariaSelecionada = brincadeiras?.faixaEtaria;
    Dificuldade? dificuldadeSelecionada = brincadeiras?.dificuldade;

    return BlocProvider(
      create: (_) => EditController(),
      child: Scaffold(
        appBar: AppBarWidget(
          title:
              brincadeiras == null ? 'Nova Brincadeira' : 'Editar Brincadeira',
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
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    TextFormField(
                      controller: tituloController,
                      decoration: const InputDecoration(
                        labelText: 'Título',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        return Validator.validateRequiredField(value, 'Título');
                      },
                    ),
                    TextFormField(
                      controller: descricaoController,
                      decoration: const InputDecoration(
                        labelText: 'Descrição',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 4,
                      validator: (value) {
                        return Validator.validateRequiredField(
                          value,
                          'Descrição',
                        );
                      },
                    ),
                    DropdownButtonFormField<Categoria>(
                      value: categoriaSelecionada,
                      decoration: const InputDecoration(
                        labelText: 'Categoria',
                        border: OutlineInputBorder(),
                      ),
                      items:
                          Categoria.values.map((Categoria categoria) {
                            return DropdownMenuItem<Categoria>(
                              value: categoria,
                              child: Text(categoria.name),
                            );
                          }).toList(),
                      onChanged: (Categoria? novaCategoria) {
                        categoriaSelecionada = novaCategoria;
                      },
                    ),
                    TextFormField(
                      controller: custoController,
                      decoration: const InputDecoration(
                        labelText: 'Custo',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      controller: duracaoController,
                      decoration: const InputDecoration(
                        labelText: 'Duração',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    DropdownButtonFormField<FaixaEtaria>(
                      value: faixaEtariaSelecionada,
                      decoration: const InputDecoration(
                        labelText: 'Faixa Etária',
                        border: OutlineInputBorder(),
                      ),
                      items:
                          FaixaEtaria.values.map((FaixaEtaria faixaEtaria) {
                            return DropdownMenuItem<FaixaEtaria>(
                              value: faixaEtaria,
                              child: Text(faixaEtaria.name),
                            );
                          }).toList(),
                      onChanged: (FaixaEtaria? novaFaixaEtaria) {
                        faixaEtariaSelecionada = novaFaixaEtaria;
                      },
                    ),
                    DropdownButtonFormField<Dificuldade>(
                      value: dificuldadeSelecionada,
                      decoration: const InputDecoration(
                        labelText: 'Dificuldade',
                        border: OutlineInputBorder(),
                      ),
                      items:
                          Dificuldade.values.map((Dificuldade dificuldade) {
                            return DropdownMenuItem<Dificuldade>(
                              value: dificuldade,
                              child: Text(dificuldade.name),
                            );
                          }).toList(),
                      onChanged: (Dificuldade? novaDificuldade) {
                        dificuldadeSelecionada = novaDificuldade;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final brincadeira = Brincadeiras(
                          id: brincadeiras?.id ?? 0,
                          titulo: tituloController.text,
                          descricao: descricaoController.text,
                          categoria: categoriaSelecionada!,
                          custo: brincadeiras?.custo ?? '',
                          duracao: brincadeiras?.duracao ?? '1 hora',
                          faixaEtaria: faixaEtariaSelecionada!,
                          dificuldade: dificuldadeSelecionada!,
                          materiais: [],
                          createdAt: brincadeiras?.createdAt ?? '',
                          updatedAt: brincadeiras?.updatedAt ?? '',
                        );
                        if (brincadeiras == null) {
                          context.read<EditController>().saveBrincadeira(
                            brincadeira,
                          );
                        } else {
                          context.read<EditController>().updateBrincadeira(
                            brincadeira,
                          );
                        }
                      },
                      child: Text(brincadeiras == null ? 'Criar' : 'Salvar'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

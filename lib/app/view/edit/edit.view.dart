import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/enum.utils.dart';
import '../../core/utils/validator.dart';
import '../../models/brincadeiras.dart';
import '../widgets/app.bar.widget.dart';
import 'widgets/dropdown.widget.dart';
import 'widgets/materiais.input.widget.dart';
import 'widgets/text.form.field.widget.dart';
import 'edit.controller.dart';

class EditView extends StatelessWidget {
  const EditView({super.key, this.brincadeiras});

  final Brincadeiras? brincadeiras;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController tituloController = TextEditingController(
      text: brincadeiras?.titulo,
    );
    final TextEditingController descricaoController = TextEditingController(
      text: brincadeiras?.descricao,
    );
    Custo? custoSelecionado = brincadeiras?.custo;
    Duracao? duracaoSelecionada = brincadeiras?.duracao;
    Categoria? categoriaSelecionada = brincadeiras?.categoria;
    FaixaEtaria? faixaEtariaSelecionada = brincadeiras?.faixaEtaria;
    Dificuldade? dificuldadeSelecionada = brincadeiras?.dificuldade;
    List<String> materiais = brincadeiras?.materiais ?? [];

    return BlocProvider(
      create: (_) => EditController(),
      child: Scaffold(
        appBar: AppBarWidget(
          title:
              brincadeiras == null ? 'Nova Brincadeira' : 'Editar Brincadeira',
        ),
        body: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 1)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return BlocConsumer<EditController, EditState>(
              listener: (context, state) {
                switch (state) {
                  case EditSuccess():
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                    Navigator.pop(context);
                    break;
                  case EditError():
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Erro: ${state.message}')),
                    );
                    break;
                  default:
                    break;
                }
              },
              builder: (context, state) {
                if (state is EditLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 20,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 16,
                        children: [
                          TextFormFieldWidget(
                            controller: tituloController,
                            labelText: 'Título',
                            validator: (value) {
                              return Validator.validateRequiredField(
                                value,
                                'Título',
                              );
                            },
                          ),
                          TextFormFieldWidget(
                            controller: descricaoController,
                            labelText: 'Descrição',
                            validator: (value) {
                              return Validator.validateRequiredField(
                                value,
                                'Descrição',
                              );
                            },
                          ),
                          Row(
                            spacing: 8,
                            children: [
                              Expanded(
                                flex: 2,
                                child: DropdownFormFieldWidget<Categoria>(
                                  value: categoriaSelecionada,
                                  labelText: 'Categoria',
                                  items:
                                      Categoria.values.map((
                                        Categoria categoria,
                                      ) {
                                        return DropdownMenuItem<Categoria>(
                                          value: categoria,
                                          child: Text(categoria.formatted),
                                        );
                                      }).toList(),
                                  onChanged: (Categoria? novaCategoria) {
                                    categoriaSelecionada = novaCategoria;
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: DropdownFormFieldWidget<Custo>(
                                  value: custoSelecionado,
                                  labelText: 'Custo',
                                  items:
                                      Custo.values.map((Custo custo) {
                                        return DropdownMenuItem<Custo>(
                                          value: custo,
                                          child: Text(custo.formatted),
                                        );
                                      }).toList(),
                                  onChanged: (Custo? novoCusto) {
                                    custoSelecionado = novoCusto;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 8,
                            children: [
                              Expanded(
                                flex: 2,
                                child: DropdownFormFieldWidget<FaixaEtaria>(
                                  value: faixaEtariaSelecionada,
                                  labelText: 'Faixa Etária',
                                  items:
                                      FaixaEtaria.values.map((
                                        FaixaEtaria faixaEtaria,
                                      ) {
                                        return DropdownMenuItem<FaixaEtaria>(
                                          value: faixaEtaria,
                                          child: Text(faixaEtaria.formatted),
                                        );
                                      }).toList(),
                                  onChanged: (FaixaEtaria? novaFaixaEtaria) {
                                    faixaEtariaSelecionada = novaFaixaEtaria;
                                  },
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: DropdownFormFieldWidget<Dificuldade>(
                                  value: dificuldadeSelecionada,
                                  labelText: 'Dificuldade',
                                  items:
                                      Dificuldade.values.map((
                                        Dificuldade dificuldade,
                                      ) {
                                        return DropdownMenuItem<Dificuldade>(
                                          value: dificuldade,
                                          child: Text(dificuldade.formatted),
                                        );
                                      }).toList(),
                                  onChanged: (Dificuldade? novaDificuldade) {
                                    dificuldadeSelecionada = novaDificuldade;
                                  },
                                ),
                              ),
                            ],
                          ),
                          DropdownFormFieldWidget<Duracao>(
                            value: duracaoSelecionada,
                            labelText: 'Duração',
                            onChanged: (Duracao? novaDuracao) {
                              duracaoSelecionada = novaDuracao;
                            },
                            items:
                                Duracao.values.map((Duracao duracao) {
                                  return DropdownMenuItem<Duracao>(
                                    value: duracao,
                                    child: Text(duracao.formatted),
                                  );
                                }).toList(),
                          ),
                          MateriaisInputWidget(
                            materiais: materiais,
                            onMateriaisChanged: (novaLista) {
                              materiais = novaLista;
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              final brincadeira = Brincadeiras(
                                id: brincadeiras?.id,
                                titulo: tituloController.text,
                                descricao: descricaoController.text,
                                categoria: categoriaSelecionada!,
                                custo: custoSelecionado!,
                                duracao: duracaoSelecionada!,
                                faixaEtaria: faixaEtariaSelecionada!,
                                dificuldade: dificuldadeSelecionada!,
                                materiais: materiais,
                                updatedAt: DateTime.now().toIso8601String(),
                                createdAt: brincadeiras?.createdAt,
                              );
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              if (brincadeiras == null) {
                                context.read<EditController>().saveBrincadeira(
                                  brincadeira,
                                );
                              } else {
                                context
                                    .read<EditController>()
                                    .updateBrincadeira(brincadeira);
                              }
                            },
                            child: Text(
                              brincadeiras == null ? 'Criar' : 'Salvar',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

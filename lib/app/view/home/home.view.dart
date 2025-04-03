import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app.bar.widget.dart';
import '../widgets/error.widget.dart';
import '../widgets/listtile.widget.dart';
import 'home.controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeController()..getAllBrincadeiras(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: BlocBuilder<HomeController, HomeState>(
            builder: (context, state) {
              String? selectedFaixaEtaria;
              if (state is HomeLoaded) {
                selectedFaixaEtaria = state.faixaEtariaFilter;
              }
              return AppBarWidget(
                title: 'Brincar e Conectar',
                onFilterChanged: (faixaEtaria) {
                  context.read<HomeController>().filterBrincadeiras(
                    faixaEtaria,
                  );
                },
                showFilter: true,
                selectedFaixaEtaria: selectedFaixaEtaria,
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<HomeController, HomeState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case const (HomeLoading):
                    return const Center(child: CircularProgressIndicator());
                  case const (HomeLoaded):
                    final stateLoaded = state as HomeLoaded;
                    return Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'Lista de Brincadeiras',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: stateLoaded.brincadeiras.length,
                              itemBuilder: (context, index) {
                                final brincadeira =
                                    stateLoaded.brincadeiras[index];
                                return ListTileWidget(
                                  title: brincadeira.titulo,
                                  description: brincadeira.descricao,
                                  onTap: () {
                                    context.push(
                                      '/brincadeira_detail',
                                      extra: brincadeira,
                                    );
                                  },
                                  onDismissed:
                                      () => context
                                          .read<HomeController>()
                                          .deleteBrincadeira(brincadeira),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  case const (HomeError):
                    final stateError = state as HomeError;
                    return HomeErrorWidget(
                      text: stateError.message,
                      onPressed:
                          () =>
                              context
                                  .read<HomeController>()
                                  .getAllBrincadeiras(),
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

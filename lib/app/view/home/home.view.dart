import 'package:brincar_e_conectar_flutter/app/core/constants/styles.dart';
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
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.push('/edit'),
          shape: const CircleBorder(),
          hoverColor: primaryColor,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: stateLoaded.brincadeiras.length,
                                    padding: const EdgeInsets.only(top: 60),
                                    itemBuilder: (context, index) {
                                      final brincadeira =
                                          stateLoaded.brincadeiras[index];
                                      return ListTileWidget(
                                        id: brincadeira.id,
                                        title: brincadeira.titulo,
                                        description: brincadeira.descricao,
                                        onTap:
                                            () => context.push(
                                              '/brincadeira_detail',
                                              extra: brincadeira,
                                            ),
                                        onDelete:
                                            () => context
                                                .read<HomeController>()
                                                .deleteBrincadeira(brincadeira),
                                        onEdit:
                                            () => context.push(
                                              '/edit',
                                              extra: brincadeira,
                                            ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'Lista de Brincadeiras',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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

import 'package:brincar_e_conectar_flutter/app/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app.bar.widget.dart';
import '../widgets/card.widget.dart';
import '../widgets/error.widget.dart';
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
        backgroundColor: accentColor.withValues(alpha: 20),
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
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          itemCount: stateLoaded.brincadeiras.length,
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 12,
                          ),
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final brincadeira = stateLoaded.brincadeiras[index];
                            return CardWidget(
                              title: brincadeira.titulo,
                              description: brincadeira.descricao,
                              onTap: () {
                                return context.push(
                                  '/brincadeira_detail',
                                  extra: brincadeira,
                                );
                              },
                            );
                          },
                        ),
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

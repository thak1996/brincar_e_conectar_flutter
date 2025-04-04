import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app.bar.widget.dart';
import 'widgets/error.widget.dart';
import 'widgets/floating.button.widget.dart';
import 'widgets/listtile.widget.dart';
import 'home.controller.dart';
import 'widgets/title.positioned.widget.dart';

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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingButtonWidget(() => context.push('/edit')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<HomeController, HomeState>(
              builder: (context, state) {
                switch (state) {
                  case HomeLoading():
                    return const Center(child: CircularProgressIndicator());
                  case HomeLoaded():
                    return Expanded(
                      child: Stack(
                        children: [
                          ListView.builder(
                            itemCount: state.brincadeiras.length,
                            padding: const EdgeInsets.only(top: 60),
                            itemBuilder: (context, index) {
                              final brincadeira = state.brincadeiras[index];
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
                          TitlePositioned(),
                        ],
                      ),
                    );
                  case HomeError():
                    return HomeErrorWidget(
                      text: state.message,
                      onPressed: () {
                        context.read<HomeController>().getAllBrincadeiras();
                      },
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

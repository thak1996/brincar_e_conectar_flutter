import 'package:brincar_e_conectar_flutter/app/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home.controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeController()..getBrincadeiras(),
      child: Scaffold(
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
                        child: RefreshIndicator(
                          onRefresh: () async {
                            return context //
                                .read<HomeController>()
                                .getBrincadeiras();
                          },
                          child: ListView.builder(
                            itemCount: stateLoaded.brincadeiras.length,
                            padding: const EdgeInsets.all(8),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final brincadeira =
                                  stateLoaded.brincadeiras[index];
                              return ListTile(
                                title: Text(brincadeira.titulo),
                                subtitle: Text(brincadeira.descricao),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  case const (HomeError):
                    final stateError = state as HomeError;
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            stateError.message,
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: accentColor,
                              foregroundColor: primaryColor,
                            ),
                            onPressed: () {
                              context.read<HomeController>().getBrincadeiras();
                            },
                            child: const Text('Tentar novamente'),
                          ),
                        ],
                      ),
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

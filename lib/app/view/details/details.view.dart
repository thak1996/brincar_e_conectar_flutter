import 'package:brincar_e_conectar_flutter/app/view/widgets/app.bar.widget.dart';
import 'package:flutter/material.dart';
import '../../models/brincadeiras.dart';

class BrincadeiraDetalhesView extends StatelessWidget {
  const BrincadeiraDetalhesView({super.key, required this.brincadeiras});

  final Brincadeiras brincadeiras;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: brincadeiras.titulo),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(brincadeiras.descricao, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

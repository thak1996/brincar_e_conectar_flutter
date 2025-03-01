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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(brincadeiras.descricao, style: const TextStyle(fontSize: 16)),
            const Divider(color: Colors.black),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categoria'),
              subtitle: Text(brincadeiras.categoria),
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Duração'),
              subtitle: Text(brincadeiras.duracao),
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Custo'),
              subtitle: Text(brincadeiras.custo),
            ),
            ListTile(
              leading: const Icon(Icons.emoji_events),
              title: const Text('Dificuldade'),
              subtitle: Text(brincadeiras.dificuldade),
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Faixa Etária'),
              subtitle: Text(brincadeiras.faixaEtaria),
            ),
            const Divider(color: Colors.black),
            const Text(
              'Materiais Necessários',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            for (var material in brincadeiras.materiais)
              ListTile(leading: const Icon(Icons.check), title: Text(material)),
          ],
        ),
      ),
    );
  }
}

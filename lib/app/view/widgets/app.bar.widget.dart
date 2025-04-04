import 'package:flutter/material.dart';
import '../../core/constants/styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.title,
    this.onFilterChanged,
    this.selectedFaixaEtaria,
    this.showFilter = false,
    this.showTitle = true,
  });

  final String? title;
  final Function(String)? onFilterChanged;
  final String? selectedFaixaEtaria;
  final bool showFilter;
  final bool showTitle;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title:
          showTitle
              ? Text(
                title ?? 'Brincar e Conectar',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              )
              : null,
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      actions: [
        if (showFilter)
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: (String value) {
              onFilterChanged?.call(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'todas',
                  child: Text('Todas as idades'),
                ),
                const PopupMenuItem<String>(
                  value: 'crianças',
                  child: Text('Infantil'),
                ),
                const PopupMenuItem<String>(
                  value: 'idosos',
                  child: Text('Idosos'),
                ),
                const PopupMenuItem<String>(
                  value: 'adolescentes',
                  child: Text('Adolescentes'),
                ),
              ];
            },
          ),
      ],
    );
  }
}

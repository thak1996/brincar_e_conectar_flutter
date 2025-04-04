import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    this.id,
    required this.title,
    required this.description,
    required this.onDelete,
    required this.onEdit,
    this.onTap,
  });

  final String description;
  final int? id;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id.toString()),
      direction: DismissDirection.horizontal,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.blue,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          final confirm = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Confirmar Exclusão'),
                content: const Text(
                  'Tem certeza de que deseja apagar esta brincadeira?',
                ),
                actions: [
                  TextButton(
                    onPressed:
                        () => Navigator.of(context).pop(false),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed:
                        () => Navigator.of(context).pop(true),
                    child: const Text('Apagar'),
                  ),
                ],
              );
            },
          );
          if (confirm == true) {
            onDelete();
            return true;
          }
          return false;
        } else if (direction == DismissDirection.endToStart) {
          onEdit();
          return false;
        }
        return false;
      },
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        subtitle: Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        onTap: onTap,
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

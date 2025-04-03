import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.description,
    required this.onDismissed,
  });

  final Function()? onTap;
  final Function()? onDismissed;
  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(title),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        if (onDismissed != null) {
          onDismissed!();
        }
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

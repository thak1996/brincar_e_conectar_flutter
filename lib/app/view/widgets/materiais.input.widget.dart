import 'package:brincar_e_conectar_flutter/app/core/constants/styles.dart';
import 'package:flutter/material.dart';

import '../../core/utils/string.utils.dart';

class MateriaisInputWidget extends StatefulWidget {
  final List<String> materiais;
  final Function(List<String>) onMateriaisChanged;

  const MateriaisInputWidget({
    super.key,
    required this.materiais,
    required this.onMateriaisChanged,
  });

  @override
  MateriaisInputWidgetState createState() => MateriaisInputWidgetState();
}

class MateriaisInputWidgetState extends State<MateriaisInputWidget> {
  final TextEditingController _materialController = TextEditingController();

  void _addMaterial() {
    final material = _materialController.text.trim();
    if (material.isNotEmpty) {
      setState(() {
        widget.materiais.add(material);
        widget.onMateriaisChanged(widget.materiais);
        _materialController.clear();
      });
    }
  }

  void _removeMaterial(String material) {
    setState(() {
      widget.materiais.remove(material);
      widget.onMateriaisChanged(widget.materiais);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _materialController,
          decoration: InputDecoration(
            labelText: 'Material',
            suffixIcon: IconButton(
              icon: Icon(Icons.add),
              onPressed: _addMaterial,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          children:
              widget.materiais.map((material) {
                return Chip(
                  backgroundColor: primaryColor,
                  label: Text(
                    formatUpperCase(material),
                    style: const TextStyle(color: Colors.white),
                  ),
                  deleteIcon: Icon(Icons.close),
                  onDeleted: () => _removeMaterial(material),
                );
              }).toList(),
        ),
      ],
    );
  }
}

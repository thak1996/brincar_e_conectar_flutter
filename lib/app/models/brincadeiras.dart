import 'dart:convert';
import 'package:flutter/foundation.dart';

class Brincadeiras {
  Brincadeiras({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.faixaEtaria,
    required this.materiais,
    required this.duracao,
    required this.custo,
    required this.dificuldade,
    required this.categoria,
    required this.favorito,
    required this.imagem,
  });

  factory Brincadeiras.fromJson(String source) =>
      Brincadeiras.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Brincadeiras.fromMap(Map<String, dynamic> map) {
    return Brincadeiras(
      id: map['id'] is int ? map['id'] : int.parse(map['id'] ?? '0'),
      titulo: map['titulo'] as String? ?? '',
      descricao: map['descricao'] as String? ?? '',
      faixaEtaria: map['faixaEtaria'] as String? ?? '',
      materiais:
          map['materiais'] != null
              ? List<String>.from(map['materiais'] as List)
              : [],
      duracao: map['duracao'] as String? ?? '',
      custo: map['custo'] as String? ?? '',
      dificuldade: map['dificuldade'] as String? ?? '',
      categoria: map['categoria'] as String? ?? '',
      favorito: map['favorito'] as bool? ?? false,
      imagem: map['imagem'] as String? ?? '',
    );
  }

  final String categoria;
  final String custo;
  final String descricao;
  final String dificuldade;
  final String duracao;
  final String faixaEtaria;
  final bool favorito;
  final int id;
  final String imagem;
  final List<String> materiais;
  final String titulo;

  @override
  bool operator ==(covariant Brincadeiras other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.titulo == titulo &&
        other.descricao == descricao &&
        other.faixaEtaria == faixaEtaria &&
        listEquals(other.materiais, materiais) &&
        other.duracao == duracao &&
        other.custo == custo &&
        other.dificuldade == dificuldade &&
        other.categoria == categoria &&
        other.favorito == favorito &&
        other.imagem == imagem;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        titulo.hashCode ^
        descricao.hashCode ^
        faixaEtaria.hashCode ^
        materiais.hashCode ^
        duracao.hashCode ^
        custo.hashCode ^
        dificuldade.hashCode ^
        categoria.hashCode ^
        favorito.hashCode ^
        imagem.hashCode;
  }

  @override
  String toString() {
    return 'Brincadeiras(id: $id, titulo: $titulo, descricao: $descricao, faixaEtaria: $faixaEtaria, materiais: $materiais, duracao: $duracao, custo: $custo, dificuldade: $dificuldade, categoria: $categoria, favorito: $favorito, imagem: $imagem)';
  }

  Brincadeiras copyWith({
    int? id,
    String? titulo,
    String? descricao,
    String? faixaEtaria,
    List<String>? materiais,
    String? duracao,
    String? custo,
    String? dificuldade,
    String? categoria,
    bool? favorito,
    String? imagem,
  }) {
    return Brincadeiras(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      faixaEtaria: faixaEtaria ?? this.faixaEtaria,
      materiais: materiais ?? this.materiais,
      duracao: duracao ?? this.duracao,
      custo: custo ?? this.custo,
      dificuldade: dificuldade ?? this.dificuldade,
      categoria: categoria ?? this.categoria,
      favorito: favorito ?? this.favorito,
      imagem: imagem ?? this.imagem,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'faixaEtaria': faixaEtaria,
      'materiais': materiais,
      'duracao': duracao,
      'custo': custo,
      'dificuldade': dificuldade,
      'categoria': categoria,
      'favorito': favorito,
      'imagem': imagem,
    };
  }

  String toJson() => json.encode(toMap());
}

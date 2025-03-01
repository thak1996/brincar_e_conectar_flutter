// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Brincadeiras {
  Brincadeiras({
    required this.categoria,
    required this.custo,
    required this.descricao,
    required this.dificuldade,
    required this.duracao,
    required this.faixaEtaria,
    required this.favorito,
    required this.id,
    required this.imagem,
    required this.materiais,
    required this.titulo,
  });

  factory Brincadeiras.fromJson(String source) =>
      Brincadeiras.fromMap(json.decode(source) as Map<String, dynamic>);

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

    return other.categoria == categoria &&
        other.custo == custo &&
        other.descricao == descricao &&
        other.dificuldade == dificuldade &&
        other.duracao == duracao &&
        other.faixaEtaria == faixaEtaria &&
        other.favorito == favorito &&
        other.id == id &&
        other.imagem == imagem &&
        listEquals(other.materiais, materiais) &&
        other.titulo == titulo;
  }

  @override
  int get hashCode {
    return categoria.hashCode ^
        custo.hashCode ^
        descricao.hashCode ^
        dificuldade.hashCode ^
        duracao.hashCode ^
        faixaEtaria.hashCode ^
        favorito.hashCode ^
        id.hashCode ^
        imagem.hashCode ^
        materiais.hashCode ^
        titulo.hashCode;
  }

  @override
  String toString() {
    return 'Brincadeiras(categoria: $categoria, custo: $custo, descricao: $descricao, dificuldade: $dificuldade, duracao: $duracao, faixaEtaria: $faixaEtaria, favorito: $favorito, id: $id, imagem: $imagem, materiais: $materiais, titulo: $titulo)';
  }

  Brincadeiras copyWith({
    String? categoria,
    String? custo,
    String? descricao,
    String? dificuldade,
    String? duracao,
    String? faixaEtaria,
    bool? favorito,
    int? id,
    String? imagem,
    List<String>? materiais,
    String? titulo,
  }) {
    return Brincadeiras(
      categoria: categoria ?? this.categoria,
      custo: custo ?? this.custo,
      descricao: descricao ?? this.descricao,
      dificuldade: dificuldade ?? this.dificuldade,
      duracao: duracao ?? this.duracao,
      faixaEtaria: faixaEtaria ?? this.faixaEtaria,
      favorito: favorito ?? this.favorito,
      id: id ?? this.id,
      imagem: imagem ?? this.imagem,
      materiais: materiais ?? this.materiais,
      titulo: titulo ?? this.titulo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoria': categoria,
      'custo': custo,
      'descricao': descricao,
      'dificuldade': dificuldade,
      'duracao': duracao,
      'faixaEtaria': faixaEtaria,
      'favorito': favorito,
      'id': id,
      'imagem': imagem,
      'materiais': materiais,
      'titulo': titulo,
    };
  }

  String toJson() => json.encode(toMap());

  factory Brincadeiras.fromMap(Map<String, dynamic> map) {
    return Brincadeiras(
      titulo: map['titulo'] as String,
      categoria: map['categoria'] as String,
      custo: map['custo'] as String,
      descricao: map['descricao'] as String,
      dificuldade: map['dificuldade'] as String,
      duracao: map['duracao'] as String,
      faixaEtaria: map['faixaEtaria'] as String,
      favorito: map['favorito'] as bool,
      id: map['id'] as int,
      imagem: map['imagem'] as String,
      materiais: List<String>.from((map['materiais'] as List<dynamic>)),
    );
  }
}

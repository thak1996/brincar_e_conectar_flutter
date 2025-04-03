import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../core/utils/enum.utils.dart';

class Brincadeiras {
  Brincadeiras({
    required this.categoria,
    required this.custo,
    required this.descricao,
    required this.dificuldade,
    required this.duracao,
    required this.faixaEtaria,
    this.favorito,
    this.id,
    this.imagem,
    required this.materiais,
    required this.titulo,
    this.createdAt,
    this.updatedAt,
  });

  factory Brincadeiras.fromJson(String source) =>
      Brincadeiras.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Brincadeiras.fromMap(Map<String, dynamic> map) {
    return Brincadeiras(
      titulo: map['titulo'] as String,
      categoria: CategoriaExtension.fromString(map['categoria'] as String)!,
      custo: map['custo'] as String,
      descricao: map['descricao'] as String,
      dificuldade:
          DificuldadeExtension.fromString(map['dificuldade'] as String)!,
      duracao: map['duracao'] as String,
      faixaEtaria:
          FaixaEtariaExtension.fromString(map['faixa_etaria'] as String)!,
      favorito: map['favorito'] as bool?,
      id: map['id'] as int?,
      imagem: map['imagem'] as String?,
      materiais: List<String>.from(map['materiais'] as List),
      createdAt: map['created_at'] as String?,
      updatedAt: map['updated_at'] as String?,
    );
  }

  final Categoria categoria;
  final String custo;
  final String descricao;
  final Dificuldade dificuldade;
  final String duracao;
  final FaixaEtaria faixaEtaria;
  final bool? favorito;
  final int? id;
  final String? imagem;
  final List<String> materiais;
  final String titulo;
  final String? createdAt;
  final String? updatedAt;

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
        other.titulo == titulo &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
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
        titulo.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  @override
  String toString() {
    return 'Brincadeiras(categoria: $categoria, custo: $custo, descricao: $descricao, dificuldade: $dificuldade, duracao: $duracao, faixaEtaria: $faixaEtaria, favorito: $favorito, id: $id, imagem: $imagem, materiais: $materiais, titulo: $titulo, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

Brincadeiras copyWith({
  Categoria? categoria,
  String? custo,
  String? descricao,
  Dificuldade? dificuldade,
  String? duracao,
  FaixaEtaria? faixaEtaria,
  bool? favorito,
  int? id,
  String? imagem,
  List<String>? materiais,
  String? titulo,
  String? createdAt,
  String? updatedAt,
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
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoria': categoria.name,
      'custo': custo,
      'descricao': descricao,
      'dificuldade': dificuldade.name,
      'duracao': duracao,
      'faixa_etaria': faixaEtaria.name,
      'favorito': favorito,
      'id': id,
      'imagem': imagem,
      'materiais': materiais,
      'titulo': titulo,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  String toJson() => json.encode(toMap());
}

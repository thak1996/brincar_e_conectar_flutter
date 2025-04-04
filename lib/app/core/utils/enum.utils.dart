import 'dart:developer';

enum Categoria {
  jogosCognitivos,
  atividadeFisica,
  artes,
  atividadeSocial,
  jogosDeTabuleiro,
  jogosDeCartas,
  desafios,
  atividadesDigitais,
  jogosInterativos,
  desafiosDigitais,
}

enum FaixaEtaria { crianca, adolescente, idosos }

enum Dificuldade { facil, medio, dificil }

enum Custo { baixo, medio, alto }

enum Duracao { curto, medio, longo }

extension DuracaoExtension on Duracao {
  static Duracao? fromString(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'menos de 30 minutos':
        return Duracao.curto;
      case '30 a 60 minutos':
        return Duracao.medio;
      case 'mais de 60 minutos':
        return Duracao.longo;
      default:
        log('Duração não encontrada: $value');
        return null;
    }
  }

  String get formatted {
    switch (this) {
      case Duracao.curto:
        return "Menos de 30 Minutos";
      case Duracao.medio:
        return "30 a 60 Minutos";
      case Duracao.longo:
        return "Mais de 60 Minutos";
    }
  }

  String toStringValue() {
    switch (this) {
      case Duracao.curto:
        return 'menos de 30 minutos';
      case Duracao.medio:
        return '30 a 60 minutos';
      case Duracao.longo:
        return 'mais de 60 minutos';
    }
  }
}

extension CustoExtension on Custo {
  static Custo? fromString(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'baixo':
        return Custo.baixo;
      case 'médio':
        return Custo.medio;
      case 'alto':
        return Custo.alto;
      default:
        log('Custo não encontrado: $value');
        return null;
    }
  }

  String get formatted {
    switch (this) {
      case Custo.baixo:
        return "Baixo";
      case Custo.medio:
        return "Médio";
      case Custo.alto:
        return "Alto";
    }
  }

  String toStringValue() {
    switch (this) {
      case Custo.baixo:
        return 'baixo';
      case Custo.medio:
        return 'médio';
      case Custo.alto:
        return 'alto';
    }
  }
}

extension CategoriaExtension on Categoria {
  static Categoria? fromString(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'atividades físicas':
        return Categoria.atividadeFisica;
      case 'artes':
        return Categoria.artes;
      case 'atividades sociais':
        return Categoria.atividadeSocial;
      case 'jogos de tabuleiro':
        return Categoria.jogosDeTabuleiro;
      case 'jogos de cartas':
        return Categoria.jogosDeCartas;
      case 'jogos cognitivos':
        return Categoria.jogosCognitivos;
      case 'desafios':
        return Categoria.desafios;
      case 'atividades digitais':
        return Categoria.atividadesDigitais;
      case 'jogos interativos':
        return Categoria.jogosInterativos;
      case 'desafios digitais':
        return Categoria.desafiosDigitais;
      default:
        log('Categoria não encontrada: $value');
        return null;
    }
  }

  String get formatted {
    switch (this) {
      case Categoria.jogosCognitivos:
        return "Jogos Cognitivos";
      case Categoria.atividadeFisica:
        return "Atividades Física";
      case Categoria.artes:
        return "Artes";
      case Categoria.atividadeSocial:
        return "Atividades Sociais";
      case Categoria.jogosDeTabuleiro:
        return "Jogos de Tabuleiro";
      case Categoria.jogosDeCartas:
        return "Jogos de Cartas";
      case Categoria.desafios:
        return "Desafios";
      case Categoria.atividadesDigitais:
        return "Atividades Digitais";
      case Categoria.jogosInterativos:
        return "Jogos Interativos";
      case Categoria.desafiosDigitais:
        return "Desafios Digitais";
    }
  }

  String toStringValue() {
    switch (this) {
      case Categoria.atividadeFisica:
        return 'atividades físicas';
      case Categoria.artes:
        return 'artes';
      case Categoria.atividadeSocial:
        return 'atividades sociais';
      case Categoria.jogosDeTabuleiro:
        return 'jogos de tabuleiro';
      case Categoria.jogosDeCartas:
        return 'jogos de cartas';
      case Categoria.jogosCognitivos:
        return 'jogos cognitivos';
      case Categoria.desafios:
        return 'desafios';
      case Categoria.atividadesDigitais:
        return 'atividades digitais';
      case Categoria.jogosInterativos:
        return 'jogos interativos';
      case Categoria.desafiosDigitais:
        return 'desafios digitais';
    }
  }
}

extension FaixaEtariaExtension on FaixaEtaria {
  static FaixaEtaria? fromString(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'adolescentes':
        return FaixaEtaria.adolescente;
      case 'idosos':
        return FaixaEtaria.idosos;
      case 'crianças':
        return FaixaEtaria.crianca;
      default:
        log('Faixa etária não encontrada: $value');
        return null;
    }
  }

  String get formatted {
    switch (this) {
      case FaixaEtaria.crianca:
        return "Crianças";
      case FaixaEtaria.adolescente:
        return "Adolescente";
      case FaixaEtaria.idosos:
        return "Idosos";
    }
  }

  String toStringValue() {
    switch (this) {
      case FaixaEtaria.crianca:
        return 'crianças';
      case FaixaEtaria.adolescente:
        return 'adolescentes';
      case FaixaEtaria.idosos:
        return 'idosos';
    }
  }
}

extension DificuldadeExtension on Dificuldade {
  static Dificuldade? fromString(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'médio':
        return Dificuldade.medio;
      case 'difícil':
        return Dificuldade.dificil;
      case 'fácil':
        return Dificuldade.facil;
      default:
        log('Dificuldade não encontrada: $value');
        return null;
    }
  }

  String get formatted {
    switch (this) {
      case Dificuldade.facil:
        return "Fácil";
      case Dificuldade.medio:
        return "Médio";
      case Dificuldade.dificil:
        return "Difícil";
    }
  }

  String toStringValue() {
    switch (this) {
      case Dificuldade.facil:
        return 'fácil';
      case Dificuldade.medio:
        return 'médio';
      case Dificuldade.dificil:
        return 'difícil';
    }
  }
}

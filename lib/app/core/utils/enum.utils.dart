enum Categoria {
  jogosCognitivos,
  atividadeFisica,
  artes,
  atividadeSocial,
  jogosDeTabuleiro,
  jogosDeCartas,
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
      default:
        return Duracao.longo;
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
      default:
        return Custo.alto;
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
}

extension CategoriaExtension on Categoria {
  static Categoria? fromString(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'atividade fisica':
        return Categoria.atividadeFisica;
      case 'artes':
        return Categoria.artes;
      case 'atividade social':
        return Categoria.atividadeSocial;
      case 'jogos de tabuleiro':
        return Categoria.jogosDeTabuleiro;
      case 'jogos de cartas':
        return Categoria.jogosDeCartas;
      case 'jogos cognitivos':
      default:
        return Categoria.jogosCognitivos;
    }
  }

  String get formatted {
    switch (this) {
      case Categoria.jogosCognitivos:
        return "Jogos Cognitivos";
      case Categoria.atividadeFisica:
        return "Atividade Física";
      case Categoria.artes:
        return "Artes";
      case Categoria.atividadeSocial:
        return "Atividade Social";
      case Categoria.jogosDeTabuleiro:
        return "Jogos de Tabuleiro";
      case Categoria.jogosDeCartas:
        return "Jogos de Cartas";
    }
  }
}

extension FaixaEtariaExtension on FaixaEtaria {
  static FaixaEtaria? fromString(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'adolescente':
        return FaixaEtaria.adolescente;
      case 'idosos':
        return FaixaEtaria.idosos;
      case 'criança':
      default:
        return FaixaEtaria.crianca;
    }
  }

  String get formatted {
    switch (this) {
      case FaixaEtaria.crianca:
        return "Criança";
      case FaixaEtaria.adolescente:
        return "Adolescente";
      case FaixaEtaria.idosos:
        return "Idosos";
    }
  }
}

extension DificuldadeExtension on Dificuldade {
  static Dificuldade? fromString(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'médio':
        return Dificuldade.medio;
      case 'dificil':
        return Dificuldade.dificil;
      case 'facil':
      default:
        return Dificuldade.facil;
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
}

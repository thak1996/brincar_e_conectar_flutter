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
}

extension DificuldadeExtension on Dificuldade {
  static Dificuldade? fromString(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'medio':
        return Dificuldade.medio;
      case 'dificil':
        return Dificuldade.dificil;
      case 'facil':
      default:
        return Dificuldade.facil;
    }
  }
}

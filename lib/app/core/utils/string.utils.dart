String formatUpperCase(String texto) {
  final palavras = texto.split(' ');
  for (int i = 0; i < palavras.length; i++) {
    if (i == 0 || i == 1) {
      palavras[i] =
          palavras[i][0].toUpperCase() + palavras[i].substring(1).toLowerCase();
    } else {
      palavras[i] = palavras[i].toLowerCase();
    }
  }
  return palavras.join(' ');
}

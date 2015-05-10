/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \
/____/___/___/ /____/\___/_/____/

Aula de 24/04/2015:
Desenha sucessivamente circulos de uma entre cinco cores aleatórias (bom exemplo, com um array). Comparem com o LSI11.
Por Eduardo Morais / FBAUP - www.eduardomorais.pt/fbaup/
*/

/*
Declarações de variáveis:
*/
int px = 1; // posição do 'cursor'
int py = 1;
color[] cor; // declaramos um array (uma 'lista') de variaveis tipo color.

/*
Função setup():
Executada automaticamente no início do programa:
*/
void setup() {
  size(640, 480);
  background(255);
  noStroke();
  ellipseMode(CORNER);

  // temos que dizer quantos elementos terá o array antes de o preenchermos.
  // escreve-se assim:
  cor = new color[5];

  // vamos dar cor aos cinco elementos do nosso array
  // usamos uma paleta retirada do site ColourLovers
  cor[0] = color(#C5E0DC);
  cor[1] = color(#774F38);
  cor[2] = color(#E08E79);
  cor[3] = color(#F1D4AF);
  cor[4] = color(#ECE5CE);
  // MUITO IMPORTANTE!
  // os computadores contam do zero. cinco elementos = elementos de 0 a 4.
}


/*
Função draw():
Executada repetidamente a cada 'frame'/fotograma de animação.
*/
void draw() {
  // numero inteiro à sorte entre 0 e 4:
  int s = floor(random(0, 5));
  // a função floor arredonda sempre para baixo (ex. 4.9999 passa a 4)

  // basta-nos dizer que queremos que o enchimento seja com o elemento s do array cor.
  // já não precisamos de 5, 10, 50, 200 IFs!
  fill(cor[s]);

  // desenha o circulo:
  ellipse(px, py, 30, 30);

  // avança o 'cursor' 32 pixels para a direita:
  px = px + 32;
  // mas se chegou ao fim da 'linha', avança 32 pixels para baixo e volta para a esquerda:
  if (px > width) {
    px = 1;
    py = py + 32;
  }

  // limpa a imagem se o 'cursor' chegou ao fundo do ecrã:
  if (py > height) {
    py = 1;
    background(255);
  }

} // fim da função draw()


/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \
/____/___/___/ /____/\___/_/____/

Aula de 24/04/2015:
A cada fotograma preenche o ecrã com imagens escolhidas aleatoriamente (Homenagem a George Nees).
Comparem com o LSI12, em que apenas um círculo por fotograma é desenhado.
Por Eduardo Morais / FBAUP - www.eduardomorais.pt/fbaup/
*/

/*
Declarações de variáveis:
*/

int px = 0; // posição do 'cursor'
int py = 0;

PImage[] imagens; // declaramos um array (uma 'lista') de variaveis tipo PImage (imagem).

/*
Função setup():
Executada automaticamente no início do programa:
*/
void setup() {
  size(640, 480);
  background(255);
  frameRate(12);

  // temos que dizer quantos elementos terá o array antes de o preenchermos.
  // escreve-se assim:
  imagens = new PImage[8];

  // vamos percorrer todos os elementos do array (de 0 a 7) e carregar a imagem correspondente.
  // como as imagens estão numeradas 1 a 8 temos que colocar (i+1) no nome do ficheiro.
  for (int i = 0; i < imagens.length; i++) {
    // imagens gravadas na pasta 'data':
    // imagens[i] = loadImage("nees"+ (i+1) +".png");
    
    // imagens carregadas a partir de um URL:
    imagens[i] = loadImage("https://dl.dropboxusercontent.com/u/3866814/LSI/Nees/nees"+ (i+1) +".png");
    
  }
  // MUITO IMPORTANTE!
  // os computadores contam do zero. oito elementos = elementos de 0 a 7.
}

/*
Função draw():
Executada repetidamente a cada 'frame'/fotograma de animação.
*/
void draw() {
  // limpamos o ecrã em cada fotograma para as imagens não se sobreporem:
  background(255);
  
  // enquanto o 'cursor' não estiver no fundo do ecrã:
  while (py < height) {
    // numero inteiro à sorte entre 0 e o numero de elementos do array (no caso 8) -
    // a propriedade .length evita que tenhamos que mudar este número se mudarmos o número de imagens:
    int s = floor(random(0, imagens.length));
    // a função floor arredonda sempre para baixo (ex. 4.9999 passa a 4)
    
    // verificamos se a imagem carregou:
    if (imagens[s] != null) {
      // posicionamos a imagem s nas coordenadas px,py:  
      image(imagens[s], px, py);
    } 
    
    // avançamos para a posição seguinte no eixo horizontal:
    px = px + 32;
    
    // se chegámos ao fim da 'linha', voltamos à esquerda e vamos para a 'linha' de baixo: 
    if (px > width) {
      px = 0;
      py = py + 32; 
    }    
  } // fim do ciclo while
  
  // deixamos o 'cursor' no cimo do ecrã para o fotograma seguinte:
  py = 0;  
}


/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \ 
/____/___/___/ /____/\___/_/____/ 
                                  
Aula de 24/04/2015: 
Desenha sucessivamente circulos de uma entre cinco cores aleatórias (mau exemplo).
Por Eduardo Morais / FBAUP - www.eduardomorais.pt/fbaup/
*/

/*
Declarações de variáveis: 
*/
int px = 1; // posição do 'cursor'
int py = 1;
color cor1, cor2, cor3, cor4, cor5; // cinco cores, cinco variáveis

/*
Função setup():
Executada automaticamente no início do programa:
*/
void setup() {
  size(640, 480);
  background(255);
  noStroke(); 
  ellipseMode(CORNER);
    
  // vamos dar cor às nossas cinco variáveis
  // usamos uma paleta retirada do site ColourLovers
  cor1 = color(#774F38);
  cor2 = color(#E08E79);
  cor3 = color(#F1D4AF);
  cor4 = color(#ECE5CE);
  cor5 = color(#C5E0DC); 
}


/*
Função draw():
Executada repetidamente a cada 'frame'/fotograma de animação.
*/
void draw() {
  int s = round(random(1, 5)); // numero à sorte entre 1 e 5
  
  // uma série de condições para escolher o enchimento de acordo com o número à sorte:
  if (s == 1) {
    fill(cor1); 
  }
  if (s == 2) {
    fill(cor2); 
  }
  if (s == 3) {
    fill(cor3); 
  }
  if (s == 4) {
    fill(cor4); 
  }
  if (s == 5) {
    fill(cor5); 
  }
  // MAS E SE TIVESSEMOS 200 CORES? TERÍAMOS DUZENTOS IFs???
    
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


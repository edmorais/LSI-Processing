/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \ 
/____/___/___/ /____/\___/_/____/ 
                                  
Aula de 20/03/2015: 
Anima o desenho de quadrados sucessivos, desde o exterior até ao centro da janela.
Por Eduardo Morais / FBAUP - www.eduardomorais.pt/fbaup/
*/


/* Definimos duas variáveis (isto é, 'memórias') de tipo int (número inteiro).
   Estando definidas 'fora' de uma função (setup, draw, etc), são variáveis 'globais',
   acessíveis a partir de 'dentro' de todas as funções.
*/
int verde = 80; // intensidade inicial de verde.
int largura = 600; // largura inicial do quadrado.


/*
Função setup():
Executada automaticamente no início do programa:
*/
void setup() {
  size(650, 650); // tamanho da janela (largura, altura).
  background(0,20,0); // enchemos a janela com esta cor (em r, g, b; de 0 a 255).
  
  // frameRate(12); // se quisermos definir a velocidade da animação.
  // (costumamos comentar comandos que podemos querer usar sem querer apagar.)
  
  rectMode(CENTER); // desenhar rectângulos a partir do seu centro em vez do canto sup. esq..
  strokeWeight(2); // largura do 'stroke' / traço.
  // fill(0); // enchimento a negro?
  noFill(); // sem enchimento.
}


/*
Função draw():
Executada repetidamente a cada 'frame'/fotograma de animação.
Estas funções são do tipo void (vazio) porque não 'escrevem' nenhum resultado numa variável.
*/
void draw() {
  
  if (largura > 0) {
  // se a largura (que usamos para o rectângulo) for maior que zero:
    
    // cor do traço (em r, g, b) com verde variável:
    stroke(0, verde, 0);  
    
    // desenhamos um rectângulo com origem nas coordenadas width/2 e height/2,
    // ou seja, no centro da janela (o Processing 'dá-nos' as variáveis automáticas 'width' e height').
    // a largura é igual à altura, porque queremos um quadrado:
    rect(width/2,height/2, largura,largura);
    
    // e se eu quiser centrar os rectângulos na posição do rato?
    // o Processing dá-nos 'mouseX' e 'mouseY', actualizados cada vez que se repete o draw():
    
    // rect(mouseX, mouseY, largura,largura);
    
    verde = verde + 3; // aumentamos o valor de 'verde'.
    largura = largura - 10; // diminuimos o valor de 'largura'.
  
  } else {
  // senão... (largura já é igual ou menor que zero):
    
    background(0); // 'limpamos' a janela com um fundo negro (um só parâmetro = intensidade de cinza)
    
    // e voltamos a repor os valores iniciais das variáveis 'verde' e 'largura':
    verde = 80;
    largura = 600;
  
  } // fim do if/else. 
  
} // fim da função draw().

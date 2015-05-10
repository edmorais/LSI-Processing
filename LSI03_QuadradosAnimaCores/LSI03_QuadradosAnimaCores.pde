/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \ 
/____/___/___/ /____/\___/_/____/ 
                                  
Aula de 20/03/2015: 
Anima o desenho de quadrados sucessivos, desde o centro até ao exterior da janela.
Vamos usar cores à sorte. Comparem com o exemplo anterior (LSI02).
Por Eduardo Morais / FBAUP - www.eduardomorais.pt/fbaup/
*/


/* Declaramos duas variáveis (isto é, 'memórias') de tipo int (número inteiro).
   Estando definidas 'fora' de uma função (setup, draw, etc), são variáveis 'globais',
   acessíveis a partir de 'dentro' de todas as funções.
*/
int transp; // transparência do traço.
int largura; // largura inicial do quadrado.
// Também precisamos de uma variável do tipo color (cor), mas apenas iremos declará-la:
color cor;


/*
Função setup():
Executada automaticamente no início do programa:
*/
void setup() {
  size(650, 650); // tamanho da janela (largura, altura).
  background(0,20,0); // enchemos a janela com esta cor (em r, g, b; de 0 a 255).
  frameRate(20); // se quisermos definir a velocidade da animação.
  
  rectMode(CENTER); // desenhar rectângulos a partir do seu centro em vez do canto sup. esq..
  strokeWeight(2); // largura do 'stroke' / traço.
  // fill(0); // enchimento a negro?
  noFill(); // sem enchimento.
  
  // vamos atribuir valor às nossas variáveis globais apenas aqui,
  // de modo a que isso aconteça sempre que 'chamarmos' pelo setup():
  transp = 80; // transparência do traço.
  largura = 0; // largura inicial do quadrado - vamos aumentá-la.
  // vamos atribuir à nossa variável global uma cor r,g,b à sorte:  
  cor = color(random(50,255),random(50,255),random(50,255));
  // vamos deixar um mínimo de 50 para impedir uma cor muito escura.  
}


/*
Função draw():
Executada repetidamente a cada 'frame'/fotograma de animação.
Estas funções são do tipo void (vazio) porque não 'escrevem' nenhum resultado numa variável.
*/
void draw() {
  if (largura < width) {
  // se a largura (que usamos para o rectângulo) for menor que a da janela:
    
    // cor do traço (em r, g, b, alpha) com transparência variável:
    stroke(cor, transp); // a variável cor 'ocupa-se' da porção r,g,b!
    
    // desenhamos um rectângulo com origem nas coordenadas width/2 e height/2,
    // ou seja, no centro da janela (o Processing 'dá-nos' as variáveis automáticas 'width' e height').
    // a largura é igual à altura, porque queremos um quadrado:
    rect(width/2,height/2, largura,largura);

    
    transp = transp + 3; // aumentamos o valor de 'transp'.
    largura = largura + 10; // aumentamos o valor de 'largura'.
  
  } else {
  // senão... (largura já é igual ou maior que a janela):
    
    setup(); // o quê?
    /*
    De facto, uma função é um comando.
    No final do desenho, podemos executar de novo o setup(), 
    o que faz com que as variáveis voltem aos valores iniciais, e sorteemos uma nova cor.
    */
  
  } // fim do if/else. 
  
} // fim da função draw().

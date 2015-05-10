/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \ 
/____/___/___/ /____/\___/_/____/ 
                                  
Aula de 27/03/2015: 
Polígono crescente - Animação com cores diversas.
Por Eduardo Morais / FBAUP - www.eduardomorais.pt/fbaup/
*/

/*
Declarações de variáveis: 
*/
int raio = 5; // raio inicial do polígono.

/*
Função setup():
Executada automaticamente no início do programa:
*/
void setup() {
  // já não é preciso explicar estas funções:
  size(700, 700);
  frameRate(12);
  background(255);
  strokeWeight(2);
  noFill(); // senão o enchimento branco tapa os polígonos desenhados anteriormente
}


/*
Função draw():
Executada repetidamente a cada 'frame'/fotograma de animação.
*/
void draw() {
  // vamos usar uma cor do traço (r, g, b) aleatória. 
  // limitamos os parâmetros para conseguirmos uma 'paleta' de cores mais coerente: 
  stroke(random(0,255), random(0,160), 0);
  
  // vamos desenhar um octogono com uma função que encontrámos online
  // temos naturalmente que a incluir no programa, mais abaixo.
  // (ATENÇÃO! não podemos ter funções dentro de funções.)
  polygon(width/2, height/2, raio, 8);
  
  // raio = raio + 6; // aumentamos o raio para a próxima vez.
  // também podemos escrever:
  raio += 6;
  
  if (raio > width/2 - 20) {
    // quando o raio chegar perto de metade (ex. - 20) da largura do ecrã, limpar e recomeçar: 
    raio = 5;
    background(255);
  }  
  
} // fim da função draw()


/*
Função que desenha polígonos, copy-paste da encontrada em
https://processing.org/examples/regularpolygon.html
Podemos ler os argumentos que a função necessita, da esquerda para a direita:
Coordenadas x, y e raio (de tipo float), e o número de pontos do polígono (int).

Precisamos que as coordenadas sejam do tipo float:
Imaginem que a janela tem 601 de lado e eu coloco width/2 na posição x!
Embora não existam verdadeiramente meios pixels, o Processing garante-nos o arredondamento...

Reparem também que tanto os argumentos como as variáveis declaradas dentro da função são 
independentes das das outras funções. Para todos os efeitos, é como se esta função fosse
um programa à parte, que 'corremos' quando necessário.
*/
void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

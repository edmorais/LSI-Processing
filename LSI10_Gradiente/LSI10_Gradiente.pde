/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \ 
/____/___/___/ /____/\___/_/____/ 
                                  
Aula de 10/04/2015: 
Gradiente entre duas cores aleatórias.
Por Eduardo Morais / FBAUP - www.eduardomorais.pt/fbaup/
*/

/*
Declarações de variáveis: 
*/
int x;
color gradiente;

/*
Função setup():
Executada automaticamente no início do programa:
*/
void setup() {
  // já não é preciso explicar estas funções:
  size(720, 360);
  frameRate(60);
  
  // vamos sortear as cores do gradiente e do fundo:
  background(random(0, 255), random(0,80), random(0,255));
  gradiente = color(random(0, 255), random(0,255), random(0,80));
  
  x = 0; // definimos o valor de x aqui - assim podemos chamar o setup() mais tarde :)
 
  strokeWeight(1);
}


/*
Função draw():
Executada repetidamente a cada 'frame'/fotograma de animação.
*/
void draw() {
  // vamos desenhar linhas verticais da cor do gradiente e com opacidade variável!
  
  // a função map faz uma 'regra de três simples', devolvendo um float -
  // https://www.processing.org/reference/map_.html
  // fazemos corresponder o valor actual de x, que variará entre 0 e a largura do ecrã,
  // a uma opacidade que pode variar entre 255 e 0. 
  float opacidade = map(x, 0, width, 255, 0);
  
  stroke(gradiente, opacidade);
  
  line(x, 0, x, height); // desenhamos uma linha vertical na posição x.
  
  x++; // incrementamos o x.
  
  // se o x chegar ao final, repetimos tudo:
  if (x >= width) {
    setup(); 
  }
  
} // fim da função draw()


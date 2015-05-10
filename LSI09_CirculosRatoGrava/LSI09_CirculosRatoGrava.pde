/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \ 
/____/___/___/ /____/\___/_/____/ 
                                  
Aula de 27/03/2015: 
Circulos centrados no rato. Gravamos uma imagem e limpamos o ecrã ao clicar.
Por Eduardo Morais / FBAUP - www.eduardomorais.pt/fbaup/
*/

/*
Declarações de variáveis: 
*/
int diametro = 5; // diametro
int velocidade = 10; // velocidade de variação do diametro
int contador = 1; // contador de ficheiros

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
  ellipseMode(CENTER); // assumir que as coordenadas apontam o centro das elipses
  noFill(); // senão o enchimento branco tapa o círculos nos desenhados anteriormente
}


/*
Função draw():
Executada repetidamente a cada 'frame'/fotograma de animação.
*/
void draw() {
  // vamos usar uma cor do traço (r, g, b) aleatória. 
  // limitamos os parâmetros para conseguirmos uma 'paleta' de cores mais coerente: 
  stroke(random(0,255), random(0,160), 0);
  
  // só vamos desenhar círculos se o rato estiver 20 pixels dentro da janela
  // os '&&' significam E/AND, ou seja todas as condições têm que ser verdadeiras: 
  if (mouseX > 20 && mouseX < width-20 && mouseY > 20 && mouseY < height-20) {
    
    // desenhamos a elipse na posição do rato.
    // como a largura e a altura são iguais, teremos um círculo:
    ellipse(mouseX, mouseY, diametro, diametro);
    
    // mudamos o diâmetro conforme a variável velocidade.
    // pode aumentar ou diminuir...
    diametro = diametro + velocidade;
    
    // vamos inverter a velocidade se o diametro for muito grande ou muito pequeno.
    // os '||' significam OU/OR, ou seja, basta que uma das condições seja verdadeira:
    if (diametro > 100 || diametro < 5) {
      // invertemos a velocidade!
      velocidade = 0 - velocidade;
    }
    
  } // fim do if
  
} // fim da função draw()


/*
Função mouseReleased():
Executada automaticamente quando largamos o botão do rato depois de clicar!
*/
void mouseReleased() {
  // vamos gravar uma imagem png!
  save("circulos" + contador +".png"); // nunca esquecer a extensão!
  contador++; // aumentamos o contador
  
  background(255); // limpamos o ecrã
}

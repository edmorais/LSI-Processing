/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \ 
/____/___/___/ /____/\___/_/____/ 
                                  
Aula de 20/03/2015: 
Desenha quadrados sucessivos, desde o exterior até ao centro da janela.
Por Eduardo Morais / FBAUP - www.eduardomorais.pt/fbaup/
*/

/* 
Podemos escrever comentários desta forma, em que tudo é comentário entre a barra-asterisco e o asterisco-barra. 
*/

// Em alternativa, o uso de barra-barra só comenta até ao final da linha.


/*
Começamos por definir duas variáveis (isto é, 'memórias') de tipo int (número inteiro),
para os atributos que queremos... variar.
*/
int verde; // declaramos a variável para a intensidade inicial de verde...
verde = 80; // ... e atribuimos-lhe o valor.
int largura = 600; // largura inicial do quadrado, declarado e atribuido 'de uma assentada'.


/*
Definimos a janela e algumas opções:
*/
size(650, 650); // tamanho da janela (largura, altura).
background(0,20,0); // enchemos a janela com esta cor (em r, g, b; de 0 a 255).
rectMode(CENTER); // desenhar rectângulos a partir do seu centro em vez do canto sup. esq..
strokeWeight(2); // largura do 'stroke' / traço.
// fill(0); // enchimento a negro?
noFill(); // sem enchimento.

println("Bom dia FBAUP!"); // escrevemos na 'consola', já agora.


/*
Vamos lá desenhar os quadrados:
*/
while (largura > 0) {
// enquanto a largura (que usamos para o rectângulo) for maior que zero:
  
  // cor do traço (em r, g, b) com verde variável:
  stroke(0, verde, 0);  
  
  // desenhamos um rectângulo com origem nas coordenadas width/2 e height/2,
  // ou seja, no centro da janela (o Processing 'dá-nos' as variáveis automáticas 'width' e height').
  // a largura é igual à altura, porque queremos um quadrado:
  rect(width/2,height/2, largura,largura);
      
  verde = verde + 3; // aumentamos o valor de 'verde'.
  largura = largura - 10; // diminuimos o valor de 'largura'.

}


/*
E se quisermos animar isto?
Nesse caso, temos que estruturar o nosso programa recorrendo às funções setup() e draw(),
que transformam o Processing num verdadeiro software de animação...
*/



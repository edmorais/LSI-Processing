/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \
/____/___/___/ /____/\___/_/____/

Aula de 15/05/2015:
Visualizamos o som correspondente à entrada do microfone do computador.
Por Eduardo Morais / FBAUP - www.eduardomorais.pt/fbaup/
*/

/*
Importar bibliotecas!
*/
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*; // via menu Sketch->Import Library->Minim

/*
Declarações de variáveis:
*/

Minim minim; // objecto que corresponde à 'mesa de mistura'
AudioInput in; // objecto correspondente ao input / microfone

/*
Função setup():
Executada automaticamente no início do programa:
*/
void setup() {
  size(512,512);
  background(0);
 
  // ligamos a 'mesa de mistura' ao nosso sketch:
  minim = new Minim(this);
  
  // ligamos o microfone em modo stereo,
  // com memória/buffer de tamanho 1024
  in = minim.getLineIn(minim.STEREO, 1024);
}


/*
Função draw():
Executada repetidamente a cada 'frame'/fotograma de animação.
*/
void draw() {
  
  // vamos preencher a janela com um rectângulo negro semi-transparente
  // para produzir um efeito de 'delay' na imagem:
  noStroke();
  fill(0,20);
  rect(0,0, width, height);
  
  stroke(#FF7700, 100);
  strokeWeight(1);
  // vamos percorrer o 'buffer' do microfone!
  // afinal trata-se de um conjunto de amplitudes que podemos visualizar:
  for (int i = 0; i < in.bufferSize(); i++) {
    // vamos mapear ('regra de três simples') o ponto em que estamos (i)
    // à coordenada y da nossa janela:
    float y = map(i, 0, in.bufferSize(), 0, height);
    
    // vamos desenhar uma linha horizontal nesse ponto.
    // adicionamos e subtraímos a amplitude dos canais desse ponto do buffer 
    // (multiplicado por um numero para melhor se expressar)
    // à coordenada x do centro do ecrã, obtendo assim os pontos 
    // inicial e final da linha:
    line(width/2 - in.left.get(i)*300, y,
         width/2 + in.right.get(i)*300, y);
  }
  
  // vamos multiplicar o nível médio do buffer (entre 0 e 1)
  // pela altura do ecrã, para desenharmos um nível de som
  float y = height - in.mix.level() * height;
  stroke(#0066FF);
  strokeWeight(2);
  // desenhamos uma linha horizontal nesse ponto:
  line(0,y, width, y);
}



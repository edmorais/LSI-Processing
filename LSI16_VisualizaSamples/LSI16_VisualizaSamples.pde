/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \
/____/___/___/ /____/\___/_/____/

Aula de 15/05/2015:
Lê dois samples de som e acciona-os quando premimos as teclas P e T.
Visualizamos o som correspondente.
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
AudioSample pedal;
AudioSample tambor; // objectos correspondentes aos samples

/*
Função setup():
Executada automaticamente no início do programa:
*/
void setup() {
  size(512,512);
  background(0);

  // ligamos a 'mesa de mistura' ao nosso sketch:
  minim = new Minim(this);

  // carregamos os sons (na pasta 'data' dentro da pasta do sketch),
  // com memória/buffer de tamanho 512
  // (tamanhos maiores = maior latência)
  // (tamanhos menores = maior possibilidade de 'quebras' no som)
  pedal = minim.loadSample("BD.mp3", 512);
  tambor = minim.loadSample("SD.wav", 512);
  // ATENÇÃO: vai dar erro se estes ficheiros não existirem!
}

/*
Função keyPressed():
Executada sempre que carregamos numa tecla (e antes de a largar):
*/
void keyPressed() {
  if (key == 'p' || key == 'P') {
    // accionamos o som:
    pedal.trigger();
  }
  if (key == 't' || key == 'T') {
    tambor.trigger();
  }
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

  stroke(#FF9966);
  // vamos percorrer o 'buffer' do primeiro sample.
  // afinal trata-se de um conjunto de amplitudes que podemos visualizar:
  for (int i = 0; i < pedal.bufferSize(); i++) {
    // vamos mapear ('regra de três simples') o ponto em que estamos (i)
    // à coordenada x da nossa janela:
    float x = map(i, 0, pedal.bufferSize(), 0, width);

    // vamos desenhar uma linha vertical nesse ponto.
    // adicionamos e subtraímos a amplitude desse ponto do buffer
    // (multiplicado por um numero para melhor se expressar)
    // à coordenada y do centro do ecrã, obtendo assim os pontos
    // inicial e final da linha:
    line(x, height/2 - pedal.mix.get(i)*50,
         x, height/2 + pedal.mix.get(i)*50);
  }

  // vamos repetir para o outro sample, trocando as coordenadas x por y
  // para desenharmos sobre o eixo vertical:
  stroke(#66CCFF);
  for (int i = 0; i < tambor.bufferSize(); i++) {
    float y = map(i, 0, tambor.bufferSize(), 0, height);
    line(width/2 - tambor.mix.get(i)*100, y,
         width/2 + tambor.mix.get(i)*100, y);
  }
}



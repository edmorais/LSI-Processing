/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \
/____/___/___/ /____/\___/_/____/

Aula de 22/05/2015:
Theremin! Um oscilador cuja frequência e amplitude dependem da posição do rato.
As teclas 1 a 5 permitem escolher a forma de onda, que podemos visualizar.
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
AudioOutput out; // saída de audio (imaginem que é o cabo de saida)
Oscil wave; // oscilador

/*
Função setup():
Executada automaticamente no início do programa:
*/
void setup() {
  size(800,400);
  background(0);

  // 'ligamos' a 'mesa de mistura' ao nosso sketch:
  minim = new Minim(this);

  // iniciamos a saída de audio:
  out = minim.getLineOut();

  // criamos uma nova onda, a 440Hz, com 0.5 de amplitude e forma sinusoidal:
  wave = new Oscil( 440, 0.5f, Waves.SINE );
  // ligamos a onda à saída de áudio:
  wave.patch(out);


}

/*
Função mouseMoved():
Executada sempre que movemos o rato:
*/
void mouseMoved() {
  // vamos acertar a amplitude conforme a posição vertical do rato:
  float amp = map( mouseY, 0, height, 1, 0 );
  wave.setAmplitude(amp);

  // vamos acertar a frequência (entre 55 e 880) conforme a posição horizontal do rato:
  float freq = map( mouseX, 0, width, 55, 880 );
  wave.setFrequency(freq);
}


/*
Função keyPressed():
Executada sempre que carregamos numa tecla (e antes de a largar):
*/
void keyPressed() {
  // as teclas de 1 a 5 mudam a forma de onda:
  if (key == '1') wave.setWaveform(Waves.SINE); // sinusoidal
  if (key == '2') wave.setWaveform(Waves.TRIANGLE); // triangulo
  if (key == '3') wave.setWaveform(Waves.SAW); // 'serra'
  if (key == '4') wave.setWaveform(Waves.SQUARE); // impulso 1:1
  if (key == '5') wave.setWaveform(Waves.QUARTERPULSE); // impulso 1:3
}

/*
Função draw():
Executada repetidamente a cada 'frame'/fotograma de animação.
*/
void draw() {

  // vamos preencher a janela com um rectângulo negro semi-transparente
  // para produzir um efeito de 'delay' na imagem:
  noStroke();

  // vamos fazer a opacidade do fill depender da frequência / mouseX
  fill(0, map(mouseX, 0, width, 10, 255));
  rect(0,0, width, height);

  stroke(#00CC66);
  strokeWeight(2);
  // vamos percorrer o 'buffer' da saída de áudio!
  // afinal trata-se de um conjunto de amplitudes que podemos visualizar:
  // (mas com o cuidado de não irmos até ao final (atenção ao - 1)!
  for (int i = 0; i < out.bufferSize() - 1 ; i++) {
    // vamos mapear ('regra de três simples') o ponto em que estamos (i)
    // à coordenada x da nossa janela:
    float x = map(i, 0, out.bufferSize(), 0, width);

    // vamos desenhar uma linha vertical a unir as amplitudes actual e seguinte:
    // (daí o cuidado para não irmos ao final do buffer)
    line(x, height/2 - out.mix.get(i)*100,
         x, height/2 - out.mix.get(i+1)*100);
  }
}



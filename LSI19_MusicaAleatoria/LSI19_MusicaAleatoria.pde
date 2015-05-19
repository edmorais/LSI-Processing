/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \
/____/___/___/ /____/\___/_/____/

Aula de 22/05/2015:
Gera uma música aleatoriamente!
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

// array de strings correspondentes a uma escala (maior em dó)
// - cada string será interpretado como uma nota musical na notação C(dó) - B(si)
String escala[]   = {"D3", "E3", "Gb3", "G3", "A3", "B3", "Db4", "D4" };

/*
Função setup():
Executada automaticamente no início do programa:
*/
void setup() {
  size(800,400);
  background(255);

  // 'ligamos' a 'mesa de mistura' ao nosso sketch:
  minim = new Minim(this);

  // iniciamos a saída de audio:
  out = minim.getLineOut();

  // programamos o tempo (BPM) e pausamos a música:
  out.setTempo( 120 );
  out.pauseNotes();

  // vamos gerar 32 notas à sorte a partir do array da escala:
  for (int i = 0; i < 32; i ++) {
    int s = floor(random(0, escala.length));

    // o i corresponde ao tempo de entrada de cada nota,
    // vamos incrementando-lo em 1 'batida':
    out.playNote(i, escala[s]);
  }

  // agora podemos ouvir a música:
  out.resumeNotes();
}


/*
Função draw():
Executada repetidamente a cada 'frame'/fotograma de animação.
*/
void draw() {

  // vamos preencher a janela com um rectângulo negro semi-transparente
  // para produzir um efeito de 'delay' na imagem:
  noStroke();
  fill(255, 50);
  rect(0,0, width, height);

  stroke(#FF0000, 128);
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
    line(x, height/2 - out.mix.get(i)*300,
         x, height/2 - out.mix.get(i+1)*300);
  }
}


/*
Função keyReleased():
Executada sempre que carregamos numa tecla, após a largarmos:
*/
void keyPressed() {
  // corre o setup outra vez, gerando nova música:
  if (key == ' ') setup();
}

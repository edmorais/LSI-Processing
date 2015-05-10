/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \
/____/___/___/ /____/\___/_/____/

Aula de 24/04/2015:
Lê imagem da webcam, e percorre todos os pixels modificando-lhes a cor.
Por Eduardo Morais / FBAUP - www.eduardomorais.pt/fbaup/
*/

/*
Importar bibliotecas!
*/
import processing.video.*;  // acrescenta 'pack' de funções relacionadas com vídeo


/*
Declarações de variáveis:
*/

Capture cam; // declaramos um objecto (variável complexa) do tipo Capture (= webcam).

/*
Função setup():
Executada automaticamente no início do programa:
*/
void setup() {
  size(640, 480);
  background(0);
  
  // inicializa a webcam, com a resolução 640x480 
  // compatível com a maioria dos computadores, outras podem ou não funcionar:
  cam = new Capture(this, 640, 480);
  
  // arranca a câmara -
  // como disse acima a variável de tipo Capture é o que denominamos de 'objecto',
  // uma variável complexa que pode conter funções associadas, neste caso .start():
  cam.start();  
}

/*
Função draw():
Executada repetidamente a cada 'frame'/fotograma de animação.
*/
void draw() {
  
  // se a câmara tiver uma imagem disponível 
  // (outra função do objecto Capture, que neste caso devolve um true/false):
  if ( cam.available() ) {
    // 'lemos' a imagem da câmara:
    cam.read();
    
    // colocamos a imagem nas coordenadas 0,120, redimensonando-a para 320x240:
    image(cam, 0, 120, 320, 240);
    
    // uma imagem é um array de pixels - ou seja, de cores!
    // vamos ler os pixels da câmara:
    cam.loadPixels();
    
    // a partir de agora, temos acesso à 'propriedade' (isto é, uma 'subvariável'?) .pixels,
    // que é um array de cores que podemos percorrer assim:
    for (int i = 0; i < cam.pixels.length; i++) {
      // cam.pixels[i] é a cor do pixel actual, que podemos modificar:
      
      // podemos fazer o pixel ficar com o valor de brilho apenas:
      //cam.pixels[i] = color(brightness(cam.pixels[i]));  
      
      // ou neste caso, substituímos os valores RGB pelos valores B,G e R do pixel actual:
      cam.pixels[i] = color(blue(cam.pixels[i]), green(cam.pixels[i]), red(cam.pixels[i]));
    
    } // fim do ciclo FOR
    
    // actualizamos a imagem com os pixels alterados, antes de a voltarmos a posicionar no ecrã:
    cam.updatePixels();
    image(cam, 320, 120, 320, 240);  
  }   
}



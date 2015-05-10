/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \
/____/___/___/ /____/\___/_/____/

Aula de 24/04/2015:
Lê imagem da webcam, e procura o pixel mais brilhante de todos! Agora podemos controlar coisas com a webcam.
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
    
    // colocamos a imagem nas coordenadas 0,0:
    image(cam, 0, 0);
    
    // podemos experimentar aplicar um filtro de 'blur' antes de analisar a imagem
    // para que a análise não 'trema' tanto... mas o programa fica mais lento! 
    // cam.filter(BLUR, 5);
    
    // uma imagem é um array de pixels - ou seja, de cores!
    // vamos ler os pixels da câmara:
    cam.loadPixels();
    
    // vamos definir variáveis que precisamos:
    float recordBrilho = 0; // valor mais brilhante encontrado na imagem
    int recordPos = 0; // numero do pixel mais brilhante
    
    // a partir de agora, temos acesso à 'propriedade' (isto é, uma 'subvariável'?) .pixels,
    // que é um array de cores que podemos percorrer assim:
    for (int i = 0; i < cam.pixels.length; i++) {
      
      // podíamos usar a função brightness, 
      // mas o valor de verde parece funcionar de forma mais suave, com menos ruído: 
      // float brilho = brightness(camara.pixels[i]);
      float brilho = green(cam.pixels[i]);
      
      // se este pixel for mais brilhante, passa a ser o novo record.
      // registamos também a posição/índice em que o encontramos:
      if (brilho > recordBrilho) {
        recordBrilho = brilho;
        recordPos = i;
      } 
    
    } // fim do ciclo FOR

    // precisamos de saber a que coordenadas x,y corresponde a posição do pixel mais brilhante.
    // uma vez que o numero de pixels = cam.width*cam.height,
    // dividindo a posição pela largura ficamos com a coordenada vertical:
    int py = recordPos / cam.width;
    // e o resto dessa divisão (operação módulo / %) dá-nos a coordenada horizontal:
    int px = recordPos % cam.width;
    
    // vamos desenhar um circulo vermelho nessas coordenadas -
    // vejam como podemos usar a webcam para controlar essa posição!
    fill(#FF0000);
    noStroke();
    ellipse(px,py, 32, 32);
  
  }   
}



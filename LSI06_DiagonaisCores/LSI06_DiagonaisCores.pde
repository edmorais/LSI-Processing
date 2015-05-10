/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \ 
/____/___/___/ /____/\___/_/____/ 
                                  
Aula de 27/03/2015: 
Diagonais (tipo 10 PRINT) - Método 2 com cores diversas.
Por Eduardo Morais / FBAUP - www.eduardomorais.pt/fbaup/
*/

/*
Declarações de variáveis: 
*/
int tamanho = 30; // tamanho de cada 'célula'.
int x = 0;
int y = 0; // coordenadas x e y do 'cursor'.

/*
Definimos a janela e algumas opções:
*/
size(20 * tamanho, 20 * tamanho); // tamanho da janela - em número de células.
background(255); // fundo branco.
strokeWeight(8); // largura do traço.

// vamos usar uma cor do traço (r, g, b) aleatória. 
// limitamos os parâmetros para conseguirmos uma 'paleta' de cores mais coerente: 
stroke(random(0,255), random(0,160), 0);


/*
Vamos desenhar diagonais enquanto estivermos 'dentro' da janela.
Comparem com o Método 1: aqui estamos a contar as coordenadas em pixels directamente. 
*/
while (y < height) {

  /* 
  Sorteamos um número: 0 ou 1
  a função random produz um float, que arredondamos para um int.
  (abreviamos aquilo que no programa anterior fazíamos em dois passos)
  */
  int moeda = round(random(0,1));
  // https://www.processing.org/reference/random_.html
  // https://www.processing.org/reference/round_.html
   
  
  if (moeda == 0) {
    // vamos desenhar uma linha 'decrescente' (\) -
    // os pixels de início (x, y) as coordenadas actuais,
    // para as coordenadas de fim, somámos um tamanho às coordenadas de início: 
    line(x, y, x + tamanho, y + tamanho);
    
  } else {
    // para desenhar uma linha 'crescente' (/)
    // bastará trocar as coordenadas x de início (agora mais abaixo) pelas de fim (agora mais acima):
    line(x + tamanho, y, x, y + tamanho);
  }
  
  // no próximo 'ciclo while' queremos aumentar as coordenadas x:
  x = x + tamanho;
  
  // e se a célula seguinte no eixo dos x sair fora da janela?
  if (x > width) {
    x = 0; // voltamos para a posição mais à esquerda...  
    y = y + tamanho; // ... mas descemos no eixo dos y.
    
    // e escolhemos uma nova cor do traço (igual ao início):
    stroke(random(0,255), random(0,160), 0);
  }
 
} // fim do ciclo while


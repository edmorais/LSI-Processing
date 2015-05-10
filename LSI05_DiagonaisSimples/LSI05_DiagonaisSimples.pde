/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \ 
/____/___/___/ /____/\___/_/____/ 
                                  
Aula de 27/03/2015: 
Diagonais (tipo 10 PRINT) - Método 1.
Por Eduardo Morais / FBAUP - www.eduardomorais.pt/fbaup/
*/


/*
Declarações de variáveis: 
*/
int tamanho = 30; // tamanho de cada 'célula'.
int cel_x = 0;
int cel_y = 0; // célula actual, coordenadas x e y.

/*
Definimos a janela e algumas opções:
*/
size(20 * tamanho, 20 * tamanho); // tamanho da janela - em número de células.
background(255); // fundo branco.
stroke(#FF0000); // cor do traço - também podemos colocar como código hexadecimal.
strokeWeight(8); // largura do traço.


/*
Vamos desenhar diagonais enquanto estivermos 'dentro' da janela.
Se a coordenada y da célula * o tamanho for igual ou superior à altura da janela,
tudo o que está dentro do 'ciclo while' é ignorado: 
*/
while (cel_y * tamanho < height) {

  // sorteamos um número ENTRE 0 e 1 -
  // o tipo float significa um número com casas decimais:
  float sorte = random(0,1);
  // isto porque a função random produz um float, não um int (isso daria erro):
  // https://www.processing.org/reference/random_.html

  // vamos então arredondar o número à sorte para o inteiro mais próximo:
  int moeda = round(sorte); // ex. 0 = cara, 1 = coroa :) 
  
  if (moeda == 0) {
    // vamos desenhar uma linha 'decrescente' (\) -
    // os pixels de início (x, y) são a célula em que estamos (_x, _y) * o tamanho das células,
    // para as coordenadas de fim, somámos um tamanho às coordenadas de início: 
    line(cel_x * tamanho,           cel_y * tamanho,
         cel_x * tamanho + tamanho, cel_y * tamanho + tamanho);
    
  } else {
    // para desenhar uma linha 'crescente' (/)
    // bastará trocar as coordenadas x de início (agora mais abaixo) pelas de fim (agora mais acima):
    line(cel_x * tamanho + tamanho, cel_y * tamanho,
         cel_x * tamanho,           cel_y * tamanho + tamanho);
  }
  
  // no próximo 'ciclo while' queremos ir para a célula seguinte (no eixo x):
  cel_x++; // igual a: cel_x = cel_x + 1;
  
  // e se a célula seguinte no eixo dos x sair fora da janela?
  if (cel_x * tamanho > width) {
    cel_x = 0; // voltamos à célula mais à esquerda...  
    cel_y++; // ... mas uma posição abaixo no eixo dos y.
  }
 
} // fim do ciclo while

/*
Haveria outra forma de calcular as coordenadas de cada linha?
Vejam o próximo programa...
*/

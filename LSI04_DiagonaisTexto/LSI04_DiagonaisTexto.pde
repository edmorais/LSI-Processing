/* __   ________  ___  ___ _______
  / /  / __/  _/ |_  |/ _ <  / __/
 / /___\ \_/ /  / __// // / /__ \ 
/____/___/___/ /____/\___/_/____/ 
                                  
Aula de 27/03/2015: 
Diagonais (tipo 10 PRINT), em modo de texto!
Por Eduardo Morais / FBAUP - www.eduardomorais.pt/fbaup/
*/


/*
Declaramos uma variável do tipo String (sequência de caracteres)
para preencher com o nosso 'texto'. Para já vai vazio:
*/
String texto = "";
int numero = 600; // e já agora, quantos caracteres queremos?

/*
Vamos sortear caracteres aquele número de vezes e acrescentar ('concatenar') ao texto:
*/
while (numero > 0) {
// enquanto o numero for maior que zero:

  // sorteamos um número ENTRE 0 e 1 -
  // o tipo float significa um número com casas decimais:
  float sorte = random(0,1);
  // isto porque a função random produz um float, não um int (isso daria erro):
  // https://www.processing.org/reference/random_.html

  // vamos então arredondar o número à sorte para o inteiro mais próximo:
  int moeda = round(sorte); // ex. 0 = cara, 1 = coroa :) 
  
  if (moeda == 0) {
  // se comparamos positivamente (atenção ao igual-igual) a 'face da moeda' com zero:
    
    // acrescentamos uma diagonal 'crescente' ao nosso texto.
    texto = texto + "/";
    
  } else {
  // senão...  
    
    // acrescentamos uma diagonal 'decrescente'...
    texto = texto + "\\";
    // mas atenção! esta diagonal é o célebre 'cararacter de escape'!
    // logo teremos que a colocar duas vezes para que o computador entenda nos referimos a ela mesma.
  
  } // fim do if/else

  // numero = numero - 1;
  // subtraímos 1 ao número, o que também podemos escrever assim:
  numero--;
  
  // vamos acrescentar um 'enter' (para mudarmos de linha) a cada 40 números?
  if (numero % 40 == 0) {
  // a operação % chama-se 'modulo', ou em bom português, 'resto'.
  // ou seja, o que estamos a verificar é se número é divisível por 40 -
  // ou mais exactamente, se dividido por 40 o resto é igual a 0. 
    
    texto = texto + "\n"; // o \n é o código que designa um caracter 'newline'. 
  }
  

} // fim do ciclo while

/*
Está feito, 'bora lá imprimir:
*/
println(texto);




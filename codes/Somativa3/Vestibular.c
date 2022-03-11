#include <stdio.h>
#include <stdlib.h>

int main() {
  
  int qtd;
  char * gabarito;
  char * respostas;

  scanf("%d", &qtd);

  gabarito = malloc(qtd * sizeof( char ));
  respostas = malloc(qtd * sizeof( char ));

  scanf("%s[^\n]", gabarito);
  scanf("%s[^\n]", respostas);

  int corretas = 0;

  for(int i = 0; i < qtd; i++) {
    if(gabarito[i] == respostas[i]) {
      corretas++;
    }
  }

  printf("%d\n", corretas);
  


  free(gabarito);
  free(respostas);
  return 0;
}
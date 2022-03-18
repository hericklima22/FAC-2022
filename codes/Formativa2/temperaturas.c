#include <stdio.h>

int main() {
  char e1, e2;
  char k, f, c;
  k = 'K';
  f = 'F';
  c = 'C';
  float temperatura = 0;

  

  scanf("%c", &e1);
  scanf("%c", &e2);
  scanf("%f", &temperatura);


  // kelvin para celsius
  if (e1 == k && e2 == c) {

  }
  // kelvin para fahrenheit
  if (e1 == k && e2 == f) {

  }

  // celsius para kelvin
  if (e1 == c && e2 == f) {

  }
  // celsius para fahrenheit
  if (e1 == c && e2 == f) {

  }

  // fahrenheit para kelvin
  if (e1 == f && e2 == k) {

  }
  // fahrenheit para celsius
  if (e1 == f && e2 == c) {

  }

  return 0;
}
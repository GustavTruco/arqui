#include <string.h>

void sort(char **noms, int n) {
  char **ult= &noms[n-1];
  char **p= noms;
  while (p<ult) {
    char *s=p[0];
    char *t=p[1];
    while (strcmp(s,' ')!=0 || strcmp(t,' ')!=0){
      if (strcmp(s,' ')!=0){
        s++;
      }
      if (strcmp(t,' ')!=0){
        t++;
      }
    }
    s++;
    t++;

    if (strcmp(s,t)==0){
      if (strcmp(p[0], p[1])<=0)
        p++;
      else {
        char *tmp= p[0];
        p[0]= p[1];
        p[1]= tmp;
        p= noms;
      }
    }
    else if (strcmp(s,t)<0){
      p++;
    }
    else {
      char *tmp= p[0];
      p[0]= p[1];
      p[1]= tmp;
      p= noms;
    }
    
  }
}

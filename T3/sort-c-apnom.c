#include <string.h>

void sort(char **noms, int n) {
  char **ult= &noms[n-1];
  char **p= noms;
  while (p<ult) {
    char *s=p[0];
    char *t=p[1];
    char *c=' ';
    while (strcmp(s,c)!=0 || strcmp(t,c)!=0){
      if (strcmp(s,c)!=0){
        s++;
      }
      if (strcmp(t,c)!=0){
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

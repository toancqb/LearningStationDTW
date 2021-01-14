#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define NUM_THREADS	4

typedef struct s_arg {
    long tid;
    int start;
    int end;
    long int sum;
} t_arg;

 void *BusyWork(void *ab)
 {
    t_arg *a = (t_arg*)ab;
    int i;

    printf("Thread %ld couting...%d - > %d \n",a->tid, a->start, a->end);
    for (i = a->start; i < a->end; i++)
    {
       a->sum += (long int)i;
    }
    printf("Thread done. Result = %ld\n",a->sum);
    pthread_exit((void*) (&(a->sum)));
 }

 int main (int argc, char *argv[])
 {
    pthread_t thread[NUM_THREADS];
    t_arg a[NUM_THREADS];
    pthread_attr_t attr;
    int len = 1000000000/4;
    int rc;
    int ind = 1;
    long t;
    void *status;

    /* Initialize and set thread detached attribute */
    pthread_attr_init(&attr);
    pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);
    printf("[%d] [%d]", ind, len);
    for(t=0; t<NUM_THREADS; t++) {
        a[t].tid = t;
        a[t].start = ind;
        a[t].end = ind + len;
        a[t].sum = 0;
        ind += len;
       printf("Main: creating thread %ld\n", t);
       rc = pthread_create(&thread[t], &attr, BusyWork, (void *)(&a[t]));  
       if (rc) {
          printf("ERROR; return code from pthread_create() is %d\n", rc);
          exit(-1);
          }
       }

    /* Free attribute and wait for the other threads */
    pthread_attr_destroy(&attr);
    long int sum = 0;
    
    for(t=0; t<NUM_THREADS; t++) {
       rc = pthread_join(thread[t], &status);
       long int *s = (long int *)status;
       if (rc) {
          printf("ERROR; return code from pthread_join() is %d\n", rc);
          exit(-1);
          }
          sum += *s;
       printf("Main: completed join with thread %ld having a status of %ld\n",t,*s);
       }
 
 printf("Main: %ld\nprogram completed. Exiting.\n", sum);
 pthread_exit(NULL);
 }
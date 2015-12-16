set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.5231, <2> 3.2682, <3> 39.7612, <4> 12.7273, <5> 18.1254, <6> 39.7256, <7> 37.9851, <8> 22.9765, <9> 34.7204, <10> 46.3623, <11> 2.5842, <12> 14.5354, <13> 43.8327, <14> 0.7811, <15> 23.7279, <16> 25.5949, <17> 15.6849, <18> 5.05, <19> 46.152, <20> 10.7371;
param workload[JOB] := <1> 6.8208, <2> 1.8078, <3> 6.3056, <4> 3.5675, <5> 4.2574, <6> 6.3028, <7> 6.1632, <8> 4.7934, <9> 5.8924, <10> 6.809, <11> 1.6075, <12> 3.8125, <13> 6.6206, <14> 0.8838, <15> 4.8711, <16> 5.0591, <17> 3.9604, <18> 2.2472, <19> 6.7935, <20> 3.2768;
param capacity[MACHINE] := <1> 15.3087, <2> 15.3087, <3> 15.3087, <4> 15.3087, <5> 15.3087, <6> 15.3087;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;

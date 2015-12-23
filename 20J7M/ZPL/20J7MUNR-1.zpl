set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.269, <2> 17.9842, <3> 41.9249, <4> 31.9432, <5> 26.5448, <6> 33.0212, <7> 49.1613, <8> 25.8637, <9> 36.5021, <10> 48.1552, <11> 10.9708, <12> 48.3496, <13> 7.0489, <14> 5.3839, <15> 8.2041, <16> 13.1862, <17> 2.4831, <18> 3.4646, <19> 0.5627, <20> 44.9009;
param workload[JOB] := <1> 32.6512, <2> 42.7869, <3> 20.036, <4> 44.9997, <5> 24.378, <6> 3.724, <7> 26.2803, <8> 31.5719, <9> 30.5058, <10> 25.4421, <11> 11.0503, <12> 2.6612, <13> 46.3354, <14> 47.965, <15> 3.489, <16> 8.418, <17> 9.4884, <18> 23.2459, <19> 23.3994, <20> 47.2615;
param capacity[MACHINE] := <1> 505.69, <2> 505.69, <3> 505.69, <4> 505.69, <5> 505.69, <6> 505.69, <7> 505.69;

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

set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.0158, <2> 13.0671, <3> 24.8537, <4> 17.343, <5> 20.4734, <6> 29.8529, <7> 24.7713, <8> 23.0585, <9> 22.2933, <10> 25.4546, <11> 27.19, <12> 27.3787, <13> 23.8653, <14> 32.9156, <15> 29.876, <16> 30.2936, <17> 27.7752, <18> 27.7577, <19> 21.3252, <20> 33.7078;
param workload[JOB] := <1> 24.0158, <2> 13.0671, <3> 24.8537, <4> 17.343, <5> 20.4734, <6> 29.8529, <7> 24.7713, <8> 23.0585, <9> 22.2933, <10> 25.4546, <11> 27.19, <12> 27.3787, <13> 23.8653, <14> 32.9156, <15> 29.876, <16> 30.2936, <17> 27.7752, <18> 27.7577, <19> 21.3252, <20> 33.7078;
param capacity[MACHINE] := <1> 54.3503, <2> 54.3503, <3> 54.3503, <4> 54.3503, <5> 54.3503, <6> 54.3503, <7> 54.3503;

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

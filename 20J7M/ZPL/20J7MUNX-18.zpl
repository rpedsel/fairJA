set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.8843, <2> 10.4943, <3> 11.0574, <4> 0.7459, <5> 11.2281, <6> 39.4063, <7> 33.9369, <8> 20.541, <9> 33.9914, <10> 42.0412, <11> 46.9352, <12> 43.9043, <13> 9.6446, <14> 36.8691, <15> 16.3451, <16> 41.5784, <17> 3.0144, <18> 40.0478, <19> 47.7259, <20> 43.8071;
param workload[JOB] := <1> 3.2991, <2> 3.2395, <3> 3.3253, <4> 0.8637, <5> 3.3508, <6> 6.2774, <7> 5.8255, <8> 4.5322, <9> 5.8302, <10> 6.4839, <11> 6.8509, <12> 6.626, <13> 3.1056, <14> 6.072, <15> 4.0429, <16> 6.4481, <17> 1.7362, <18> 6.3283, <19> 6.9084, <20> 6.6187;
param capacity[MACHINE] := <1> 97.7647, <2> 97.7647, <3> 97.7647, <4> 97.7647, <5> 97.7647, <6> 97.7647, <7> 97.7647;

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

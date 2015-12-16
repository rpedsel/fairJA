set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.2549, <2> 2.0267, <3> 12.8051, <4> 41.3229, <5> 3.4616, <6> 36.4357, <7> 42.5222, <8> 48.739, <9> 46.9848, <10> 9.0843, <11> 0.817, <12> 45.3415, <13> 15.195, <14> 31.7014, <15> 44.527, <16> 5.1735, <17> 35.3053, <18> 1.2973, <19> 15.4455, <20> 12.2514;
param workload[JOB] := <1> 6.1037, <2> 1.4236, <3> 3.5784, <4> 6.4283, <5> 1.8605, <6> 6.0362, <7> 6.5209, <8> 6.9813, <9> 6.8545, <10> 3.014, <11> 0.9039, <12> 6.7336, <13> 3.8981, <14> 5.6304, <15> 6.6729, <16> 2.2745, <17> 5.9418, <18> 1.139, <19> 3.9301, <20> 3.5002;
param capacity[MACHINE] := <1> 11.1782, <2> 11.1782, <3> 11.1782, <4> 11.1782, <5> 11.1782, <6> 11.1782;

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

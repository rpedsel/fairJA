set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.7694, <2> 43.1602, <3> 47.5684, <4> 7.1796, <5> 15.6572, <6> 9.3179, <7> 34.148, <8> 38.2096, <9> 46.3711, <10> 18.9037, <11> 8.6747, <12> 40.9355, <13> 2.2389, <14> 7.9374, <15> 17.9801, <16> 16.3981, <17> 0.6113, <18> 3.6391, <19> 16.1824, <20> 20.8517;
param workload[JOB] := <1> 10.7694, <2> 43.1602, <3> 47.5684, <4> 7.1796, <5> 15.6572, <6> 9.3179, <7> 34.148, <8> 38.2096, <9> 46.3711, <10> 18.9037, <11> 8.6747, <12> 40.9355, <13> 2.2389, <14> 7.9374, <15> 17.9801, <16> 16.3981, <17> 0.6113, <18> 3.6391, <19> 16.1824, <20> 20.8517;
param capacity[MACHINE] := <1> 67.7891, <2> 67.7891, <3> 67.7891, <4> 67.7891, <5> 67.7891, <6> 67.7891;

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

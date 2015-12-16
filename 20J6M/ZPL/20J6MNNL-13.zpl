set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.359, <2> 24.1028, <3> 16.7177, <4> 18.3342, <5> 21.6549, <6> 27.4683, <7> 26.0616, <8> 19.6751, <9> 31.047, <10> 22.5458, <11> 24.3807, <12> 26.478, <13> 28.0001, <14> 33.3618, <15> 32.9324, <16> 24.813, <17> 25.4132, <18> 28.7288, <19> 21.4465, <20> 16.4114;
param workload[JOB] := <1> 23.359, <2> 24.1028, <3> 16.7177, <4> 18.3342, <5> 21.6549, <6> 27.4683, <7> 26.0616, <8> 19.6751, <9> 31.047, <10> 22.5458, <11> 24.3807, <12> 26.478, <13> 28.0001, <14> 33.3618, <15> 32.9324, <16> 24.813, <17> 25.4132, <18> 28.7288, <19> 21.4465, <20> 16.4114;
param capacity[MACHINE] := <1> 492.9323, <2> 492.9323, <3> 492.9323, <4> 492.9323, <5> 492.9323, <6> 492.9323;

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

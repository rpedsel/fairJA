set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.283, <2> 10.8193, <3> 33.3546, <4> 13.6288, <5> 16.212, <6> 25.8091, <7> 3.925, <8> 14.4063, <9> 14.5683, <10> 22.9338, <11> 27.0328, <12> 6.112, <13> 12.1262, <14> 3.0041, <15> 46.8141, <16> 23.0029, <17> 32.4017, <18> 11.7305, <19> 24.8058, <20> 7.0891;
param workload[JOB] := <1> 19.283, <2> 10.8193, <3> 33.3546, <4> 13.6288, <5> 16.212, <6> 25.8091, <7> 3.925, <8> 14.4063, <9> 14.5683, <10> 22.9338, <11> 27.0328, <12> 6.112, <13> 12.1262, <14> 3.0041, <15> 46.8141, <16> 23.0029, <17> 32.4017, <18> 11.7305, <19> 24.8058, <20> 7.0891;
param capacity[MACHINE] := <1> 53.7663, <2> 53.7663, <3> 53.7663, <4> 53.7663, <5> 53.7663, <6> 53.7663, <7> 53.7663;

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

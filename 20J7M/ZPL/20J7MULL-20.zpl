set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.2174, <2> 5.4797, <3> 10.1856, <4> 25.6343, <5> 5.6536, <6> 13.3638, <7> 9.0341, <8> 45.2835, <9> 11.2969, <10> 25.3764, <11> 27.8879, <12> 44.9241, <13> 48.3261, <14> 12.9978, <15> 29.5032, <16> 24.0088, <17> 19.7644, <18> 16.71, <19> 0.4399, <20> 16.7828;
param workload[JOB] := <1> 39.2174, <2> 5.4797, <3> 10.1856, <4> 25.6343, <5> 5.6536, <6> 13.3638, <7> 9.0341, <8> 45.2835, <9> 11.2969, <10> 25.3764, <11> 27.8879, <12> 44.9241, <13> 48.3261, <14> 12.9978, <15> 29.5032, <16> 24.0088, <17> 19.7644, <18> 16.71, <19> 0.4399, <20> 16.7828;
param capacity[MACHINE] := <1> 61.6958, <2> 61.6958, <3> 61.6958, <4> 61.6958, <5> 61.6958, <6> 61.6958, <7> 61.6958;

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

set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.7023, <2> 31.6718, <3> 22.7541, <4> 23.703, <5> 15.7535, <6> 24.5044, <7> 25.4315, <8> 21.3429, <9> 23.9078, <10> 21.4803;
param workload[JOB] := <1> 20.7023, <2> 31.6718, <3> 22.7541, <4> 23.703, <5> 15.7535, <6> 24.5044, <7> 25.4315, <8> 21.3429, <9> 23.9078, <10> 21.4803;
param capacity[MACHINE] := <1> 57.8129, <2> 57.8129, <3> 57.8129;

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

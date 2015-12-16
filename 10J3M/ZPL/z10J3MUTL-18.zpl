set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.1076, <2> 18.7495, <3> 28.1035, <4> 27.9953, <5> 34.1614, <6> 10.5794, <7> 46.8485, <8> 39.2363, <9> 33.7344, <10> 18.7901;
param workload[JOB] := <1> 29.1076, <2> 18.7495, <3> 28.1035, <4> 27.9953, <5> 34.1614, <6> 10.5794, <7> 46.8485, <8> 39.2363, <9> 33.7344, <10> 18.7901;
param capacity[MACHINE] := <1> 71.8265, <2> 71.8265, <3> 71.8265;

var x[JM] binary;
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

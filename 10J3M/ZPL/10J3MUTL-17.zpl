set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.5215, <2> 34.5119, <3> 43.6475, <4> 36.9032, <5> 38.7676, <6> 4.0111, <7> 23.1057, <8> 19.9651, <9> 35.0655, <10> 46.2636;
param workload[JOB] := <1> 44.5215, <2> 34.5119, <3> 43.6475, <4> 36.9032, <5> 38.7676, <6> 4.0111, <7> 23.1057, <8> 19.9651, <9> 35.0655, <10> 46.2636;
param capacity[MACHINE] := <1> 81.6907, <2> 81.6907, <3> 81.6907;

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

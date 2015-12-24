set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.0501, <2> 39.0267, <3> 7.7187, <4> 9.18, <5> 3.2109, <6> 34.6076, <7> 46.775, <8> 21.3061, <9> 40.2745, <10> 41.6881;
param workload[JOB] := <1> 16.0501, <2> 39.0267, <3> 7.7187, <4> 9.18, <5> 3.2109, <6> 34.6076, <7> 46.775, <8> 21.3061, <9> 40.2745, <10> 41.6881;
param capacity[MACHINE] := <1> 259.8377, <2> 259.8377, <3> 259.8377;

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

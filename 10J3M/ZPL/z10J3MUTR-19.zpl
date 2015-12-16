set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.6879, <2> 3.3385, <3> 12.6415, <4> 27.6495, <5> 8.8905, <6> 7.003, <7> 18.6599, <8> 35.7519, <9> 43.1366, <10> 12.9189;
param workload[JOB] := <1> 42.7273, <2> 26.5105, <3> 26.1746, <4> 22.7327, <5> 18.9603, <6> 5.4545, <7> 38.8656, <8> 24.2561, <9> 39.6699, <10> 45.2844;
param capacity[MACHINE] := <1> 72.659, <2> 72.659, <3> 72.659;

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

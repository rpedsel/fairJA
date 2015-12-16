set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.2048, <2> 34.325, <3> 17.2902, <4> 34.1181, <5> 6.6025, <6> 37.9223, <7> 24.6037, <8> 46.9967, <9> 47.5082, <10> 46.8812;
param workload[JOB] := <1> 5.6749, <2> 5.8588, <3> 4.1581, <4> 5.8411, <5> 2.5695, <6> 6.1581, <7> 4.9602, <8> 6.8554, <9> 6.8926, <10> 6.847;
param capacity[MACHINE] := <1> 18.6052, <2> 18.6052, <3> 18.6052;

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

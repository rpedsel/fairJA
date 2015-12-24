set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.4393, <2> 25.9863, <3> 29.5353, <4> 23.755, <5> 24.2889, <6> 31.1336, <7> 22.1217, <8> 27.2518, <9> 19.3543, <10> 20.5525;
param workload[JOB] := <1> 5.9531, <2> 5.0977, <3> 5.4346, <4> 4.8739, <5> 4.9284, <6> 5.5797, <7> 4.7034, <8> 5.2203, <9> 4.3994, <10> 4.5335;
param capacity[MACHINE] := <1> 12.681, <2> 12.681, <3> 12.681;

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

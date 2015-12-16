set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.2699, <2> 19.3267, <3> 22.0992, <4> 22.9501, <5> 21.1087, <6> 22.3439, <7> 31.521, <8> 27.8937, <9> 23.9108, <10> 25.5556;
param workload[JOB] := <1> 1243.9658, <2> 373.5213, <3> 488.3746, <4> 526.7071, <5> 445.5772, <6> 499.2499, <7> 993.5734, <8> 778.0585, <9> 571.7264, <10> 653.0887;
param capacity[MACHINE] := <1> 6573.8429, <2> 6573.8429, <3> 6573.8429;

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

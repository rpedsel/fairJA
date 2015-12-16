set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.6477, <2> 17.7823, <3> 19.3868, <4> 25.3698, <5> 20.2553, <6> 19.6484, <7> 24.6397, <8> 24.3492, <9> 31.6268, <10> 15.6231;
param workload[JOB] := <1> 29.3248, <2> 28.9702, <3> 44.2983, <4> 40.6141, <5> 38.4169, <6> 25.418, <7> 3.0007, <8> 17.2973, <9> 40.6817, <10> 40.8435;
param capacity[MACHINE] := <1> 77.2164, <2> 77.2164, <3> 77.2164;

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

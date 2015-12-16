set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.2834, <2> 25.5909, <3> 26.758, <4> 25.3317, <5> 23.1856, <6> 30.3462, <7> 27.5988, <8> 28.4289, <9> 29.6404, <10> 32.5266;
param workload[JOB] := <1> 33.4683, <2> 48.3877, <3> 35.528, <4> 30.1263, <5> 21.1211, <6> 27.6885, <7> 28.1262, <8> 1.2897, <9> 30.3856, <10> 13.3859;
param capacity[MACHINE] := <1> 89.8358, <2> 89.8358, <3> 89.8358;

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

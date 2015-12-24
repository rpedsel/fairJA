set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.4579, <2> 27.9492, <3> 25.1999, <4> 32.597, <5> 23.4294, <6> 14.775, <7> 22.604, <8> 32.3704, <9> 19.2699, <10> 24.4323;
param workload[JOB] := <1> 4.9455, <2> 5.2867, <3> 5.02, <4> 5.7094, <5> 4.8404, <6> 3.8438, <7> 4.7544, <8> 5.6895, <9> 4.3897, <10> 4.9429;
param capacity[MACHINE] := <1> 12.3556, <2> 12.3556, <3> 12.3556;

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

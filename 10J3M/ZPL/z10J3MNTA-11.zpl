set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.432, <2> 20.2141, <3> 27.5736, <4> 31.0704, <5> 24.3859, <6> 21.5981, <7> 28.7929, <8> 33.9448, <9> 26.4306, <10> 26.4473;
param workload[JOB] := <1> 270.0106, <2> 408.6098, <3> 760.3034, <4> 965.3698, <5> 594.6721, <6> 466.4779, <7> 829.0311, <8> 1152.2494, <9> 698.5766, <10> 699.4597;
param capacity[MACHINE] := <1> 1711.1901, <2> 1711.1901, <3> 1711.1901;

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

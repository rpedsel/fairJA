set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.2515, <2> 29.4432, <3> 24.9211, <4> 26.2708, <5> 17.1029, <6> 24.0938, <7> 24.1998, <8> 16.2814, <9> 33.3889, <10> 26.6769;
param workload[JOB] := <1> 22.2515, <2> 29.4432, <3> 24.9211, <4> 26.2708, <5> 17.1029, <6> 24.0938, <7> 24.1998, <8> 16.2814, <9> 33.3889, <10> 26.6769;
param capacity[MACHINE] := <1> 61.1576, <2> 61.1576, <3> 61.1576;

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

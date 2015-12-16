set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.1094, <2> 26.8179, <3> 22.4039, <4> 30.793, <5> 19.285, <6> 24.1825, <7> 27.5336, <8> 26.7567, <9> 27.5552, <10> 24.4963;
param workload[JOB] := <1> 5.2067, <2> 5.1786, <3> 4.7333, <4> 5.5491, <5> 4.3915, <6> 4.9176, <7> 5.2472, <8> 5.1727, <9> 5.2493, <10> 4.9494;
param capacity[MACHINE] := <1> 16.8651, <2> 16.8651, <3> 16.8651;

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
